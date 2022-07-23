hook.Add( "PlayerDeath", "GlobalDeathMessage", function(idiot, bull, idiot2)
	
	Entity( 1 ):PrintMessage( HUD_PRINTTALK, idiot:Name().." sucks  because he ded" )

end)

hook.Add( "PlayerSpawn", function(idiot) 

	Entity( 1 ):PrintMessage( HUD_PRINTTALK, "some idiot named "..idiot:Name().." has spawned" )

end)

hook.Add( "OnNPCKilled", "ExplosionEffectOnNPCDeath", function( idiotnpc, attacker, inflictor )
	
	Entity( 1 ):PrintMessage( HUD_PRINTTALK, idiotnpc:Name().." sucks  because he ded" )
	
end)