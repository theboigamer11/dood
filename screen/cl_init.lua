include("entities/screen/shared.lua")

function ENT:Draw()
	self:DrawModel()
end

 concommand.Add( "startpcDONOTUSE", function(ply, cmd, args)
	pcMenu()
 end)

function pcMenu()
	local won = false
	local Frame = vgui.Create( "DFrame" )
	Frame:SetTitle( "windows" )
	Frame:SetSize( 1000,720 )
	Frame:SetSizable(false)
	Frame:SetDraggable(false)
	Frame:ShowCloseButton(true)
	Frame:SetDeleteOnClose(true)
	Frame:Center()			
	Frame:MakePopup()
	Frame.Paint = function( self, w, h ) -- 'function Frame:Paint( w, h )' works too
		draw.RoundedBox( 0, 0, 0, w, h, Color( 3, 127, 252, 255 ) ) -- Draw a red box instead of the frame
	end
			
	local time = vgui.Create("DLabel", Frame)
	time:SetPos(880,680)
	time:SetSize( 125, 20 )
	time:SetText(os.date( "%a, %I:%M:%S %p" ))
	
	local date = vgui.Create("DLabel", Frame)
	date:SetPos(900,690)
	date:SetText(os.date( "%m/%d/20%y" ))
	
	local Button = vgui.Create("DButton", Frame)
	Button:SetText( "W" )
	Button:SetTextColor( Color(255,255,255) )
	Button:SetPos( 10, 680 )
	Button:SetSize( 75, 20 )
	Button.Paint = function( self, w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color( 43, 43, 43, 150 ) ) -- Draw a blue button. NO
	end
	Button.DoClick = function()
	if won == false then
		won = true
			local Button2 = vgui.Create("DButton", Frame)
				Button2:SetText( "shut down" )
				Button2:SetTextColor( Color(255,255,255) )
				Button2:SetPos( 10, 640 )
				Button2:SetSize( 75, 20 )
				Button2.Paint = function( self, w, h )
					draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 255 ) ) -- Draw a blue button. NO
				end
				Button2.DoClick = function()
					Frame:Close() 
				end
				
				local Button3 = vgui.Create("DButton", Frame)
				Button3:SetText( "google" )
				Button3:SetTextColor( Color(255,255,255) )
				Button3:SetPos( 10, 600 )
				Button3:SetSize( 75, 20 )
				Button3.Paint = function( self, w, h )
				draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 255 ) ) -- Draw a blue button. NO
				end
			Button3.DoClick = function()
				local htmlframe = vgui.Create( "DFrame" )
				htmlframe:Center()
				htmlframe:SetSize(800,600)
				htmlframe:ShowCloseButton(true)
				htmlframe:MakePopup()
					
				local html = vgui.Create("HTML", htmlframe)
				html:Dock(FILL)
				html:OpenURL("https://www.google.com/")
						
				local htmlcontrols = vgui.Create("DHTMLControls", htmlframe)
				htmlcontrols:Dock(TOP)
				htmlcontrols:SetHTML(html)
				htmlcontrols.AddressBar:SetText("https://www.google.com/")
			end
			elseif won == true then
			Button2:Close()
			won = false
		end
	end
end