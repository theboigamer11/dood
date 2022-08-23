AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
AddCSLuaFile("hud.lua")

include("shared.lua")

local Table = {"models/props_interiors/VendingMachineSoda01a.mdl", "models/props_c17/oildrum001.mdl", "models/props_c17/oildrum001_explosive.mdl", "models/props_junk/wood_crate001a.mdl"}
local prop_model_num = 1

function GM:PlayerSpawn(ply)
	ply:SetModel( "models/player/kleiner.mdl" ) 
	ply:SetupHands()
	ply:Give("weapon_crowbar")
	ply:Give("weapon_physcannon")
	ply:Give("weapon_smg1")
	ply:Give("item_ammo_smg1_grenade")
	ply:Give("weapon_shotgun")
	ply:Give("weapon_crossbow")
	ply:Give("weapon_ar2")
	ply:Give("weapon_357")
	ply:Give("weapon_ar2")
	ply:Give("weapon_pistol")
	ply:Give("weapon_physgun")
end

function GM:ShowSpare(ply)
	prop_model_num = prop_model_num + 1

	if prop_model_num > 4 then
		prop_model_num = 1
	end
	
end

util.AddNetworkString("FMenu")
function GM:ShowSpare2(ply)
	net.Start("FMenu")
	net.Broadcast()
end