edgeMarginVer = 11;
edgeMarginHor = 17;

//#####LAYER 0#####

//Lens Dirt + Vignette
draw_sprite_ext(lensDirt1_spr, 0, randParticleX + partMovement, randParticleY + partMovement / 2, 1, 1, 0, -1, 0.135);
draw_sprite_ext(lensDirt2_spr, 0, randParticleX2 + partMovement, randParticleY2 + partMovement / 2, 1, 1, 0, -1, 0.135);
draw_sprite_ext(lensDirt2_spr, 0, randParticleX3 + partMovement, randParticleY3 + partMovement / 2, 1, 1, 0, -1, 0.135);
draw_sprite_ext(lensDirt2_spr, 0, randParticleX4 + partMovement, randParticleY4 + partMovement / 2, 1, 1, 0, -1, 0.135);

draw_sprite_ext(lensDirt1_spr, 0, randParticle2X + partMovement, randParticle2Y + partMovement / 2, 1, 1, 0, -1, 0.135);
draw_sprite_ext(lensDirt2_spr, 0, randParticle2X2 + partMovement, randParticle2Y2 + partMovement / 2, 1, 1, 0, -1, 0.135);
draw_sprite_ext(lensDirt2_spr, 0, randParticle2X3 + partMovement, randParticle2Y3 + partMovement / 2, 1, 1, 0, -1, 0.135);
draw_sprite_ext(lensDirt2_spr, 0, randParticle2X4 + partMovement, randParticle2Y4 + partMovement / 2, 1, 1, 0, -1, 0.135);
	
//Vignette Effect
if (!hitVignette)
{
	if (deathVignette)
	{
		if (vignetteAlpha > 0.4)
		{
			vignetteAlpha -= 0.02;
		}
		if (vignetteAlpha < 0.4)
		{
			vignetteAlpha += 0.02;
		}
	}
	else
	{
		if (vignetteAlpha > 0.1)
		{
			vignetteAlpha -= 0.02;
		}
		if (vignetteAlpha < 0.1)
		{
			vignetteAlpha += 0.02;
		}
	}
}
if (hitVignette || player_obj.hp < 20)
{
	if (vignetteAlpha > 0.4)
	{
		vignetteAlpha -= 0.02;
	}
	if (vignetteAlpha < 0.4)
	{
		vignetteAlpha += 0.02;
	}
	hitVignetteTimer -= global.dt;
}

if (hitVignetteTimer < 0)
{
	hitVignette = false;
	hitVignetteTimer = hitVignetteTimerSave;
}

shader_reset();
draw_set_alpha(vignetteAlpha);
draw_ellipse_colour(-200, -200, xScreenSize + 200, yScreenSize + 200, c_black , c_red, false);
draw_set_alpha(1);

//#####LAYER 1#####
	
if (drawBlackborders)
{
	if (blackbordersPos < 41)
	{
		blackbordersPos += global.dt;
	}
	if (blackbordersPos >= 41)
	{
		blackbordersPos = 42;
	}
}
else
{
	if (blackbordersPos > 1)
	{
		blackbordersPos -= global.dt;
	}
	if (blackbordersPos <= 1)
	{
		blackbordersPos = 0;
	}
}

