

if ( SERVER ) then

	AddCSLuaFile( "shared.lua" )
	
	SWEP.HoldType			= "smg1"
	
end

if ( CLIENT ) then

	SWEP.PrintName			= "op smg"			
	SWEP.Author				= "Theboigamer11"
	SWEP.Slot				= 2
	SWEP.SlotPos			= 1
end


SWEP.Base				= "weapon_cs_base"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.ViewModel			= "models/weapons/c_smg1.mdl"
SWEP.WorldModel			= "models/weapons/w_smg1.mdl"

SWEP.Weight				= 5
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false

SWEP.Primary.Sound			= Sound( "weapons/smg1/smg1_fire1.wav" )
SWEP.Primary.Recoil			= 1.5
SWEP.Primary.Damage			= 40
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.02
SWEP.Primary.ClipSize		= -1
SWEP.Primary.Delay			= 0.0001
SWEP.Primary.DefaultClip	= -1
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "smg1"

SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

SWEP.IronSightsPos 		= Vector( 6.1, -7, 2.5 )
SWEP.IronSightsAng 		= Vector( 2.8, 0, 0 )

function SWEP:Initialize()

	if ( SERVER ) then
		self:SetWeaponHoldType( self.HoldType )
		self:SetNPCMinBurst( 30 )
		self:SetNPCMaxBurst( 30 )
		self:SetNPCFireRate( 0.01 )
	end
	
	self.Weapon:SetNetworkedBool( "Ironsights", false )
	
end

function SWEP:PrimaryAttack()
    local ply = self:GetOwner()

	local Bullet = {}
		Bullet.Num	=	self.Primary.NumShots
		Bullet.Src	=	ply:GetShootPos()
		Bullet.Dir	=	ply:GetAimVector()
		Bullet.Spread	=	Vector(0,0,0)
		Bullet.Damage	=	self.Primary.Damage
		Bullet.AmmoType	=	self.Primary.Ammo

	self:FireBullets(Bullet)
	self:ShootEffects()

	self:EmitSound(self.Primary.Sound)
	self.BaseClass.ShootEffects(self)
	self:TakePrimaryAmmo(0)
	self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)
end


