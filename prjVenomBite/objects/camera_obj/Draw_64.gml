/// @description GUI

//Lens Dirt + Vignette
draw_sprite_ext(lensDirt_spr, 0, -200, -200, 1, 1, 0, -1, 0.075);
if (deathVignette)
{
	draw_set_alpha(0.2);
	draw_ellipse_colour(-500 * (viewXSave / 100), -500 * (viewYSave / 70), 1480 * (viewXSave / 100), 920 * (viewYSave / 70), c_black , c_red, false);
	draw_set_alpha(1);
}
else
{
	draw_set_alpha(0.055 * vignetteStrength);
	draw_ellipse_colour(-500 * (viewXSave / 100), -500 * (viewYSave / 70), 1480 * (viewXSave / 100), 920 * (viewYSave / 70), c_black , c_purple, false);
	draw_set_alpha(1);
}

//Vignette Effect
if (!deathVignette)
{
	draw_set_alpha(0.1);
	draw_ellipse_colour(-500 * (viewXSave / 100), -500 * (viewYSave / 70), 1480 * (viewXSave / 100), 920 * (viewYSave / 70), c_black , c_red, false);
	draw_set_alpha(1);
}

if (!noHUD)
{
	//HUD
	//draw_text_ext(64, 512, "AMMO: X|Y", 1, 1);
	draw_text(128,128, global.money);
	draw_text(128, 150, digitsManager_obj.currMoney);
	//draw_sprite_ext(windowWeapon_spr, 0, 1168, 608, 1, 1, 0, -1, 1);

	/*
	//Pistol
	if (global.pickedWeapon[0])
	{
		draw_sprite_ext(windowPistol_spr, 0, 1168, 608, 1, 1, 0, -1, 1);
	}
	//Dual Barettas
	if (global.pickedWeapon[1])
	{
		draw_sprite_ext(windowDualBarettas_spr, 0, 1168, 608, 1, 1, 0, -1, 1);
	}
	//Shotgun
	if (global.pickedWeapon[2])
	{
		draw_sprite_ext(windowShotgun_spr, 0, 1168, 608, 1, 1, 0, -1, 1);
	}
	*/

	draw_set_font(neon_fnt);
	draw_text_colour(32, 624, "Framerate: " + string(fps_real), c_purple, c_aqua, c_aqua, c_purple, 1);
	draw_text_colour(32, 592, "Slowmo: " + string(player_obj.slowmoTimer), c_purple, c_aqua, c_aqua, c_purple, 1);
	draw_text_colour(32, 656, "Roomspeed: " + string(fps), c_purple, c_aqua, c_aqua, c_purple, 1);
	draw_text_colour(32, 688, "Speed: " + string(global.timeScale), c_purple, c_aqua, c_aqua, c_purple, 1);

	//draw_sprite_ext(windowBackground_spr, 0, 1168, 520, 1, 1, rotation, -1, 1);
	draw_sprite_ext(healthbarBorder_spr, 0, 32, 16, 2, 2, 0, -1, 1);
	image_speed = 0.1;
	draw_sprite_ext(healthbarTop2_spr, -1, 32, 234 - (player_obj.hp * 2.12), 2, 2, 0, -1, 1);
	draw_sprite_ext(healthbar_spr, 0, 32, 256, 2, 2 * (player_obj.hp / 100) , 0, -1, 1);
	
	if (player_obj.plagueTransformation)
	{
		draw_sprite_ext(infectionbarBorder_spr, 0, 256, 128, 1, 1, 0, -1, 1);
		draw_sprite_ext(infectionbar_spr, 0, 256, 128, player_obj.infection / 100, 1, 0, -1, 1);
	}

	//Score
	draw_set_font(neonBig_fnt);
	if (rotation > 3 * scoreMovementMax)
	{
		dir = 1;
	}
	if (rotation < -3 * scoreMovementMax)
	{
		dir = 0;
	}
	
	if (dir == 0)
	{		
		rotation += scoreMovementSpeed * dt;
	}
	else
	{
		rotation -= scoreMovementSpeed * dt;
	}
		
	//draw_sprite_ext(windowBackground_spr, 0, 1184, 44, 1, 1, rotation, -1, 1);	
	draw_sprite_ext(scoreBorder_spr, -1, 1078, 16, 2, 2, 0, -1, 1);
	draw_text_transformed_colour(1184, 22, string(global.scorepoints) + "P", 1, 1, 0, c_black, c_black, c_black, c_black, 1);
	
	//draw_sprite_ext(windowBackground_spr, 0, 1248, 76, 0.45, 1, rotation, -1, 1);	
	draw_text_transformed_colour(1220, 64, string(global.multiplier) + "><", 1, 1, rotation, c_purple, c_aqua, c_aqua, c_purple, 1);
	draw_set_font(neon_fnt);

	//Syringes
	for (i = 0; i < player_obj.syringes; i++)
	{
		draw_sprite_ext(syringe_spr, -1, 86, 48 + 48 * i, 2, 2, -1, -1, 1);
	}
	
	//Ammo
	if (global.pickedWeapon[0])
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
	if (global.pickedWeapon[1])
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
	if (global.pickedWeapon[2])
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
	
	//Healthcut
	if (player_obj.syringesLost > 0)
	{
		draw_sprite_ext(healthCut_spr, 0, 408 - 96.5 * player_obj.syringesLost, 48, 1, 1, 0, -1, 1);
	}
}

//Infectiontext
if (drawInfectionText)
{
	draw_set_font(neonHuge_fnt);
	draw_set_color(c_red);
	draw_text(256, 128, "PRESS 'R' TO INFECT YOURSELF!");
	draw_set_font(neon_fnt);
}
if (player_obj.isZombie)
{
	draw_set_font(neonHuge_fnt);
	draw_set_color(c_red);
	draw_text(128, 128, "PRESS 'F' TO BECOME HUMAN AGAIN!");
	draw_set_font(neon_fnt);
}