if (!noHUD)
{
	draw_set_font(global.optixFont);
	draw_set_color(c_white);
	//Debug
	updateFPS -= global.dt;
	if (updateFPS < 0)
	{
		currFps = fps_real;
		updateFPS = updateFPSSave;
	}
	draw_text_colour(edgeMarginHor, 252, "Framerate: " + string(currFps), c_white, c_white, c_white, c_white, 1);

	//Healthbar
	if (player_obj.hp == 100)
	{
		draw_sprite_ext(healthbarBorderFull_spr, -1, edgeMarginHor, edgeMarginVer, 1, 1, 0, -1, 1);
	}
	else if (player_obj.hp > 20)
	{
		draw_sprite_ext(healthbarBorder_spr, -1, edgeMarginHor, edgeMarginVer, 1, 1, 0, -1, 1);
	}
	else
	{
		draw_sprite_ext(healthbarBorderLow_spr, -1, edgeMarginHor, edgeMarginVer, 1, 1, 0, -1, 1);
	}
	if (!player_obj.damageRecieved && healthbarDone)
	{
		draw_sprite_ext(healthbarTop2_spr, -1, edgeMarginHor, 19 - (player_obj.hp - 100), 1, 1, 0, -1, 1);
	}
	draw_sprite_ext(healthbar_spr, 0, edgeMarginHor, 131, 1, 1 * (player_obj.hp / 100) , 0, -1, 1);
	//Damage Healthbar
	if (player_obj.damageRecieved || healthbarShrinkStart)
	{
		healthbarDone = false;
		draw_sprite_ext(healthbarTop2Damage_spr, -1, edgeMarginHor, (19 - (player_obj.hpOld - 100)) + healthbarShrinking, 1, 1, 0, -1, 1);
		draw_sprite_ext(healthbarDamage_spr, 0, edgeMarginHor, (31 - (player_obj.hpOld - 100)) + healthbarShrinking, 1, ((player_obj.hp / 100) - (player_obj.hpOld / 100)) + (healthbarShrinking / 100), 0, -1, 1);
	}
	if (!player_obj.damageRecieved && !healthbarDone)
	{
		healthbarShrinkStart = true;
	}
	if (healthbarShrinkStart)
	{
		if (healthbarShrinking < (player_obj.hpOld - player_obj.hp))
		{
			healthbarShrinking += 2;
		}
		else
		{
			healthbarShrinking = 0;
			healthbarShrinkStart = false;
			healthbarDone = true;
		}
	}
	
	//Healthcut
	if (player_obj.syringesLost > 0)
	{
		draw_sprite_ext(healthCut_spr, 0, edgeMarginHor, 32 - player_obj.maxhp, 1, 1, 0, -1, 1);
	}

	//Syringes
	for (i = 0; i < player_obj.syringes; i++)
	{
		draw_sprite_ext(syringe_spr, -1, 42, 24 + 16 * i, 1, 1, -1, -1, 1);
	}
	
	//Chipbar
	draw_sprite_ext(scoreBorder_spr, -1, 380, edgeMarginVer, 1, 1, 0, -1, 1);
	
	convMoney = string(global.money);
	slots = [0,0,0,0,0,0,0];
	for (i = 0; i < 6; i++)
	{
		if (string_char_at(convMoney, i+1) == "")
		{
			slots[i] = 0;
		}
		else
		{
			slots[i] = int64(string_char_at(convMoney, i+1));
		}
	}

	if (scoreSpin)
	{
		scoreSpinTimer -= global.dt;
		draw_sprite(scoreNumberSpin_spr, -1, 457, edgeMarginVer + 2);
		draw_sprite(scoreNumberSpin_spr, -1, 447, edgeMarginVer + 2);
		draw_sprite(scoreNumberSpin_spr, -1, 437, edgeMarginVer + 2);
		draw_sprite(scoreNumberSpin_spr, -1, 427, edgeMarginVer + 2);
		draw_sprite(scoreNumberSpin_spr, -1, 417, edgeMarginVer + 2);
		draw_sprite(scoreNumberSpin_spr, -1, 407, edgeMarginVer + 2);
		draw_sprite(scoreNumberSpin_spr, -1, 397, edgeMarginVer + 2);
	}
	else
	{
		draw_sprite(scoreNumber_spr, slots[6], 457, edgeMarginVer + 2);
		draw_sprite(scoreNumber_spr, slots[5], 447, edgeMarginVer + 2);
		draw_sprite(scoreNumber_spr, slots[4], 437, edgeMarginVer + 2);
		draw_sprite(scoreNumber_spr, slots[3], 427, edgeMarginVer + 2);
		draw_sprite(scoreNumber_spr, slots[2], 417, edgeMarginVer + 2);
		draw_sprite(scoreNumber_spr, slots[1], 407, edgeMarginVer + 2);
		draw_sprite(scoreNumber_spr, slots[0], 397, edgeMarginVer + 2);
	}
	
	if (scoreSpinTimer < 0)
	{
		scoreSpinTimer = scoreSpinTimerSave;
		scoreSpin = false;
	}

	//Ammo
	if (global.currentWeapon == gameManager_obj.pickedWeapon.pistol || global.currentWeapon == gameManager_obj.pickedWeapon.dualBarettas)
	{
		for (i = 0; i < global.pistolMag / 18; i++)
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
		for (i = 0; i < global.shotgunMag / 6; i++)
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

//Menu Window
if (showWindowMenu)
{
	draw_sprite_ext(menuWindow_spr, 0, xScreenSize / 2, (yScreenSize / 2) + windowMenuOffset, 1, 1, 0, -1, 1);
	
	draw_set_font(gothicPixel_fnt);
	draw_set_halign(fa_center);
	draw_set_color(c_black);
	draw_text(xScreenSize / 2 - 1, (yScreenSize / 2) + 86 + 1, "Press Esc to Cancel");
	draw_set_color(make_color_rgb(255, 215, 0));
	draw_text(xScreenSize / 2, (yScreenSize / 2) + 86, "Press Esc to Cancel");
	draw_set_halign(fa_left);
	
	//Draw items
	if (windowType == 1)
	{
		//Names
		draw_set_font(gothicPixel_fnt);
		draw_set_halign(fa_center);
		draw_set_color(c_black);
		draw_text(xScreenSize / 2 - 1, (((yScreenSize / 2) + windowMenuOffset) - 48) + 1, "Shotgun");
		draw_text((xScreenSize / 2) + 86 - 1, (((yScreenSize / 2) + windowMenuOffset) - 48) + 1, "Jetpack");
		draw_text((xScreenSize / 2) - 86 - 1, (((yScreenSize / 2) + windowMenuOffset) - 48) + 1, "Pistol Lasersight");
		draw_set_color(make_color_rgb(255, 215, 0));
		draw_text(xScreenSize / 2, ((yScreenSize / 2) + windowMenuOffset) - 48, "Shotgun");
		draw_text((xScreenSize / 2) + 86, ((yScreenSize / 2) + windowMenuOffset) - 48, "Jetpack");
		draw_text((xScreenSize / 2) - 86, ((yScreenSize / 2) + windowMenuOffset) - 48, "Pistol Lasersight");
		draw_set_halign(fa_left);
		//Frames
		draw_sprite(itemFrame_spr, 0, xScreenSize / 2, (yScreenSize / 2) + windowMenuOffset);
		draw_sprite(itemFrame_spr, 0, (xScreenSize / 2) + 86, (yScreenSize / 2) + windowMenuOffset);
		draw_sprite(itemFrame_spr, 0, (xScreenSize / 2) - 86, (yScreenSize / 2) + windowMenuOffset);
		//Descriptions
		draw_set_font(gothicPixel_fnt);
		draw_set_halign(fa_center);
		draw_set_color(c_black);
		draw_text(xScreenSize / 2 - 1, (((yScreenSize / 2) + windowMenuOffset) + 42) + 1, "1350$");
		draw_text((xScreenSize / 2) + 86 - 1, (((yScreenSize / 2) + windowMenuOffset) + 42) + 1, "3850$");
		draw_text((xScreenSize / 2) - 86 - 1, (((yScreenSize / 2) + windowMenuOffset) + 42) + 1, "215$");
		if (global.money > 1349)
		{
			draw_set_color(make_color_rgb(255, 215, 0));
		}
		else
		{
			draw_set_color(c_red);
		}
		draw_text(xScreenSize / 2, ((yScreenSize / 2) + windowMenuOffset) + 42, "1350$");
		if (global.money > 3849)
		{
			draw_set_color(make_color_rgb(255, 215, 0));
		}
		else
		{
			draw_set_color(c_red);
		}
		draw_text((xScreenSize / 2) + 86, ((yScreenSize / 2) + windowMenuOffset) + 42, "3850$");
		if (global.money > 214)
		{
			draw_set_color(make_color_rgb(255, 215, 0));
		}
		else
		{
			draw_set_color(c_red);
		}
		draw_text((xScreenSize / 2) - 86, ((yScreenSize / 2) + windowMenuOffset) + 42, "215$");
		draw_set_halign(fa_left);
	}
	
	if (windowMenuOffset < 4)
	{
		windowMenuOffset = 0;
	}
	else
	{
		windowMenuOffset -= global.dt * 1.5;
	}
}
else
{
	windowMenuOffset = windowMenuOffsetSave;
	windowType = 0;
}

draw_set_alpha(1);

//Infectiontext
if (drawInfectionText)
{
	draw_set_font(global.optixFont);
	draw_sprite_ext(death_spr, 0, camera_obj.xScreenSize / 2, camera_obj.yScreenSize / 4, 1.5, 1.5, 0, -1, 1);
	draw_set_color(c_white);
	draw_text(camera_obj.xScreenSize - (camera_obj.xScreenSize / 4) - 48, camera_obj.yScreenSize - (camera_obj.yScreenSize / 5) + 32, "Syringes Left: " + string(player_obj.syringes))
	draw_set_font(gothicPixel_fnt);
	draw_set_color(make_color_rgb(255, 215, 0));
	draw_set_halign(fa_center);
	draw_sprite(button_spr, 0, camera_obj.xScreenSize / 4, camera_obj.yScreenSize - (camera_obj.yScreenSize / 4));
	draw_sprite(button_spr, 0, camera_obj.xScreenSize - (camera_obj.xScreenSize / 4), camera_obj.yScreenSize - (camera_obj.yScreenSize / 4));
	draw_text(camera_obj.xScreenSize - (camera_obj.xScreenSize / 4), camera_obj.yScreenSize - (camera_obj.yScreenSize / 4) - 4, "INFECT [E]");
	draw_text(camera_obj.xScreenSize / 4, camera_obj.yScreenSize - (camera_obj.yScreenSize / 4) - 4, "DIE [Q]");
	draw_set_halign(fa_left);
}
if (player_obj.isZombie)
{
	draw_set_font(global.optixFontHuge);
	draw_sprite(death_spr, 0, camera_obj.xScreenSize / 2, camera_obj.yScreenSize / 2);
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

//#####LAYER 4#####
if (!noHUD)
{
	draw_sprite(guiBorder_spr, 0, 0, 0);
}

//black borders
draw_sprite(blackborder_spr, 0, xScreenSize / 2, blackbordersPos);
draw_sprite(blackborder_spr, 0, xScreenSize / 2, yScreenSize + 42 - blackbordersPos);
