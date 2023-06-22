_zm_realism_playerinit()
{
	self notify( "stop_player_out_of_playable_area_monitor" );
	self notify( "stop_player_too_many_weapons_monitor" );
	self setclientuivisibilityflag( "hud_visible", 0 );
	self disableaimassist();
	self setempjammed( true );
	for(i=0;i<level.players.size;i++) if(level.players[i] == self) self setorigin(level._realism_spawns[i]);
	self takeallweapons();
	self giveweapon(level._realism_default_weapon);
	self giveweapon("knife_zm");
	self switchtoweapon(level._realism_default_weapon);
	self DisableInvulnerability();
	self setclientfov(85);
	self setclientdrawtalk( 3 );
	self setclientuivisibilityflag( "hud_visible", 0 );
	self disableusability();
	self thread _zm_realism_fivesevenonly();
	self._realism_food = 75.0;
	self._realism_maxfood = 100.0;
	self._realism_water = 75.0;
	self._realism_maxwater = 100.0;
	self thread _zm_realism_create_food_bar();
	self thread _zm_realism_create_water_bar();
	self thread _zm_realism_watch_resources();
	self thread _zm_realism_watch_infection();
	self setblur(0,.1);
	self thread _zm_realism_ff_callback();
	self._realism_sometrigger = 0;
	self thread _zm_realism_regendefault();
	self thread _zm_realism_fix_blur_on_death();
	self._realism_infected = 0;
	self thread _zm_realism_max_5k();
	self.maxhealth = 50;
	self.health = self.maxhealth;
}

_zm_realism_callback_override( einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, psoffsettime )
{
	self dodamage( idamage, self.origin, self, self, "none", "MOD_SUICIDE");
}


_zm_realism_player_prevent_damage(einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, psoffsettime )
{
	return 0;
}

_zm_realism_fivesevenonly()
{
	self endon("spawned_player");
	for(;isAlive(self);)
	{
		self waittill("weapon_fired", weapon);
		if(weapon != "fiveseven_zm" && weapon != "fiveseven_upgraded_zm" && weapon != "knife_zm") self takeweapon(weapon);
	}
}

_zm_realism_watch_resources()
{
	self thread _zm_realism_food_deplete();
	self thread _zm_realism_water_deplete();
	self.foodlownotified = 0;
	self.waterlownotified = 0;
	self endon("bled_out");
	self endon("spawned_player");
	for(;;)
	{
		if(self._realism_food < 25)
		{
			self setblur( 25 - self._realism_food, 0.1 );
			if(!self.foodlownotified){ self iprintlnbold("You are low on food!"); self.foodlownotified = 1;}
			if(self._realism_food <= 0)
			{
				RadiusDamage(self.origin, 5, 500,500,self);
				self setblur(0,0.1);
				break;
			}
		}
		else if(!isDefined(self.foodlownotified) || self.foodlownotified) self.foodlownotified = 0;
		else if(self._realism_water < 25)
		{
			self setblur( 25 - self._realism_water, 0.1 );
			if(!self.waterlownotified){ self iprintlnbold("You are low on water!"); self.waterlownotified = 1;}
			if(self._realism_water <= 0)
			{
				RadiusDamage(self.origin, 5, 500,500,self);
				self setblur(0,0.1);
				break;
			}
		}
		else if(!isDefined(self.waterlownotified) || self.waterlownotified) self.waterlownotified = 0;
		else if(!self.waterlownotified && !self.foodlownotified && !self._realism_infected) self setblur(0,0.1);
		
		wait .1;
	}

}

_zm_realism_food_deplete()
{
	self endon("spawned_player");
	self endon("bled_out");
	self thread _zm_realism_food_deplete_zhit();
	for(;;)
	{
		wait 15;
		self._realism_food = self._realism_food - 1 ;
	}
}

_zm_realism_water_deplete()
{
	self endon("spawned_player");
	self endon("bled_out");
	self thread _zm_realism_water_deplete_sprint();
	self thread _zm_realism_water_deplete_jumps();
	for(;;)
	{
		wait 10;
		self._realism_water = self._realism_water - 1.0;
		
	}
}

_zm_realism_food_deplete_zhit()
{
	self endon("spawned_player");
	self endon("bled_out");
	for(;;)
	{
		self waittill( "damage", amount, attacker, dir, point, mod );
		if(attacker.iszombie) self._realism_food = self._realism_food - 1.0;
	}
}

_zm_realism_water_deplete_sprint()
{
	self endon("spawned_player");
	self endon("bled_out");
	self._realism_sprinttime = 0;
	for(;;)
	{
		if(self issprinting())
		{
			wait 1;
			if(self issprinting())
			{
				self._realism_sprinttime++;
				if(self._realism_sprinttime == 5)
				{
					self._realism_sprinttime = 0;
					self._realism_water = self._realism_water - 1.0;
				}
			}
		}
		wait .05;
	}
}

