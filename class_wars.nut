local class1 = RandomInt(1, 9)
local class2 = RandomInt(1, 9)

function OnGameEvent_teamplay_round_win(params)
{
	class1 = RandomInt(1, 9)
    class2 = RandomInt(1, 9)
} 

function OnGameEvent_post_inventory_application(params)
{
	local player = GetPlayerFromUserID(params.userid)

    if(player.GetTeam() == 2)
    {
        if(player.GetPlayerClass() != class1)
        {
            NetProps.SetPropInt(player, "m_PlayerClass.m_iClass", class1)
	        player.RemoveAllObjects(true)
	        player.Regenerate(true)
        }
    } else if(player.GetTeam() == 3) {
        if(player.GetPlayerClass() != class2)
        {
            NetProps.SetPropInt(player, "m_PlayerClass.m_iClass", class2)
	        player.RemoveAllObjects(true)
	        player.Regenerate(true)
        }
    }
}

__CollectGameEventCallbacks(this)