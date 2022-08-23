function HUD()
	local ply = LocalPlayer()
	
	if !ply:Alive() then
		return
	end
	
	draw.RoundedBox(5, 0, ScrH() - 90, 250, 90, Color(50, 50, 50, 225))
	draw.SimpleText("Health "..ply:Health(), "DermaDefaultBold", 10, ScrH() - 45, Color(255,255,255,255), 0, 0)
	draw.SimpleText("Armor "..ply:Armor(), "DermaDefaultBold", 10, ScrH() - 80, Color(255,255,255,255), 0, 0)
	draw.RoundedBox(5, 10, ScrH() - 30, math.Clamp(ply:Health(), 0, 100) * 2.2, 15, Color(0, 255, 0 ,255))
	draw.RoundedBox(5, 10, ScrH() - 65, math.Clamp(ply:Armor(), 0, 100) * 2.2, 15, Color(0, 0, 255 ,255))
	draw.RoundedBox(5, 1800, ScrH() - 70, 125, 70, Color(50, 50, 50, 225))
	
	if(ply:GetActiveWeapon():IsValid()) then
		if(ply:GetActiveWeapon():Clip1() != -1) then
			draw.SimpleText("Ammo "..ply:GetActiveWeapon():Clip1().."/"..ply:GetAmmoCount(ply:GetActiveWeapon():GetPrimaryAmmoType()), "DermaDefaultBold", 1825, ScrH() - 40, Color(255,255,255,255), 0, 0)
		else
			draw.SimpleText("Ammo "..ply:GetAmmoCount(ply:GetActiveWeapon():GetPrimaryAmmoType()), "DermaDefaultBold", 1825, ScrH() - 40, Color(255,255,255,255), 0, 0)
		end
		
		if(ply:GetAmmoCount(ply:GetActiveWeapon():GetSecondaryAmmoType()) > 0) then
			draw.SimpleText("Secondary "..ply:GetAmmoCount(ply:GetActiveWeapon():GetSecondaryAmmoType()), "DermaDefaultBold", 1825, ScrH() - 25, Color(255,255,255,255), 0, 0)
		end
	end
end
hook.Add("HUDPaint", "Hud", HUD)

function HideHUD(name)
	for k, v in pairs({"CHudHealth","CHudBattery","CHudAmmo","CHudSecondaryAmmo"}) do
		if name == v then
			return false
		end
	end
end
hook.Add("HUDShouldDraw","HideDefaultHud", HideHUD)

