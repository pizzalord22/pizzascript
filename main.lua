-- Pizza script created by Professional Pizza
--
-- ideas
-- chat spam
-- ----------------
-- Custom message
-- advertisement
-- admin chat spam
--
-- credits
-- -noono
-- -GAY

-- server commands
-- concommand.Add( "retrieveplayers", function()
--   for _, ply in ipairs( player.GetAll() ) do
--    print( ply:Nick() .. ", " .. ply:SteamID() .. "\n" )
--  end
-- end )

-- client commands

-- create a menu
concommand.Add( "pizza_menu", function()
  -- set the Text color for the button
  local TextColor = 78, 215, 42
  
  -- create a DFrame
  local Frame = vgui.Create( "DFrame" )
  Frame.SetTitle( "Pizza script v0.01" ) -- user:" .. LocalPlayer():Nick()
  Frame.Center()
  Frame.SetSize( 300, 300 )
  Frame.MakePopup()
   
  -- Create the button that toggles bhopping
  local Bhop = vgui.Create( "DButton", Frame)
  Bhop:SetText( "Bhop toggle" )
  Bhop.SetTextColor( TextColor )
  Bhop:SetSize( 100, 30 )
  Bhop:SetPos( 5, 5 )
  Bhop.Paint = function( self, w, h )
    draw.RoundedBox( 0, 0, 0, w, h, Color( 41, 128, 185, 250 ) ) -- Draw a blue button
  end
  
  -- Create the button for toggling the spam
  local Spam = vgui.Create( "DTextEntry", Frame )
  Spam:SetText( "Spam message" )
  Spam:SetTextColor( TextColor )
  Spam:SetSize( 100, 30 )
  Spam:SetPos(5, 40)
  Spam.Paint = function( self, w, h )
    draw.RoundedBox( 0, 0, 0, w, h, Color( 41, 128, 185, 250 ) ) -- Draw a blue button
  end
  
  local SpamMSG = vgui.Create( "DButton", Frame )
  SpamMSG:SetSize( 100, 30 )
  SpamMSG:SetPos( 5, 70 )
  SpamMSG:SetText( "spam message" )
  NameEntry.OnEnter = function( self )
    MSG = self:GetValue()
    print( "Spam message: " .. MSG )
  end
  SpamMSG.Paint = function( self, w, h )
    draw.RoundedBox( 0, 0, 0, w, h, Color( 41, 128, 185, 250 ) ) -- Draw a blue button
  end
  
  Bhop.DoClick = function()
    if bhop == 0 then
      bhop = 1
    else
      bhop = 0
      bhop()
    end
  end
  
  Spam.DoClick = function()
    if spam == 0 then
      spam = 1
      hook.Remove("spamhook")
    else
      spam = 0
      hook.Add( "Think", "spamhook", spamChat )
    end
  end
    
  -- ply.AddText( Color( 0, 0, 0 ), "[ ", Color( 78, 215, 42 ), ply," opend the menu ", Color( 0, 0, 0 ), "]" )
end )


local function bhop()
  
end

local function spamChat()
  LocalPlayer():ConCommand ( "say ".. msg )
  if spam == 1 then
    timer.Create("Spamming", 1,0, Spam)
  elseif spam == 0 then
    timer.remove( "Spamming" )
  end
end

