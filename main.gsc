/*
*	 Black Ops 2 - GSC Studio by iMCSx
*
*	 Creator : SeriousHD-
*	 Project : Realism
*    Mode : Zombies
*	 Date : 2016/01/27 - 10:14:53	
*
*/	

#include maps\mp\_utility;
#include common_scripts\utility;
#include maps\mp\gametypes_zm\_hud_util;
#include maps\mp\gametypes_zm\_hud_message;

init()
{
	setDvar("party_connectToOthers" , "0");
	setDvar("partyMigrate_disabled" , "1");
	setDvar("party_mergingEnabled" , "0");
	setdvar( "ui_friendlyfire", 1 );
	makedvarserverinfo( "ui_friendlyfire", "1" );
	setdvar("cg_drawFriendlyNames", 0);
	setDvar("g_friendlyfireDist", "0");
	level._realism_initialized = 0;
	_zm_realism_initializeVariables(); //Must occur first
    level thread onPlayerConnect();
    level thread _zm_realism_initGameMode();
}

onPlayerConnect()
{
    for(;;)
    {
        level waittill("connected", player);
        player thread onPlayerSpawned();
        player thread _zm_realism_ifinit_vending();
    }
}

onPlayerSpawned()
{
    self endon("disconnect");
	level endon("game_ended");
    for(;;)
    {
        self waittill("spawned_player");
        if(level._realism_initialized)
        {
        	self thread _zm_realism_playerinit();
        }
    }
}



