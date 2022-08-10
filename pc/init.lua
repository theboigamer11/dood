AddCSLuaFile("entities/pc/cl_init.lua")
AddCSLuaFile("entities/pc/shared.lua")

include("entities/pc/shared.lua")

function ENT:Initialize()
	self:SetModel("models/props_lab/harddrive02.mdl")
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	
	local phys = self:GetPhysicsObject()
	
	if(phys:IsValid()) then
		phys:Wake()
	end
end