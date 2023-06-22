_zm_realism_create_food_bar()
{
	return;
	self notify("new_food_bar");
	self _zm_realism_clear_old_food();
	self endon("new_food_bar");
	self endon("bled_out");
	x = 40;
	y = 40;
	self._realism_food_label = _zm_realism_label(x,y,"Food:");
	self._realism_food_bg = _zm_realism_bgbar(x,y);
	self._realism_food_fg = _zm_realism_fgbar(x,y);
	temp = self._realism_food;
	while ( 1 )
	{
			if( self._realism_food == temp){ wait .05; continue;}
			wait 0.05;
			key = self._realism_food_label.key;
			width = 0;
			width =  self._realism_food * 3;
			width = int( max( width, 1 ) );
			width = int( min( width, 300 ) );
			
			bar = self._realism_food_fg;
			bar setshader( "black", width, 8 );
			bgbar = self._realism_food_bg;
			if ( ( width + 2 ) > bgbar.maxwidth )
			{
				bgbar.maxwidth = width + 2;
				bgbar setshader( "white", bgbar.maxwidth, 10 );
				bgbar.color = vectorScale( ( 1, 1, 1 ), 0.5 );
			}
			temp = self._realism_food;
	}
}

_zm_realism_create_water_bar()
{
	return;
	self notify("new_water_bar");
	self endon("new_water_bar");
	self endon("bled_out");
	self _zm_realism_clear_old_water();
	x = 40;
	y = 50;
	self._realism_water_label = _zm_realism_label(x,y,"Water:");
	self._realism_water_bg = _zm_realism_bgbar(x,y);
	self._realism_water_fg = _zm_realism_fgbar(x,y);
	temp = self._realism_water;
	while ( 1 )
	{
			if(temp == self._realism_water){wait .05; continue;}
			wait 0.05;
			key = self._realism_water_label.key;
			width = 0;
			width = self._realism_water * 3;
			width = int( max( width, 1 ) );
			width = int( min( width, 300 ) );
			
			bar = self._realism_water_fg;
			bar setshader( "black", width, 8 );
			bgbar = self._realism_water_bg;
			if ( ( width + 2 ) > bgbar.maxwidth )
			{
				bgbar.maxwidth = width + 2;
				bgbar setshader( "white", bgbar.maxwidth, 10 );
				bgbar.color = vectorScale( ( 1, 1, 1 ), 0.5 );
			}
			temp = self._realism_water;
	}
}

_zm_realism_clear_old_food()
{
	if(isdefined(self._realism_food_bg)) self._realism_food_bg destroy();
	if(isdefined(self._realism_food_fg)) self._realism_food_fg destroy();
	if(isdefined(self._realism_food_label)) self._realism_food_label destroy();
}

_zm_realism_clear_old_water()
{
	if(isdefined(self._realism_water_bg)) self._realism_water_bg destroy();
	if(isdefined(self._realsim_water_fg)) self._realsim_water_fg destroy();
	if(isdefined(self._realism_water_label)) self._realism_water_label destroy();
}

_zm_realism_label(x,y,key)
{
		textelem = newClientHudElem(self);
		textelem.x = x;
		textelem.y = y;
		textelem.alignx = "left";
		textelem.aligny = "top";
		textelem.horzalign = "fullscreen";
		textelem.vertalign = "fullscreen";
		textelem settext( key );
		textelem.key = key;
		return textelem;
}

_zm_realism_bgbar(x,y)
{
		bgbar = newClientHudElem(self);
		bgbar.x = x + 79;
		bgbar.y = y + 1;
		bgbar.alignx = "left";
		bgbar.aligny = "top";
		bgbar.horzalign = "fullscreen";
		bgbar.vertalign = "fullscreen";
		bgbar.maxwidth = 300;
		bgbar setshader( "white", bgbar.maxwidth, 10 );
		bgbar.color = vectorScale( ( 1, 1, 1 ), 0.5 );
		return bgbar;
}

_zm_realism_fgbar(x,y)
{
		bar = newClientHudElem(self);
		bar.x = x + 80;
		bar.y = y + 2;
		bar.alignx = "left";
		bar.aligny = "top";
		bar.maxwidth = 300;
		bar.horzalign = "fullscreen";
		bar.vertalign = "fullscreen";
		bar setshader( "black", 225, 8 );
		return bar;
}

MakeGTrigger( text, cost, origin, food) //Utitlise a local hud element to act as a trigger
{
	//self.score
	//maps/mp/zombies/_zm_score::minus_to_player_score( points, ignore_double_points_upgrade )
	if(!isDefined(origin)) self iprintln("NOTDEFINED");
	trigger = self drawText(text, "objective",1.4, 0, 290, (1,1,1), 1, (0,0,0),0, 4);
	trigger hideelem();
	showing = false;
	 //Prevents 2 triggers at once.
	
	for(;;)
	{
		
		if(isDefined(self getorigin()) && isAlive(self))
		{
			
			if(Distance((self getorigin()), origin) <= 100 && !showing && !self._realism_sometrigger)
			{
				
				showing = true;
				trigger showelem();
				self._realism_sometrigger = 1;
				purchasemade = false;
				for(;(Distance((self getorigin()), origin) <= 100 );)
				{
					if(self usebuttonpressed())
					{
						if( self.score >= cost )
						{
							self playsoundtoplayer("zmb_cha_ching",self);
							self maps/mp/zombies/_zm_score::minus_to_player_score( cost, 1 );
							if(food) self._realism_food = min(self._realism_food + 25, self._realism_maxfood);
							else self._realism_water = min(self._realism_water + 25, self._realism_maxwater);
							purchasemade = true;
						}
						else
						{
							self playsoundtoplayer("zmb_no_cha_ching",self);
						}
						break;
					}
					wait .05;
				}
				self._realism_sometrigger = 0;
				showing = false;
				trigger hideelem();
				if(purchasemade)
				{
					wait 1; //Prevent several purchases with 1 press
				}
				else while(self usebuttonpressed()) wait .05;
				
			}
			else if(showing)
			{
				showing = false;
				trigger hideelem();
			}
			
		wait .05;
		}else if(showing)
		{
			showing = false;
			trigger hideelem();
		}
		wait .05;
	}
}


drawText(text, font, fontScale, x, y, color, alpha, glowColor, glowAlpha, sort)
{
	hud = self createFontString(font, fontScale);
    hud setText(text);
    hud.x = x;
	hud.y = y;
	hud.color = color;
	hud.alpha = alpha;
	hud.glowColor = glowColor;
	hud.glowAlpha = glowAlpha;
	hud.sort = sort;
	hud.alpha = alpha;
	return hud;
}




