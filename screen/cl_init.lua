include("entities/screen/shared.lua")

function ENT:Draw()
	self:DrawModel()
	
	local ang = self:GetAngles()
	
	ang:RotateAroundAxis(self:GetAngles():Right(),90)
	
	cam.Start3D2D(self:GetPos(), ang, 1)
		draw.RoundedBox(0,-7,-9,20,20,Color(120,255,120))
	cam.End3D2D()
end