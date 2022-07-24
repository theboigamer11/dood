AddCSLuaFile("entities/killerberrel/Cl_init.lua)")
AddCSLuaFile("entities/killerberrel/shared.lua")

include("entities/killerberrel/shared.lua")

function ENT:Initialize()
	self:SetModel("models/props_borealis/bluebarrel001.mdl")
	self:SetColor(Color(100,100,255,125))
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	
	local phys = self:GetPhysicsObject()
	
	if(phys:IsValid()) then
		phys:Wake()
	end
end

function ENT:Touch(entity)
	if(!entity:IsPlayer()) then return end
	entity:Kill()
end

function ENT:Think()
	self:SetColor(Color(math.random(0,255),math.random(0,255),math.random(0,255)))
	for k,v in pairs( ents.GetAll() ) do
		if ( v:IsPlayer() ) then
			local ply = v
			return true
		elseif ( !v:IsPlayer() ) then return end
	end
	
	self:MoveToPos( self:GetPos() + ply:GetPos() )
end