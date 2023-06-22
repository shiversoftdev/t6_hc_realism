_zm_realism_initializeVariables()
{
	level._realism_spawns = [];
	level._realism_vending_spawns = [];
	level._realism_vending_spawns[0] = [];
	level._realism_vending_spawns[1] = [];
	level._realism_vending_spawns[2] = [];
	level._realism_vending_spawns[3] = [];
	level._realism_initialized = 0;
	level._realism_default_weapon = "fiveseven_zm";
	level.friendlyfire = 1;
	map = getdvar("mapname");
	if(map == "zm_transit")
	{
		//Survival
		level._realism_spawns[0] = (-6965,4134,-64);
		level._realism_spawns[1] = (1931,-1458,-56);
		level._realism_spawns[2] = (5179,6856,-24);
		level._realism_spawns[3] = (10933,7536,-589);
		level._realism_vending_spawns[0][0] = (-7331,4614,-55);
		level._realism_vending_spawns[0][1] = (-7332, 4614,-55);
		level._realism_vending_spawns[0][2] = (-6979,4614,-55);
		level._realism_vending_spawns[0][3] = (-6980,4614,-55);
		
		level._realism_vending_spawns[1][0] = (855,-283,-61);
		level._realism_vending_spawns[1][1] = (856,-283,-61);
		level._realism_vending_spawns[1][2] = (547,-262,-61);
		level._realism_vending_spawns[1][3] = (548,-262,-61);
		
		level._realism_vending_spawns[2][0] = (5138,6638,-23);
		level._realism_vending_spawns[2][1] = (5139,6638,-23);
		level._realism_vending_spawns[2][2] = (5280,6638,-24);
		level._realism_vending_spawns[2][3] = (5281,6638,-24);
		
		level._realism_vending_spawns[3][0] = (10761,7899,-570);
		level._realism_vending_spawns[3][1] = (10762,7899,-570);
		level._realism_vending_spawns[3][2] = (11177,7649,-566);
		level._realism_vending_spawns[3][3] = (11176,7649,-566);
	}
	else if(map == "zm_nuked")
	{
		//Survival
		level._realism_spawns[0] = (-1648,1042,-64);
		level._realism_spawns[1] = (-2,300,-46);
		level._realism_spawns[2] = (1120,156,79);
		level._realism_spawns[3] = (1931,424,-63);
		
		level._realism_vending_spawns[0][0] = (-423,452,-61);
		level._realism_vending_spawns[0][1] = (-422,453,-61);
		level._realism_vending_spawns[0][2] = (-495,280,-62);
		level._realism_vending_spawns[0][3] = (-494,281,-62);
		
		level._realism_vending_spawns[1] = undefined;
		level._realism_vending_spawns[2] = undefined;
		level._realism_vending_spawns[3] = undefined;
		
	}
	else if(map == "zm_highrise")
	{
		//Survival
		level._realism_spawns[0] = (1616,2007,3040);
		level._realism_spawns[1] = (3271,1424,1313);
		level._realism_spawns[2] = (2690,10,1296);
		level._realism_spawns[3] = (2015,211,2880);
		
		level._realism_vending_spawns[0][0] = (2283,2155,3040);
		level._realism_vending_spawns[0][1] = (2283,2154,3040);
		level._realism_vending_spawns[0][2] = (2230,2377,3040);
		level._realism_vending_spawns[0][3] = (2230,2376,3040);
		
		level._realism_vending_spawns[1][0] = (3555,1553,1373);
		level._realism_vending_spawns[1][1] = (3556,1553,1373);
		level._realism_vending_spawns[1][2] = (3553,1297,1373);
		level._realism_vending_spawns[1][3] = (3554,1297,1373);
		
		level._realism_vending_spawns[2][0] = (2613,288,1301);
		level._realism_vending_spawns[2][1] = (2614,288,1301);
		level._realism_vending_spawns[2][2] = (2416,-57,1297);
		level._realism_vending_spawns[2][3] = (2417,-57,1297);
		
		level._realism_vending_spawns[3][0] = (2133,536,2883);
		level._realism_vending_spawns[3][1] = (2134,536,2883);
		level._realism_vending_spawns[3][2] = (2133,773,2880);
		level._realism_vending_spawns[3][3] = (2134,773,2880);
	}
	else if(map == "zm_prison")
	{
		//Survival
		level._realism_spawns[0] = (-217,5508,-72);
		level._realism_spawns[1] = (335,9613,1104);
		level._realism_spawns[2] = (4104,9634,1528);
		level._realism_spawns[3] = (1193,10167,1336);
		
		level._realism_vending_spawns[0][0] = (-624,5322,-72);
		level._realism_vending_spawns[0][1] = (-625,5322,-72);
		level._realism_vending_spawns[0][2] = (-458,5356,-72);
		level._realism_vending_spawns[0][3] = (-459,5356,-72);
		
		level._realism_vending_spawns[1][0] = (628,10026,1128);
		level._realism_vending_spawns[1][1] = (628,10027,1128);
		level._realism_vending_spawns[1][2] = (613,9708,1104);
		level._realism_vending_spawns[1][3] = (613,9709,1104);
		
		level._realism_vending_spawns[2][0] = (3574,9802,1528);
		level._realism_vending_spawns[2][1] = (3575,9802,1528);
		level._realism_vending_spawns[2][2] = (3575,9516,1528);
		level._realism_vending_spawns[2][3] = (3574,9516,1528);
		
		level._realism_vending_spawns[3][0] = (886,9962,1343);
		level._realism_vending_spawns[3][1] = (885,9962,1343);
		level._realism_vending_spawns[3][2] = (891,10243,1336);
		level._realism_vending_spawns[3][3] = (892,10243,1336);
	}
	else if(map == "zm_buried")
	{
		//Survival
		level._realism_spawns[0] = (-1232,-331,288);
		level._realism_spawns[1] = (97,-1765,-19);
		level._realism_spawns[2] = (756,1444,-19);
		level._realism_spawns[3] = (3428,850,54);
		
		level._realism_vending_spawns[0][0] = (-1017,-454,290);
		level._realism_vending_spawns[0][1] = (-1018,-454,290);
		level._realism_vending_spawns[0][2] = (-853,-456, 290);
		level._realism_vending_spawns[0][3] = (-854,-456, 290);
		
		level._realism_vending_spawns[1][0] = (245,-1290,9);
		level._realism_vending_spawns[1][1] = (245,-1291,9);
		level._realism_vending_spawns[1][2] = (3,-1065,-24);
		level._realism_vending_spawns[1][3] = (3,-1064,-24);
		
		level._realism_vending_spawns[2][0] = (620,1381,-20);
		level._realism_vending_spawns[2][1] = (620,1382,-20);
		level._realism_vending_spawns[2][2] = (622,1046,6);
		level._realism_vending_spawns[2][3] = (622,1047,6);
		
		level._realism_vending_spawns[3][0] = (3829,762,0);
		level._realism_vending_spawns[3][1] = (3828,762,0);
		level._realism_vending_spawns[3][2] = (3892,429,4);
		level._realism_vending_spawns[3][3] = (3892,430,4);
		
	}
	else if(map == "zm_tomb")
	{
		//Survival
		level._realism_spawns[0] = (-374,4859,-295);
		level._realism_spawns[1] = (2332,-133,139);
		level._realism_spawns[2] = (404,2474,-123);
		level._realism_spawns[3] = (3162,4401,-607);
		
		level._realism_vending_spawns[0][0] = (-131,4549,-293);
		level._realism_vending_spawns[0][1] = (-132,4549,-293);
		level._realism_vending_spawns[0][2] = (-419,4553,-293);
		level._realism_vending_spawns[0][3] = (-420,4553,-293);
		
		level._realism_vending_spawns[1][0] = (2135,384,117);
		level._realism_vending_spawns[1][1] = (2136,384,117);
		level._realism_vending_spawns[1][2] = (2282,386,118);
		level._realism_vending_spawns[1][3] = (2283,386,118);
		
		level._realism_vending_spawns[2][0] = (529,2119,-124);
		level._realism_vending_spawns[2][1] = (528,2119,-124);
		level._realism_vending_spawns[2][2] = (315,2125,-125);
		level._realism_vending_spawns[2][3] = (314,2125,-125);
		
		level._realism_vending_spawns[3][0] = (1667,4212,-358);
		level._realism_vending_spawns[3][1] = (1667,4213,-358);
		level._realism_vending_spawns[3][2] = (1801,3981,-360);
		level._realism_vending_spawns[3][3] = (1800,3981,-360);
	}
}

