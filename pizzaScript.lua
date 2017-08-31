---
--- Created by Mark.
--- DateTime: 28-8-2017 12:30
---

--[[
  pizza script v0.02
  created by: professional pizza
  ==========================
  ||         todo         ||
  ==========================
  -- make a persistent menu that does not get recreated every single time works
  -- functionality:
  -- Bhop       works
  -- ESP        works
  -- aimbot     WIP
  -- spambot    works

  ==========================
  ||         ideas        ||
  ==========================
  -- change button text color depending on the background color for better readability
]]

-- create vars
-- 1 is on, 0 is off (1 = true, 0 = false)
pizza = {
    CreateClientConVar( "Bhop", "1", true, false ),
    CreateClientConVar( "esp", "0", true, false ),
    CreateClientConVar( "aimbot", "0", true, false ),
    CreateClientConVar( "aimtbotShootTeam", "1", true, false ),
    CreateClientConVar( "aimtbotShootBuddy", "1", true, false ),
    CreateClientConVar( "spambot", "0", true, false ),
    CreateClientConVar( "message", "message", true, false )
}
print( "bhop: " .. GetConVarNumber( "Bhop" ) )
print( "esp: " .. GetConVarNumber( "esp" ) )
print( "aimbot: " .. GetConVarNumber( "aimbot" ) )
print( "spambot: " .. GetConVarNumber( "spambot" ) )
print( "message: " .. GetConVarString( "message" ) )

--- create a text when the hack is loaded
function main()
    chat.AddText( Color( 0, 0, 0 ), "[", Color( 30, 220, 0 ), " pizza v0.02 started ", Color( 0, 0, 0 ), "]" )
    chat.AddText( Color( 0, 0, 0 ), "[", Color( 30, 220, 0 ), " have fun =) ", Color( 0, 0, 0 ), "]" )
end

--- create a menu command and a menu
concommand.Add( "pizza_menu", function()
    --- set the color for the buttons
    local textColor = Color( 255, 255, 255 )
    local offColor = Color( 53, 70, 175 )
    local onColor = Color( 84, 216, 42 )

    --- create row vars ( y distance in pixels )
    local rowOne = 30
    local rowTwo = 75
    local rowThree = 120

    --- create line vars ( x distance in pixels )
    local lineOne = 10
    local lineTwo = 120
    local lineThree = 230

    --- create a Frame for the menu
    local Frame = vgui.Create( "DFrame" )
    Frame:SetTitle( "Pizza V0.02    user: " .. LocalPlayer():Nick() )
    Frame:SetVisible( true )
    Frame:SetDraggable( true )
    Frame:ShowCloseButton( true )
    Frame:SetSize( 400, 200)
    Frame:Center()
    Frame:MakePopup()
    Frame.Paint = function()
        draw.RoundedBox( 0, 0, 0, Frame:GetWide(), Frame:GetTall(), Color( 0, 0, 0 ) )
    end

    --- create bunny hop button
    local BhopButton = vgui.Create( "DButton", Frame )
    if GetConVarNumber( "Bhop" ) == 0 then
        BhopButton:SetText( "Bhop OFF")
        BhopButton.Paint = function( self, w, h )
            draw.RoundedBox( 0, 0, 0, w, h, offColor ) -- Draw a blue button
        end
    elseif GetConVarNumber( "Bhop" ) == 1 then
        BhopButton:SetText( "Bhop ON" )
        BhopButton.Paint = function( self, w, h )
            draw.RoundedBox( 0, 0, 0, w, h, onColor ) -- Draw a green button
        end
    end
    BhopButton:SetTextColor( textColor )
    BhopButton:SetFont( "Trebuchet20" )
    BhopButton:SetPos( lineOne, rowOne )
    BhopButton:SetSize( 100, 30 )

    --- create spam button
    local SpamButton = vgui.Create( "DButton", Frame  )
    if GetConVarNumber( "spambot" ) == 0 then
        SpamButton:SetText( "spam OFF" )
        SpamButton.Paint = function( self, w, h )
            draw.RoundedBox( 0, 0, 0, w, h, offColor ) -- Draw a blue button
        end
    elseif GetConVarNumber( "spambot" ) == 1 then
        SpamButton:SetText( "spam ON" )
        SpamButton.Paint = function( self, w, h )
            draw.RoundedBox( 0, 0, 0, w, h, onColor ) -- Draw a green button
        end
    end
    SpamButton:SetTextColor( textColor )
    SpamButton:SetFont( "Trebuchet20" )
    SpamButton:SetPos( lineOne, rowTwo )
    SpamButton:SetSize( 100, 30 )

    local EspButton = vgui.Create( "DButton", Frame )
    if GetConVarNumber( "esp" ) == 0 then
        EspButton:SetText( "esp OFF" )
        EspButton.Paint = function( self, w, h )
            draw.RoundedBox( 0, 0, 0, w, h, offColor )
        end
    elseif GetConVarNumber( "esp" ) == 1 then
        EspButton:SetText( "esp ON" )
        EspButton.Paint = function( self, w, h )
            draw.RoundedBox( 0, 0, 0, w, h, onColor )
        end
    end
    EspButton:SetTextColor( textColor )
    EspButton:SetFont( "Trebuchet20" )
    EspButton:SetPos( lineOne, rowThree )
    EspButton:SetSize( 100, 30 )

    --- create input field for the spambot
    local SpamMessaage = vgui.Create( "DTextEntry", Frame ) -- create the form as a child of frame
    SpamMessaage:SetPos( lineTwo, rowTwo )
    SpamMessaage:SetSize( 100, 30 )
    SpamMessaage:SetText( GetConVarString( "message" ) )
    SpamMessaage.OnEnter = function( self )
        RunConsoleCommand( "message", self:GetValue())
    end
    --- create an action to do when the Bhop button is pressed
    BhopButton.DoClick = function()
        if GetConVarNumber( "Bhop" ) == 0 then
            BhopButton:SetText( "Bhop ON" )
            BhopButton.Paint = function( self, w, h )
                draw.RoundedBox( 0, 0, 0, w, h, onColor ) -- Draw a green button
            end
            RunConsoleCommand( "Bhop", "1" )
        elseif GetConVarNumber( "Bhop" ) == 1 then
            BhopButton:SetText( "Bhop OFF" )
            BhopButton.Paint = function( self, w, h )
                draw.RoundedBox( 0, 0, 0, w, h, offColor ) -- Draw a blue button
            end
            RunConsoleCommand( "Bhop", "0" )
        end
    end

    --- create an action to do when the spam button is clicked
    SpamButton.DoClick = function()
        if GetConVarNumber( "spambot" ) == 0 then
            SpamButton:SetText( "spam ON" )
            SpamButton.Paint = function( self, w, h )
                draw.RoundedBox( 0, 0, 0, w, h, onColor ) -- Draw a green button
            end
            RunConsoleCommand( "spambot", "1" )
        elseif GetConVarNumber( "spambot" ) == 1 then
            SpamButton:SetText( "spam OFF" )
            SpamButton.Paint = function( self, w, h )
                draw.RoundedBox( 0, 0, 0, w, h, offColor )
            end
            RunConsoleCommand( "spambot", "0" )
        end
    end

    EspButton.DoClick = function()
        if GetConVarNumber( "esp" ) == 0 then
            EspButton:SetText( "esp ON" )
            EspButton.Paint = function( self, w, h)
                draw.RoundedBox( 0, 0, 0, w, h, onColor)
            end
            RunConsoleCommand( "esp", "1" )
        elseif GetConVarNumber( "esp" ) == 1 then
            EspButton:SetText( "esp OFF" )
            EspButton.Paint = function( self, w, h )
                draw.RoundedBox( 0, 0, 0, w, h, offColor)
            end
            RunConsoleCommand( "esp", "0" )
        end
    end

end)

