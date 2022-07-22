

-- This is the base SWEP (Scripted Weapon).
-- DO NOT change this file.
-- When making a new weapon you only need to override what you need.

_OpenScript( "includes/defines.lua" );
_OpenScript( "includes/vector3.lua" );
_OpenScript( "includes/misc.lua" );
_OpenScript( "includes/backcompat.lua" );


-- These variables are passed by the engine
-- Don't re-define them in your SWEP.
MyIndex			=	0; -- Weapon's entity index.
Owner			= 	0; -- The player that owns this weapon
CurrentTime		=	0; -- The current game time



-- Called when the weapon is created.

	function onInit( )
	end
	
	
-- Called when player picks up weapon
	function onPickup( playerid )
	end
	
	
-- Called when player drops weapon
	function onDrop( playerid )
	end


-- Weapon is about to be destroyed.
	function onRemove( )
	end


-- Called every frame

	function onThink( )
	end
	

-- When the player presses left mouse button

	function onPrimaryAttack( )	
		if ( _PlayerInfo( Owner, "alive" ) == false ) then return; end
				
		-- Make the player fly backwards
		 --local vPlayerVel = vecMul( _PlayerGetShootAng( Owner ), vector3(-2000, -2000, -2000) );
		-- _EntSetVelocity( Owner, vPlayerVel );
		
		
		-- Send the laser line effect
		
		
	   local vecpos = _PlayerGetShootPos( Owner );
	   local plyang = _PlayerGetShootAng( Owner );
	 
	   _TraceLine( vecpos, plyang, 10000, Owner );
	   
	   local hitpos = _TraceEndPos();
	 
	   if ( _TraceHit() == false )  then
	   
	   hitpos = vecAdd( vecpos, vecMul( plyang, vector3(8000,8000,8000) ) )
	   
	   end
	 
	   --local mycoolvar = string.format("%.2f",_TraceFraction)
	   --_Msg(mycoolvar)
	   vecpos = vecAdd( vecpos, vector3( 0, 0, -20 ) );

		--_EffectInit();
		
		--	_EffectSetEnt( Owner );
		--	_EffectSetOrigin( hitpos );
		--	_EffectSetStart( vecpos );
		--	_EffectSetScale( 15 );
		--	_EffectSetMagnitude( 3);
		
	--	_EffectDispatch( "FadingLineTeam" );
		
	--	_EffectSetMagnitude( 4 );
	--	_EffectSetScale( 9 );
		--_EffectDispatch( "FadingLineTeam" );
		
			
	end

	

-- When the player presses right mouse button

	function onSecondaryAttack( )	
local vecpos = _PlayerGetShootPos(Owner);
		local plyang = _PlayerGetShootAng(Owner);
		
		_TraceLine(vecpos, plyang, 8000, Owner);
		
		vecpos = vecAdd( vecpos, vector3( 0, 0, -20 ) );
		
		local hitpos = _TraceEndPos();
		
		if (_TraceHit() == false)  then
			hitpos = vecAdd( vecpos, vecMul( plyang, vector3(8000,8000,8000) ) )
		end
		
		_EffectInit();
			_EffectSetEnt( 255 );
			_EffectSetOrigin( hitpos );
			_EffectSetStart( vecpos );
			_EffectSetScale( 40 );
			_EffectSetMagnitude( 0.5 );
		_EffectDispatch( "FadingLine" );
		
		if (_TraceHit() == true)  then 
			if (_TraceHitNonWorld()) and (_TraceGetEnt() > _MaxPlayers()) then 
				if (_EntGetType(_TraceGetEnt()) == "prop_physics") then
					_RunString("removeProp(" .. Owner .. ", " .. _TraceGetEnt() .. ")");
				end
			end
		end	
	end


-- When Weapon is swapped to

	function Deploy( )
	end
	
	
-- When weapon swapped away from
	
	function Holster( )
	end
	

-- When player presses reload. Returning false means DON'T RELOAD. Although this will hitch on the client.

	function onReload( )
		return true;
	end



-- Primary Attack Settings

	function getDamage()
		return 100000;
	end

	function getPrimaryShotDelay()
		return 0.001;
	end

	function getPrimaryIsAutomatic()
		return true;
	end

	function getBulletSpread()
		return vector3( 0.01, 0.01, 0.01 );
	end

	function getViewKick()
		return vector3( 0.5, 0.0, 0.0);
	end

	function getViewKickRandom()
		return vector3( 0.5, 0.5, 0.2 );
	end

	function getNumShotsPrimary()
		return 2;
	end

	function getPrimaryAmmoType()
		return "pistol";
	end

	function getMaxClipPrimary() -- return -1 if it doesn't use clips
		return 99999;
	end
	
	function getDefClipPrimary() -- ammo in gun by default
		return 99999;
	end
	
	function getTracerFreqPrimary() -- 0 = none, 1 = every bullet, 2 = every 2nd bullet etc
		return 2;
	end
	
	
-- Secondary attack Settings

	function getDamageSecondary()
		return 10;
	end

	function getSecondaryShotDelay()
		return 0.2;
	end

	function getSecondaryIsAutomatic()
		return false;
	end

	function getBulletSpreadSecondary()
		return vector3( 0.001, 0.001, 0.001 );
	end

	function getViewKickSecondary()
		return vector3( 0.5, 0.0, 0.0);
	end

	function getViewKickRandomSecondary()
		return vector3( 0.5, 0.5, 0.2 );
	end

	function getNumShotsSecondary()
		return 1;
	end

	function getSecondaryAmmoType()
		return "pistol";
	end

	function getMaxClipSecondary() -- return -1 if it doesn't use clips
		return -1;
	end

	function getDefClipSecondary()
		return 0;
	end
	
	function getTracerFreqSecondary()
		return 2;
	end
	
	
	
	
-- Weapon Configuration
	
	function getViewModel( )
		return "models/weapons/v_shotgun.mdl";
	end

	function getWorldModel( )
		return "models/weapons/w_shotgun.mdl";
	end

	function getClassName() 
		return "weapon_scripted";
	end

	function getHUDMaterial( )
		return "gmod/SWEP/default";
	end

	function getDeathIcon( )
		return "swep_default";
	end

	function getWeaponSwapHands()
		return false	
	end

	function getWeaponFOV()
		return 70
	end

	function getWeaponSlot()
		return 5	
	end

	function getWeaponSlotPos()
		return 2
	end

	function getFiresUnderwater()
		return true
	end

	function getReloadsSingly()
		return false
	end
	
	-- How the player model holds the weapon: 
	-- pistol, smg, ar2, shotgun, rpg, phys, crossbow, melee, slam, grenade
	function getAnimPrefix() 
		return "shotgun";
	end

	function getPrintName()
		return "The Boltgun";
	end

	-- 0 = Don't override, shoot bullets, make sound and flash
	-- 1 = Don't shoot bullets but do make flash/sounds
	-- 2 = Only play animations
	-- 3 = Don't do anything
	function getPrimaryScriptOverride()
		return 0;
	end

	function getSecondaryScriptOverride()
		return 0;
	end