_zm_realism_initGameMode()
{
	for(i=30;i>0;i--)
	{
		iprintlnbold("Realism active in :^1 "+i);
		wait 1;
	}
	
	
	//Open doors to playable areas
	level.player_intersection_tracker_override = ::_zm_realism_intersection_override;
	level.players[0] maps\mp\zombies\_zm_game_module::turn_power_on_and_open_doors();
	level thread _zm_realism_openalldoors();
	//Set variables
	//level._game_module_player_damage_grief_callback = ::_zm_realism_callback_override;
	//level.callbackplayerdamage = ::_zm_realism_callback_override;
	//level.prevent_player_damage = ::_zm_realism_player_prevent_damage;
	level.is_player_in_screecher_zone = ::_zm_arena_false_function;
	level.screecher_should_runaway = ::_zm_arena_true_function;
	level.friendlyfire = 1;
	level.perk_purchase_limit = 0;
	level.enable_magic = false;
	level.headshots_only = true;
	level._get_game_module_players = undefined;
	level.hardcoremode = true;
	//Set Dvars
	setDvar( "player_lastStandBleedoutTime","0.1" );
	setdvar( "ui_friendlyfire", 1 );
	makedvarserverinfo( "ui_friendlyfire", "1" );
	setdvar("cg_drawFriendlyNames", 0);
	setDvar("g_friendlyfireDist", "0"); 
	//Hide mysterybox
	foreach(box in level.chests)
	{
		box thread maps/mp/zombies/_zm_magicbox::hide_chest(0);
	}
	level thread _zm_realism_create_vending();
	foreach(player in level.players) player thread _zm_realism_playerinit();
	wait 2;
	iprintlnbold("Work with or against the others to survive...");
	InitializeHardcoreParameters();
	level._realism_initialized = 1;
}

_zm_realism_intersection_override()
{
	self waittill("forever");
	return true;
}

_zm_arena_false_function(player)
{
return false;
}

_zm_arena_true_function(player)
{
return true;
}


