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
pizza = CreateClientConVar( "Bhop", "1", true, false )
print( GetConVarString( "Bhop" ) )

-- create an initial function
function main()
  chat.AddText( Color( 0, 0, 0 ), "[", Color( 30, 220, 0 ), " pizza v0.01 started ", Color( 0, 0, 0 ), "]" )  
  bhop = 0
  esp = 0
  spam = 0
  MSG = "spam message"
end


-- create a menu command and a menu
concommand.Add ("pizza_menu", function()
  -- set the color for the buttons
  local textColor = Color( 255, 255, 255 )
  local offColor = Color( 53, 70, 175 )
  local onColor = Color( 84, 216, 42 )
  
  -- create a Frame for the menu
  local Frame = vgui.Create( "DFrame" )
  Frame:SetTitle( "Pizza V0.01    user: " .. LocalPlayer():Nick() )
  Frame:SetVisible( true )
  Frame:SetDraggable( true )
  Frame:ShowCloseButton( true )
  Frame:SetSize( 500, 200)
  Frame:Center() 
  Frame:MakePopup()
  
  -- create bunny hop button
  local BhopButton = vgui.Create( "DButton", Frame )
  BhopButton:SetText( "Bhop OFF" )
  BhopButton:SetTextColor( textColor )
  BhopButton:SetPos( 5, 30 )
  BhopButton:SetSize( 100, 30 )
  BhopButton.Paint = function( self, w, h )
    draw.RoundedBox( 0, 0, 0, w, h, offColor ) -- Draw a blue button
  end
  
  -- create an action to do when the Bhop button is pressed
  Bhop.DoClick = function()
    if pizza.Bhop == 1 then
      hook.add( "Think", "Bhop", Bhop )
      BhopButton.Paint = function( self, w, h )
        draw.RoundedBox( 0, 0, 0, w, h, onColor ) -- Draw a green button
      end
      pizza.Bhop = 0
    else
      hook.remove( "Think", "Bhop" )
      BhopButton.Paint = function( self, w, h )
        draw.RoundedBox( 0, 0, 0, w, h, offColor ) -- Draw a blue button
      end
      pizza.Bhop = 1
    end
  end
end)

local function Bhop()
  if pizza.Bhop == 1 then
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
