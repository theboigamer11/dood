AddCSLuaFile("entities/screen/cl_init.lua")
AddCSLuaFile("entities/screen/shared.lua")

include("entities/screen/shared.lua")

function ENT:Initialize()
	self:SetModel("models/props_lab/monitor01a.mdl")
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	
	local phys = self:GetPhysicsObject()
	
	if(phys:IsValid()) then
		phys:Wake()
	end
	self.PC = false
	self.usecool = false
end

function ENT:StartTouch(ent)
	if ent:GetClass() == "pc" then
		self.PC = true
	end
end

function ENT:Use(caller,user)
	if self.usecool == false then
		if self.PC == true then
			user:ConCommand("startpcDONOTUSE")
		end
	end
	
	self.usecool = true
	
	timer.Simple( 1, function() self.usecool = false end )
end