net.Receive("FMenu",function()
	local Frame = vgui.Create( "DFrame" )
Frame:SetTitle( "spawn menu" )
Frame:SetSize( 1500,1000 )
Frame:Center()			
Frame:MakePopup()
		
local Button = vgui.Create("DButton", Frame)
Button:SetText( "watermelon" )
Button:SetTextColor( Color(255,255,255) )
Button:SetPos( 175, 100 )
Button:SetSize( 100, 30 )
Button.Paint = function( self, w, h )
	draw.RoundedBox( 0, 0, 0, w, h, Color( 41, 128, 185, 250 ) ) -- Draw a blue button
end
Button.DoClick = function()
	local ply = LocalPlayer()
	ply:ConCommand("prop_physics_create props_junk/watermelon01.mdl")
end

local Button = vgui.Create("DButton", Frame)
Button:SetText( "explosive berrel" )
Button:SetTextColor( Color(255,255,255) )
Button:SetPos( 50, 100 )
Button:SetSize( 100, 30 )
Button.Paint = function( self, w, h )
	draw.RoundedBox( 0, 0, 0, w, h, Color( 41, 128, 185, 250 ) ) -- Draw a blue button
end
Button.DoClick = function()
	local ply = LocalPlayer()
	ply:ConCommand("prop_physics_create props_c17/oildrum001_explosive.mdl")
end

local Button = vgui.Create("DButton", Frame)
Button:SetText( "vending machine" )
Button:SetTextColor( Color(255,255,255) )
Button:SetPos( 300, 100 )
Button:SetSize( 100, 30 )
Button.Paint = function( self, w, h )
	draw.RoundedBox( 0, 0, 0, w, h, Color( 41, 128, 185, 250 ) ) -- Draw a blue button
end
Button.DoClick = function()
	local ply = LocalPlayer()
	ply:ConCommand("prop_physics_create props_interiors/VendingMachineSoda01a.mdl")
end

local Button = vgui.Create("DButton", Frame)
Button:SetText( "chouch1" )
Button:SetTextColor( Color(255,255,255) )
Button:SetPos( 425, 100 )
Button:SetSize( 100, 30 )
Button.Paint = function( self, w, h )
	draw.RoundedBox( 0, 0, 0, w, h, Color( 41, 128, 185, 250 ) ) -- Draw a blue button
end
Button.DoClick = function()
	local ply = LocalPlayer()
	ply:ConCommand("prop_physics_create props_c17/FurnitureCouch001a.mdl")
end

local Button = vgui.Create("DButton", Frame)
Button:SetText( "chouch2" )
Button:SetTextColor( Color(255,255,255) )
Button:SetPos( 550, 100 )
Button:SetSize( 100, 30 )
Button.Paint = function( self, w, h )
	draw.RoundedBox( 0, 0, 0, w, h, Color( 41, 128, 185, 250 ) ) -- Draw a blue button
end
Button.DoClick = function()
	local ply = LocalPlayer()
	ply:ConCommand("prop_physics_create props_c17/FurnitureCouch002a.mdl")
end

local Button = vgui.Create("DButton", Frame)
Button:SetText( "cone" )
Button:SetTextColor( Color(255,255,255) )
Button:SetPos( 675, 100 )
Button:SetSize( 100, 30 )
Button.Paint = function( self, w, h )
	draw.RoundedBox( 0, 0, 0, w, h, Color( 41, 128, 185, 250 ) ) -- Draw a blue button
end
Button.DoClick = function()
	local ply = LocalPlayer()
	ply:ConCommand("prop_physics_create props_junk/TrafficCone001a.mdl")
end

local Button = vgui.Create("DButton", Frame)
Button:SetText( "table" )
Button:SetTextColor( Color(255,255,255) )
Button:SetPos( 800, 100 )
Button:SetSize( 100, 30 )
Button.Paint = function( self, w, h )
	draw.RoundedBox( 0, 0, 0, w, h, Color( 41, 128, 185, 250 ) ) -- Draw a blue button
end
Button.DoClick = function()
	local ply = LocalPlayer()
	ply:ConCommand("prop_physics_create props_c17/FurnitureTable002a.mdl")
end

local Button = vgui.Create("DButton", Frame)
Button:SetText( "small box" )
Button:SetTextColor( Color(255,255,255) )
Button:SetPos( 925, 100 )
Button:SetSize( 100, 30 )
Button.Paint = function( self, w, h )
	draw.RoundedBox( 0, 0, 0, w, h, Color( 41, 128, 185, 250 ) ) -- Draw a blue button
end
Button.DoClick = function()
	local ply = LocalPlayer()
	ply:ConCommand("prop_physics_create props_junk/wood_crate001a.mdl")
end

local Button = vgui.Create("DButton", Frame)
Button:SetText( "big box" )
Button:SetTextColor( Color(255,255,255) )
Button:SetPos( 1050, 100 )
Button:SetSize( 100, 30 )
Button.Paint = function( self, w, h )
	draw.RoundedBox( 0, 0, 0, w, h, Color( 41, 128, 185, 250 ) ) -- Draw a blue button
end
Button.DoClick = function()
	local ply = LocalPlayer()
	ply:ConCommand("prop_physics_create props_junk/wood_crate002a.mdl")
end

local Button = vgui.Create("DButton", Frame)
Button:SetText( "radio" )
Button:SetTextColor( Color(255,255,255) )
Button:SetPos( 1175, 100 )
Button:SetSize( 100, 30 )
Button.Paint = function( self, w, h )
	draw.RoundedBox( 0, 0, 0, w, h, Color( 41, 128, 185, 250 ) ) -- Draw a blue button
end
Button.DoClick = function()
	local ply = LocalPlayer()
	ply:ConCommand("prop_physics_create props_lab/citizenradio.mdl")
end

local Button = vgui.Create("DButton", Frame)
Button:SetText( "close this stupid grey box thats blocking my screen" )
Button:SetTextColor( Color(255,255,255) )
Button:SetPos( 50, 900 )
Button:SetSize( 1400, 60 )
Button.Paint = function( self, w, h )
	draw.RoundedBox( 0, 0, 0, w, h, Color( 41, 128, 185, 250 ) ) -- Draw a blue button
end
Button.DoClick = function()
	local ply = LocalPlayer()
	Frame:Close()
end
end)