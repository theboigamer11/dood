AddCSLuaFile()

SWEP.Author = "Theboigamer11"
SWEP.Base = "weapon_base"
SWEP.PrintName = "Number generator"
SWEP.Instructions = [[Left-Click: Generates a random number]]
SWEP.ViewModel = "models/weapons/c_pistol.mdl"
SWEP.ViewModelFlip = false
SWEP.UseHands = true
SWEP.WorldModel = "models/weapons/w_pistol.mdl"
SWEP.SetHoldType = "pistol"
SWEP.Weight = 5
SWEP.AutoSwitchTo = true
SWEP.AutoSwitchFrom = false
SWEP.Slot = 1
SWEP.SlotPos = 0
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = false
SWEP.Spawnable = true
SWEP.AdminSpawnable = true
SWEP.Primary.ClicpSize = 69
SWEP.Primary.DefaultClip = 69
SWEP.Primary.Ammo = "357"
SWEP.Primary.Automat8ic = false
SWEP.Primary.Recoil = 0
SWEP.Primary.Damage = 0
SWEP.Primary.NumShots = 1
SWEP.Primary.Spread = 0
SWEP.Primary.Cone = 0
SWEP.Primary.Delay = 0
SWEP.ShouldDropOnDie = false

function SWEP:PrimaryAttack()
	local player self:GetOwner()
	
	Entity( 1 ):PrintMessage( HUD_PRINTCENTER, math.random( 1, 100 ) )
end