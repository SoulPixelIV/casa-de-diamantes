//#####LAYER 0#####

//Zombie Spikes
draw_sprite_ext(zombiespikesEffectLeft_spr, 0, -zombiespikeEffectBorder, 0, 2, 2, 0, -1, zombiespikeBorderTransparent);
draw_sprite_ext(zombiespikesEffectRight_spr, 0, 1034 + zombiespikeEffectBorder, 0, 2, 2, 0, -1, zombiespikeBorderTransparent);
draw_sprite_ext(zombiespikesEffectTop_spr, 0, 0, -zombiespikeEffectBorder, 2, 2, 0, -1, zombiespikeBorderTransparent);
draw_sprite_ext(zombiespikesEffectDown_spr, 0, 0, 364 + zombiespikeEffectBorder, 2, 2, 0, -1, zombiespikeBorderTransparent);

if (zombiespikeEffectBorder > 0)
{
	zombiespikeEffectBorder -= 0.5;
	zombiespikeBorderTransparent += 0.001;
}

//Lens Dirt + Vignette
draw_sprite_ext(lensDirt_spr, 0, -200, -200, 1, 1, 0, -1, 0.075);
if (deathVignette)
{
	draw_set_alpha(0.2);
	draw_ellipse_colour(-500 * (viewXSave / 100), -500 * (viewYSave / 70), 1480 * (viewXSave / 100), 920 * (viewYSave / 70), c_black , c_red, false);
}
else
{
	draw_set_alpha(0.055 * vignetteStrength);
	draw_ellipse_colour(-500 * (viewXSave / 100), -500 * (viewYSave / 70), 1480 * (viewXSave / 100), 920 * (viewYSave / 70), c_black , c_purple, false);
	//Vignette Effect
	draw_set_alpha(0.1);
	draw_ellipse_colour(-500 * (viewXSave / 100), -500 * (viewYSave / 70), 1480 * (viewXSave / 100), 920 * (viewYSave / 70), c_black , c_red, false);
	draw_set_alpha(1);
}

//#####LAYER 1#####

if (!noHUD)
{
	draw_set_font(standard_fnt);
	draw_set_color(c_white);
	//Debug
	draw_text_colour(32, 624, "Framerate: " + string(fps_real), c_white, c_white, c_white, c_white, 1);
	draw_text_colour(32, 592, "Slowmo: " + string(player_obj.slowmoTimer), c_white, c_white, c_white, c_white, 1);
	draw_text_colour(32, 656, "Roomspeed: " + string(fps), c_white, c_white, c_white, c_white, 1);
	draw_text_colour(32, 688, "Speed: " + string(global.timeScale), c_white, c_white, c_white, c_white, 1);

	//Healthbar
	draw_sprite_ext(healthbarBorder_spr, 0, 32, 16, 2, 2, 0, -1, 1);
	draw_sprite_ext(healthbarTop2_spr, -1, 32, 234 - (player_obj.hp * 2.12), 2, 2, 0, -1, 1);
	draw_sprite_ext(healthbar_spr, 0, 32, 256, 2, 2 * (player_obj.hp / 100) , 0, -1, 1);
	//Healthcut
	if (player_obj.syringesLost > 0)
	{
		draw_sprite_ext(healthCut_spr, 0, 32, 138 - 96.5 * player_obj.syringesLost, 1, 1, 0, -1, 1);
	}

	//Syringes
	for (i = 0; i < player_obj.syringes; i++)
	{
		draw_sprite_ext(syringe_spr, -1, 86, 48 + 48 * i, 2, 2, -1, -1, 1);
	}
	
	//Infectionbar
	if (player_obj.plagueTransformation)
	{
		draw_sprite_ext(infectionbarBorder_spr, 0, 256, 128, 1, 1, 0, -1, 1);
		draw_sprite_ext(infectionbar_spr, 0, 256, 128, player_obj.infection / 100, 1, 0, -1, 1);
	}
	
	//Chipbar
	draw_sprite_ext(scoreBorder_spr, -1, 1078, 16, 2, 2, 0, -1, 1);
	
	//Ammo
	if (global.currentWeapon == gameManager_obj.pickedWeapon.pistol)
	{
		for (i = 0; i < global.pistolMag / 6; i++)
		{
			if (i > 2)
			{
				draw_sprite_ext(magazine_spr, -1, 207, 44 + 48 * (i - 3), 2, 2, -1, -1, 1);
			}
			else
			{
				draw_sprite_ext(magazine_spr, -1, 145, 44 + 48 * i, 2, 2, -1, -1, 1);
			}
		}
	}
	if (global.currentWeapon == gameManager_obj.pickedWeapon.dualBarettas)
	{
		for (i = 0; i < global.dualBarettasMag / 12; i++)
		{
			if (i > 2)
			{
				draw_sprite_ext(magazine_spr, -1, 207, 44 + 48 * (i - 3), 2, 2, -1, -1, 1);
			}
			else
			{
				draw_sprite_ext(magazine_spr, -1, 145, 44 + 48 * i, 2, 2, -1, -1, 1);
			}
		}
	}
	if (global.currentWeapon == gameManager_obj.pickedWeapon.shotgun)
	{
		for (i = 0; i < global.shotgunMag / 2; i++)
		{
			if (i > 2)
			{
				draw_sprite_ext(magazine_spr, -1, 207, 44 + 48 * (i - 3), 2, 2, -1, -1, 1);
			}
			else
			{
				draw_sprite_ext(magazine_spr, -1, 145, 44 + 48 * i, 2, 2, -1, -1, 1);
			}
		}
	}
}

//#####LAYER 2#####

draw_set_alpha(1);
//Infectiontext
if (drawInfectionText)
{
	draw_set_font(neonHuge_fnt);
	draw_set_color(c_red);
	draw_text(256, 128, "PRESS 'R' TO INFECT YOURSELF!");
}
if (player_obj.isZombie)
{
	draw_set_font(neonHuge_fnt);
	draw_set_color(c_red);
	draw_text(128, 128, "PRESS 'F' TO BECOME HUMAN AGAIN!");
}