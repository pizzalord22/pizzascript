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
end

concommand.Add ("pizza_menu", function()
local Frame = vgui.Create( "DFrame" )
  Frame:SetTitle( "Pizza v0.1" )
  Frame:SetVisible( true )
  Frame:SetDraggable( true )
  Frame:ShowCloseButton( true )
  Frame:SetSize( 300, 150)
  Frame:Center() 
  Frame:MakePopup()
  
  local Button = vgui.Create( "DButton", Frame )
  Button:SetText( "Toggle bhop" )
  Button:SetTextColor( Color( 255, 255, 255 ) )
  Button:SetPos( 5, 5 )
  Button:SetSize( 100, 30 )
  Button.Paint = function( self, w, h )
    draw.RoundedBox( 0, 0, 0, w, h, Color( 41, 128, 185, 250 ) ) -- Draw a blue button
  end
  
  local ButtonEsp = vgui.Create( "DButton", Frame )
  ButtonEsp:SetText( "Toggle esp" )
  ButtonEsp:SetTextColor( Color( 255, 255, 255 ) )
  ButtonEsp:SetPos(5,40)
  ButtonEsp:SetSize( 100, 30 )
  ButtonEsp.Paint = function( self, w, h )
    draw.RoundedBox( 0, 0, 0, w, h, Color( 41, 128, 185, 250 ) ) -- Draw a blue button
  end
  
  local ButtonEspPlus = vgui.Create ( "DButton", Frame )
  ButtonEspPlus:SetText( "Toggle esp+" )
  ButtonEspPlus:SetTextColor( Color( 255, 255, 255 ) )
  ButtonEspPlus:SetPos(5,75)
  ButtonEspPlus:SetSize( 100, 30 )
  ButtonEspPlus.Paint = function( self, w, h )
    draw.RoundedBox( 0, 0, 0, w, h, Color( 41, 128, 185, 250 ) ) -- Draw a blue button
  end
  
  
  Button.DoClick = function()
    if bhop == 1 then
      bhop = 0
      hook.Add("Think", "bunnyHop", bunnyHop )
    else
      bhop = 1
      hook.remove("Think", "bunnyHop")
    end
  end
  
  ButtonEsp.DoClick = function()
    if esp == 1 then
      hook.Remove( "PreDrawHalos", "esp" )
      esp = 0
    else
      esp = 1
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
end)

function bunnyHop()
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


main()



