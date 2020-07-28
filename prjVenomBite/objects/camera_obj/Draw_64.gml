edgeMarginVer = 8;
edgeMarginHor = 16;

//#####LAYER 0#####

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
	draw_text_colour(edgeMarginHor, 252, "Framerate: " + string(fps), c_white, c_white, c_white, c_white, 1);

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
		draw_sprite_ext(syringe_spr, -1, 42, 24 + 16 * i, 1, 1, -1, -1, 1);
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
	
	for (i = 0; i < array_length_1d(digitsManager_obj.value); i++)
	{
		draw_text(415 - (i*16), edgeMarginVer, digitsManager_obj.value[i]);
	}
	
	//Ammo
	if (global.currentWeapon == gameManager_obj.pickedWeapon.pistol || global.currentWeapon == gameManager_obj.pickedWeapon.dualBarettas)
	{
		for (i = 0; i < global.pistolMag / 8; i++)
		{
			if (i > 2)
			{
				draw_sprite_ext(magazine_spr, -1, 94, 32 + 24 * (i - 3), 1, 1, -1, -1, 1);
			}
			else
			{
				draw_sprite_ext(magazine_spr, -1, 68, 24 + 24 * i, 1, 1, -1, -1, 1);
			}
		}
	}
	if (global.currentWeapon == gameManager_obj.pickedWeapon.shotgun)
	{
		for (i = 0; i < global.shotgunMag / 3; i++)
		{
			if (i > 2)
			{
				draw_sprite_ext(magazine_spr, -1, 94, 32 + 24 * (i - 3), 1, 1, -1, -1, 1);
			}
			else
			{
				draw_sprite_ext(magazine_spr, -1, 68, 24 + 24 * i, 1, 1, -1, -1, 1);
			}
		}
	}
}

//#####LAYER 2#####

draw_set_alpha(1);

//Hourglass
if (player_obj.plagueTransformation)
{
	if (player_obj.infection < 10)
	{
		draw_sprite(hourglass_spr, 0, 447, 230);
	}
	if (player_obj.infection > 10 && player_obj.infection < 20)
	{
		draw_sprite(hourglass_spr, 1, 447, 230);
	}
	if (player_obj.infection > 20 && player_obj.infection < 40)
	{
		draw_sprite(hourglass_spr, 2, 447, 230);
	}
	if (player_obj.infection > 40 && player_obj.infection < 50)
	{
		draw_sprite(hourglass_spr, 3, 447, 230);
	}
	if (player_obj.infection > 50 && player_obj.infection < 70)
	{
		draw_sprite(hourglass_spr, 4, 447, 230);
	}
	if (player_obj.infection > 70 && player_obj.infection < 90)
	{
		draw_sprite(hourglass_spr, 5, 447, 230);
	}
	if (player_obj.infection > 90)
	{
		draw_sprite(hourglass_spr, 6, 447, 230);
	}
}

//Infectiontext
if (drawInfectionText)
{
	draw_set_font(global.optixFont);
	draw_set_color(c_white);
	draw_text(136, 100, "Syringes Left: " + string(player_obj.syringes))
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

if (showInfOverlay && !showedInf)
{
	InfOverlayTimer -= global.dt;
	if (!infOverlayLocked)
	{
		if (infOverlayX > 0)
		{
			infOverlayX -= 16;
		}
		if (infOverlayY < yScreenSize - 1)
		{
			infOverlayY += 9;
		}
		if (infOverlayX < 0)
		{
			infOverlayLocked = true;
		}
		if (infOverlayY > yScreenSize - 1)
		{
			infOverlayLocked = true;
		}
	}

	if (infOverlayLocked && InfOverlayTimer > 0)
	{
		infOverlayX = 0;
		infOverlayY = yScreenSize - 1;
	}
	
	if (InfOverlayTimer < 0)
	{
		infOverlayX -= 16;
		infOverlayY += 9;
		
		if (infOverlayX < -xScreenSize)
		{
			showedInf = true;
			InfOverlayTimer = InfOverlayTimerSave;
		}
	}

	draw_sprite(infectedOverlay_spr, 0, infOverlayX, infOverlayY);
}

//#####LAYER 3#####

draw_set_alpha(blackscreenStrength);
draw_set_color(c_black);
draw_rectangle(-300, -225, 1600, 1150, false);
draw_set_alpha(1);