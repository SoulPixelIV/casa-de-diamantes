edgeMarginVer = 8;
edgeMarginHor = 16;

//#####LAYER 0#####

//Zombie Spikes
draw_sprite_ext(zombiespikesEffectLeft_spr, 0, -zombiespikeEffectBorder, 0, 1, 1, 0, -1, zombiespikeBorderTransparent);
draw_sprite_ext(zombiespikesEffectRight_spr, 0, 1034 + zombiespikeEffectBorder, 0, 1, 1, 0, -1, zombiespikeBorderTransparent);
draw_sprite_ext(zombiespikesEffectTop_spr, 0, 0, -zombiespikeEffectBorder, 1, 1, 0, -1, zombiespikeBorderTransparent);
draw_sprite_ext(zombiespikesEffectDown_spr, 0, 0, 364 + zombiespikeEffectBorder, 1, 1, 0, -1, zombiespikeBorderTransparent);

draw_set_alpha(zombiespikeBorderTransparent);
draw_ellipse_colour(-xScreenSize, -yScreenSize, xScreenSize, yScreenSize, c_black , c_green, false);
draw_set_alpha(1);

if (zombiespikeEffectBorder > 0 && player_obj.plagueTransformation)
{
	zombiespikeEffectBorder -= global.dt / 20;
	zombiespikeBorderTransparent += global.dt / 8500;
}

//Lens Dirt + Vignette
draw_sprite_ext(lensDirt_spr, 0, -20, -20, 1, 1, 0, -1, 0.075);
	
//Vignette Effect
if (deathVignette)
{
	draw_set_alpha(0.4);
}
else
{
	draw_set_alpha(0.1);
}
draw_ellipse_colour(-200, -200, 600, 600, c_black , c_red, false);
draw_set_alpha(1);

//#####LAYER 1#####

if (!noHUD)
{
	draw_set_font(global.optixFont);
	draw_set_color(c_white);
	//Debug
	draw_text_colour(edgeMarginHor, 192, "Framerate: " + string(fps_real), c_white, c_white, c_white, c_white, 1);
	draw_text_colour(edgeMarginHor, 208, "Slowmo: " + string(player_obj.slowmoTimer), c_white, c_white, c_white, c_white, 1);
	draw_text_colour(edgeMarginHor, 224, "Roomspeed: " + string(fps), c_white, c_white, c_white, c_white, 1);
	draw_text_colour(edgeMarginHor, 240, "Dash: " + string(player_obj.dashDelay), c_white, c_white, c_white, c_white, 1);

	//Healthbar
	draw_sprite_ext(healthbarBorder_spr, 0, edgeMarginHor, edgeMarginVer, 1, 1, 0, -1, 1);
	draw_sprite_ext(healthbarTop2_spr, -1, edgeMarginHor, 12 - (player_obj.hp - 100), 1, 1, 0, -1, 1);
	draw_sprite_ext(healthbar_spr, 0, edgeMarginHor, 129, 1, 1 * (player_obj.hp / 100) , 0, -1, 1);
	//Healthcut
	if (player_obj.syringesLost > 0)
	{
		draw_sprite_ext(healthCut_spr, 0, 32, 82 + 52 * (player_obj.syringesLost - 1), 1, 1, 0, -1, 1);
	}

	//Syringes
	for (i = 0; i < player_obj.syringes; i++)
	{
		draw_sprite_ext(syringe_spr, -1, 48, 24 + 32 * i, 1, 1, -1, -1, 1);
	}
	
	//Infectionbar
	/*
	if (player_obj.plagueTransformation)
	{
		draw_sprite_ext(infectionbarBorder_spr, 0, 256, 128, 1, 1, 0, -1, 1);
		draw_sprite_ext(infectionbar_spr, 0, 256, 128, player_obj.infection / 100, 1, 0, -1, 1);
	}
	*/
	
	//Chipbar
	draw_sprite_ext(scoreBorder_spr, -1, 375, edgeMarginVer, 1, 1, 0, -1, 1);
	
	//Ammo
	if (global.currentWeapon == gameManager_obj.pickedWeapon.pistol)
	{
		for (i = 0; i < global.pistolMag / 6; i++)
		{
			if (i > 2)
			{
				draw_sprite_ext(magazine_spr, -1, 112, 32 + 24 * (i - 3), 1, 1, -1, -1, 1);
			}
			else
			{
				draw_sprite_ext(magazine_spr, -1, 80, 24 + 24 * i, 1, 1, -1, -1, 1);
			}
		}
	}
	if (global.currentWeapon == gameManager_obj.pickedWeapon.dualBarettas)
	{
		for (i = 0; i < global.dualBarettasMag / 8; i++)
		{
			if (i > 2)
			{
				draw_sprite_ext(magazine_spr, -1, 112, 32 + 24 * (i - 3), 1, 1, -1, -1, 1);
			}
			else
			{
				draw_sprite_ext(magazine_spr, -1, 80, 24 + 24 * i, 1, 1, -1, -1, 1);
			}
		}
	}
	if (global.currentWeapon == gameManager_obj.pickedWeapon.shotgun)
	{
		for (i = 0; i < global.shotgunMag / 3; i++)
		{
			if (i > 2)
			{
				draw_sprite_ext(magazine_spr, -1, 112, 32 + 24 * (i - 3), 1, 1, -1, -1, 1);
			}
			else
			{
				draw_sprite_ext(magazine_spr, -1, 80, 24 + 24 * i, 1, 1, -1, -1, 1);
			}
		}
	}
}

//#####LAYER 2#####

draw_set_alpha(1);
//Infectiontext
if (drawInfectionText)
{
	draw_set_font(global.optixFont);
	draw_set_color(c_white);
	draw_text(136, 90, "Syringes Left: " + string(player_obj.syringes))
	draw_set_font(global.optixFontHuge);
	draw_text(116, 78, "PRESS 'R' TO INFECT YOURSELF!");
	draw_text(116, 131, "PRESS 'Q' TO DIE INSTANTLY!");
}
if (player_obj.isZombie)
{
	draw_set_font(global.optixFontHuge);
	draw_set_color(c_white);
	draw_text(116, 78, "PRESS 'F' TO BECOME HUMAN AGAIN!");
	draw_text(116, 111, "PRESS 'Q' TO DIE INSTANTLY!");
}

//#####LAYER 3#####

draw_set_alpha(blackscreenStrength);
draw_set_color(c_black);
draw_rectangle(-300, -225, 1600, 1150, false);
draw_set_alpha(1);