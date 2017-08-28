---
--- Created by Mark.
--- DateTime: 28-8-2017 12:30
---

--[[
  pizza script v0.02
  created by: professional pizza


  -- make a persistent menu that does not get recreated every single time
  -- functionality:
  -- Bhop
  -- ESP
  -- aimbot
  -- spambot
]]

-- create vars
pizza = {
  CreateClientConVar( "Bhop", "1", true, false ),
  CreateClientConVar( "esp", "1", true, false ),
  CreateClientConVar( "aimbot", "1", true, false ),
  CreateClientConVar( "spambot", "1", true, false ),
  CreateClientConVar( "message", "test", true, false )
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
concommand.Add ("pizza_menu", function()
    --- set the color for the buttons
    local textColor = Color( 255, 255, 255 )
    local offColor = Color( 53, 70, 175 )
    local onColor = Color( 84, 216, 42 )

    --- create a Frame for the menu
    local Frame = vgui.Create( "DFrame" )
    Frame:SetTitle( "Pizza V0.02    user: " .. LocalPlayer():Nick() )
    Frame:SetVisible( true )
    Frame:SetDraggable( true )
    Frame:ShowCloseButton( true )
    Frame:SetSize( 500, 200)
    Frame:Center()
    Frame:MakePopup()

    --- create bunny hop button
    local BhopButton = vgui.Create( "DButton", Frame )
    if GetConVarNumber( "Bhop" ) == 0 then
        BhopButton:SetText( "Bhop OFF", "MyFont")
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
    BhopButton:SetPos( 5, 30 )
    BhopButton:SetSize( 100, 30 )

    --- create an action to do when the Bhop button is pressed
    BhopButton.DoClick = function()
        if GetConVarNumber( "Bhop" ) == 0 then
            BhopButton:SetText( "Bhop ON" )
            BhopButton.Paint = function( self, w, h )
                draw.RoundedBox( 0, 0, 0, w, h, onColor ) -- Draw a green button
            end
            RunConsoleCommand("Bhop", "1")
        elseif GetConVarNumber( "Bhop" ) == 1 then
            BhopButton:SetText( "Bhop OFF" )
            BhopButton.Paint = function( self, w, h )
                draw.RoundedBox( 0, 0, 0, w, h, offColor ) -- Draw a blue button
            end
            RunConsoleCommand("Bhop", "0")
        end
    end
end)

--- create bhop function
local function Bhop()
    if GetConVarNumber( "Bhop" ) == 1 then
        if input.IsKeyDown(KEY_SPACE) then
            if LocalPlayer():OnGround() then
                RunConsoleCommand("+jump")
                timer.Create("Bhop", 0, 1, function()
                    RunConsoleCommand("-jump")
                end )
            end
        end
    end
end

--- create aimbot function
local function aimbot()

end

--- create spambot function
local function spambot()
    if GetConVarNumber( "spambot" ) == 1 then
        RunConsoleCommand( "say", GetConVarString( "message" ) )
    end
end

--- add the hooks that should always be on to avoid troubles
--- might need to be changed to add/remove hooks on button presses
--- if it takes to much cpu
hook.Add( "Think", "BunnyHop", Bhop )
hook.Add( "Think", "aimbot", aimbot )
hook.Add( "Think", "spambot", spambot )

main()