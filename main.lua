-- Pizza script v1
-- add
-- -------------
-- 1. working halo esp
-- 2. playername esp
-- 3. distance to player esp
-- 4. player user_group esp

function main()
  chat.AddText( Color( 0, 0, 0 ), "[", Color( 30, 220, 0 ), " pizza v0.01 started ", Color( 0, 0, 0 ), "]" )  
  bhop = 0
  esp = 0
  spam = 0
  MSG = "spam message"
end

concommand.Add ("pizza_menu", function()
-- create a frame
local Frame = vgui.Create( "DFrame" )
  Frame:SetTitle( "Pizza V0.01    user:" .. LocalPlayer():Nick() )
  Frame:SetVisible( true )
  Frame:SetDraggable( true )
  Frame:ShowCloseButton( true )
  Frame:SetSize( 500, 200)
  Frame:Center() 
  Frame:MakePopup()
 
 -- create buttons for the frame 
  local Button = vgui.Create( "DButton", Frame )
  Button:SetText( "Bhop OFF" )
  Button:SetTextColor( Color( 255, 255, 255 ) )
  Button:SetPos( 5, 30 )
  Button:SetSize( 100, 30 )
  Button.Paint = function( self, w, h )
    draw.RoundedBox( 0, 0, 0, w, h, Color( 41, 128, 185, 250 ) ) -- Draw a blue button
  end
  
  local ButtonEsp = vgui.Create( "DButton", Frame )
  ButtonEsp:SetText( "Halo OFF" )
  ButtonEsp:SetTextColor( Color( 255, 255, 255 ) )
  ButtonEsp:SetPos(5,65)
  ButtonEsp:SetSize( 100, 30 )
  ButtonEsp.Paint = function( self, w, h )
    draw.RoundedBox( 0, 0, 0, w, h, Color( 41, 128, 185, 250 ) ) -- Draw a blue button
  end
  
  local ButtonEspPlus = vgui.Create ( "DButton", Frame )
  ButtonEspPlus:SetText( "Get steam names" )
  ButtonEspPlus:SetTextColor( Color( 255, 255, 255 ) )
  ButtonEspPlus:SetPos(5,100)
  ButtonEspPlus:SetSize( 100, 30 )
  ButtonEspPlus.Paint = function( self, w, h )
    draw.RoundedBox( 0, 0, 0, w, h, Color( 41, 128, 185, 250 ) ) -- Draw a blue button
  end
  
  local ButtonSpam = vgui.Create ( "DButton", Frame )
  ButtonSpam:SetText( "Spam OFF" )
  ButtonSpam:SetTextColor( Color( 255, 255, 255 ) )
  ButtonSpam:SetPos(5,135)
  ButtonSpam:SetSize( 100, 30 )
  ButtonSpam.Paint = function( self, w, h )
    draw.RoundedBox( 0, 0, 0, w, h, Color( 41, 128, 185, 250 ) ) -- Draw a blue button
  end
  
  local SpamMSG = vgui.Create( "DTextEntry", Frame )
  SpamMSG:SetSize( 100, 30 )
  SpamMSG:SetPos( 115, 135 )
  SpamMSG:SetText( MSG )
  SpamMSG.OnEnter = function( self )
    MSG = self:GetValue()
    chat.AddText( Color( 0, 0, 0 ), "[", Color( 30, 220, 0 ), " spam message: " .. MSG, Color( 0, 0, 0 ), "]" )
  end
  
  -- button actions
  
  Button.DoClick = function()
    if bhop == 0 then
      bhop = 1
      Button:SetText( "Bhop ON" )
      hook.Add("Think", "bunnyHop", bunnyHop )
    else
      bhop = 0
      Button:SetText( "Bhop OFF" )
      hook.remove("Think", "bunnyHop")
    end
  end
  
  ButtonEsp.DoClick = function()
    if esp == 1 then
      esp = 0
      ButtonEsp:SetText( "Halo ONN" )
      hook.Remove( "PreDrawHalos", "esp" )
    else
      esp = 1
      ButtonEsp:SetText( "Halo OFF" )
      hook.Add( "PreDrawHalos", "esp", function()
        halo.Add( player.GetAll(), Color( 33, 210, 210 ), 0, 0, 2, true, true )
      end )
    end
  end
  
  ButtonEspPlus.DoClick = function()
    for k, v in pairs( player.GetAll() ) do
      print(k, v:Nick())    
    end
    chat.AddText( Color( 0, 0, 0 ), "[", Color( 30, 220, 0 ), " Look in the console ", Color( 0, 0, 0 ), "]" )  
  end
  
  ButtonSpam.DoClick = function()
    if spam == 1 then
      spam = 0
      ButtonSpam:SetText( "Spam OFF" )
      hook.Remove("spamhook")
    else
      spam = 1
      ButtonSpam:SetText( "Spam ON" )
      hook.Add( "Think", "spamhook", spamChat )
    end
  end
end)

-- functions

--[[local function bunnyHop()
  if bhop == 1 then
    if input.IsKeyDown(KEY_SPACE) then
      if LocalPlayer():OnGround() then
        RunConsoleCommand("+jump")
        timer.Create("Bhop", 0, 0.01, function()
          RunConsoleCommand("-jump")
        end )
      end
    end
  end
end
]]
local function spamChat()
  if spam == 1 then
    RunConsoleCommand( "say", MSG )
  end 
end
timer.Create( "Spam", 0.01, 0, spamChat )
main()