--- create bhop function
local function Bhop()
    if GetConVarNumber( "Bhop" ) == 1 then
        if input.IsKeyDown(KEY_SPACE) then
            if LocalPlayer():OnGround() then
                RunConsoleCommand("+jump")
                timer.Create("Bhop", 0, 0.1, function()
                    RunConsoleCommand("-jump")
                end )
            end
        end
    end
end

local function esp()
    if GetConVarNumber("esp") == 1 then
        for k, v in pairs ( player.GetAll() ) do
            local plypos = (v:GetPos() + Vector(0,0,40)):ToScreen()
            if v == LocalPlayer() then
                draw.DrawText( "" , "TabLarge", plypos.x, plypos.y, Color(255,255,255), 1 )
            elseif v:IsAdmin() or v:IsSuperAdmin() then
                draw.DrawText( "" .. v:Name() .. "\n" .. team.GetName(v:Team()) .. "", "TabLarge", plypos.x, plypos.y, Color(255, 255,255), 1 )
                plypos = (v:GetPos() + Vector(0,0,15)):ToScreen()
                draw.DrawText( "" .. "\n[Admin]", "TabLarge", plypos.x, plypos.y, Color(220,60,90,255), 1 )
            else
                draw.DrawText( v:Name() .. "\n" .. team.GetName(v:Team()), "TabLarge", plypos.x, plypos.y, Color(255,255,255), 1 )
            end
        end
    end
end

--- create aimbot function
local function aimbot()
    --- find the nearest player
    --- if shoot team mates and shoot buddys are on then
    if GetConVarNumber( "aimbotShootTeam" ) == 1 and GetConVarNumber( "aimbotShootBuddy" ) == 1 then
        --- if shoot team mates is on and shoot buddy is off then
    elseif GetConVarNumber( "aimbotShootTeam") == 1 and GetConVarNumber( "aimbotShootBuddy" ) == 0 then
        --- if shoot team mates is off and shoot buddy is on then
    elseif GetConVarNumber( "aimbotShootTeam") == 0 and GetConVarNumber( "aimbotShootBuddy" ) == 1 then
        --- if shoot team mates and shoot buddy's are off then
    elseif GetConVarNumber( "aimbotShootTeam") == 0 and GetConVarNumber( "aimbotShootBuddy" ) == 0 then

    end
end

--- create spambot function
local function spambot()
    if GetConVarNumber( "spambot" ) == 1 then
        RunConsoleCommand( "say", GetConVarString( "message" ) )
    end
end

main()
--- add the hooks that should always be on to avoid troubles
--- might need to be changed to add/remove hooks on button presses
--- if it takes to much cpu
hook.Add( "Think", "BunnyHop", Bhop )
hook.Add( "Think", "aimbot", aimbot )
hook.Add( "Think", "spambot", spambot )
hook.Add( "HUDPaint", "esp", esp )