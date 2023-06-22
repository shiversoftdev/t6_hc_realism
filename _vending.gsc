_zm_realism_create_vending()
{
	for(i=0;i< level._realism_vending_spawns.size;i++)
	{
		//There should be 2 vending machines per spawn
		//2 locations too, one for the machine, one for the face position
		if(!isdefined(level._realism_vending_spawns[i])) break;
		machine0 = spawn("script_model", level._realism_vending_spawns[i][0], 1);
		machine1 = spawn("script_model", level._realism_vending_spawns[i][2], 1);
		if(getdvar("mapname") == "zm_prison")
		{
		machine0 setmodel("p6_zm_al_vending_jugg_on");
		machine1 setmodel("p6_zm_al_vending_doubletap2_on");
		}
		else
		{
		machine0 setmodel("zombie_vending_jugg_on");
		if(getdvar("mapname")=="zm_tomb") machine1 setmodel("zombie_vending_marathon_on");
		else machine1 setmodel("zombie_vending_doubletap2_on");
		}
		machine0 rotateto(VectorToAngles( level._realism_vending_spawns[i][1] - level._realism_vending_spawns[i][0] ), .01);
		machine1 rotateto(VectorToAngles( level._realism_vending_spawns[i][3] - level._realism_vending_spawns[i][2] ), .01);
		wait .1;
	}
}