_zm_realism_water_deplete_jumps()
{
	self endon("spawned_player");
	self endon("bled_out");
	self._realism_jumpcount = 0;
	for(;;)
	{
		if(self jumpbuttonpressed())
		{
			self._realism_jumpcount++;
			while(!self isonground()) wait .05;
			if(self._realism_jumpcount == 5)
			{
				self._realism_jumpcount = 0;
				self._realism_water = self._realism_water - 1.0;
			}
		}
		wait .05;
	}
}

_zm_realism_watch_infection()
{
	self endon("spawned_player");
	self endon("bled_out");
	self._realism_infectionchance = 1;
	for(;;)
	{
		self waittill( "damage", amount, attacker, dir, point, mod );
		if(isdefined(attacker) && attacker.iszombie && isAlive(attacker))
		{
			if(randomintrange(0,100) <= self._realism_infectionchance)
			{
				self._realism_infected = 1;
				self thread _zm_realism_selfinfected();
				self._realism_infectionchance = 1;
				for(;self._realism_infected;) wait .05;	
			}
			else self._realism_infectionchance += 3;
		}
		wait .05;
	}
}

_zm_realism_selfinfected()
{
	self endon("spawned_player");
	self endon("bled_out");
	infectiontimeleft = 60;
	self iprintlnbold("^1 You have been infected. Life slowly slips away.....");
	self.ignoreme = 1;
	setclientsysstate( "lsm", "1", self );
	
	for(;infectiontimeleft > 0; infectiontimeleft--)
	{
		self setblur(60 - infectiontimeleft , 1);
		wait 1;
	}
	self._realism_infected = 0;
	self.ignoreme = 0;
	RadiusDamage(self.origin, 15,500,500,self);
}

_zm_realism_ff_callback()
{

 self endon("bled_out");
 self endon("spawned_player");
 for(;;)
 {
	  self waittill("weapon_fired",weapon);
	  trace=bulletTrace(self GetTagOrigin("j_head"),self GetTagOrigin("j_head")+ anglesToForward(self GetPlayerAngles())* 1000000,true,self);
	  if(isDefined(trace["entity"]) && isPlayer(trace["entity"]))
	  {
	   		trace["entity"] doDamage( getweaponmindamage( (self getcurrentweapon()) ),(trace["entity"] getorigin()));
	   		self maps/mp/zombies/_zm_score::add_to_player_score( 500 );
	  }
	  wait .05;
 }
}

_zm_realism_regendefault()
{
	self endon("spawned_player");
	self.firedsecs = 0;
	self thread _zm_realism_countsecsnotfired();
	self thread _zm_realism_resetsecsnotfired();
	for(;isAlive(self);)
	{
		while(!self hasweapon(level._realism_default_weapon)) wait .05;
		wait .5;
		if(self.firedsecs > 5)
		{
			Ammo = self GetAmmoCount(level._realism_default_weapon) - WeaponClipSize(level._realism_default_weapon);
			if(Ammo < WeaponMaxAmmo( level._realism_default_weapon ) )
			{
				if(Ammo < 0 )
				{
				clipammo = self GetAmmoCount(level._realism_default_weapon);
				self setweaponammoclip( level._realism_default_weapon, clipammo + 1 );
				continue;
				}
				self setweaponammostock( level._realism_default_weapon, Ammo+1 );
			}
		}
	}
}

_zm_realism_countsecsnotfired()
{
	self endon("spawned_player");
	for(;;)
	{
		wait 1;
		self.firedsecs++;
	}
}

_zm_realism_resetsecsnotfired()
{
	self endon("spawned_player");
	for(;;)
	{
		self waittill("weapon_fired",weapon);
		if(weapon == level._realism_default_weapon) self.firedsecs = 0;
	}
}

_zm_realism_fix_blur_on_death()
{
	self waittill("bled_out");
	self setblur(0,0.1);
}

_zm_realism_max_5k()
{
	for(;;)
	{
		if(self.score > 5000)
		{
			self maps/mp/zombies/_zm_score::minus_to_player_score((self.score - 5000), 1);
		}
		wait .05;
	}

}


_zm_realism_ifinit_vending()
{
	while(!level._realism_initialized) wait .05;
	for(i=0;i< level._realism_vending_spawns.size;i++)
	{
	self thread MakeGTrigger( "Press [{+usereload}] to purchase 25 Food (Cost 1000)", 1000, (level._realism_vending_spawns[i][0]),1);
	wait .1;
	self thread MakeGTrigger( "Press [{+usereload}] to purchase 25 Water (Cost 750)", 750, (level._realism_vending_spawns[i][2]),0);
	wait .1;
	}
	self maps/mp/zombies/_zm_score::add_to_player_score( 2500 );
}


