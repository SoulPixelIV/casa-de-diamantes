/// @description Player UI
if (instance_exists(player_obj))
{
	//Ammo Counter
	if (!player_obj.reloading)
	{
		anim = 0;
		if (global.currentWeapon == pickedWeapon.dualBarettas)
		{
			if (global.pistolAmmo < 5)
			{
				draw_sprite_ext(ammoCounter_spr, global.pistolAmmo, player_obj.x - 22, player_obj.y - 20, 1, 1, 0, -1, 1 / (global.pistolAmmo + 1) * 1.5);
			}
		}
		if (global.currentWeapon == pickedWeapon.shotgun)
		{
			if (global.shotgunAmmo < 5)
			{
				draw_sprite_ext(ammoCounter_spr, global.shotgunAmmo, player_obj.x - 22, player_obj.y - 20, 1, 1, 0, -1, 1 / (global.shotgunAmmo + 1) * 1.5);
			}
		}
	}
	else
	{
		if (anim >= sprite_get_number(ammoCounterReloading_spr))
		{
			anim2 += global.dt / 20;
			draw_sprite_ext(ammoCounterReloadingFailed_spr, anim2, player_obj.x - 22, player_obj.y - 20, 1, 1, 0, -1, 1);
			if (anim2 >= sprite_get_number(ammoCounterReloadingFailed_spr))
			{
				anim2 = 0;
			}
		}
		else
		{
			anim += global.dt / 20;
			draw_sprite_ext(ammoCounterReloading_spr, anim, player_obj.x - 22, player_obj.y - 20, 1, 1, 0, -1, 1);
		}

		//Check Perfect Reload
		if (player_obj.key_reload && !reloadFailed && anim > 3)
		{
			if (anim > sprite_get_number(ammoCounterReloading_spr) - 3 && anim <= sprite_get_number(ammoCounterReloading_spr))
			{
				reload_scr();
			}
			else
			{
				reloadFailed = true;
			}
		}
	}
	
	//Walljump Indicator
	if (showWalljumpsLeft)
	{
		draw_sprite_ext(walljumpIndicator_spr, player_obj.wallJumps, player_obj.x + 14, player_obj.y - 18, 1, 1, 0, -1, 1);
	}
	if (player_obj.huggingWall)
	{
		showWalljumpsLeft = true;
	}
	if (player_obj.grounded)
	{
		showWalljumpsLeft = false;
	}

	//Dash Circle
	if (player_obj.dashDelay < 150)
	{
		var dashCircle = draw_sprite_ext(dashCircle_spr, 0, player_obj.x, player_obj.y, 1 / (player_obj.dashDelay / 60), 1 / (player_obj.dashDelay / 60), 0, -1, 0.2 / (player_obj.dashDelay / 40))
	}
	
	//Player Infection Timer
	/*
	if (player_obj.plagueTransformation)
	{
		draw_set_font(gothicPixel_fnt);
		draw_set_color(make_color_rgb(255, 215, 0));
		draw_set_halign(fa_center);
		draw_text(player_obj.x, player_obj.y - 38, round(player_obj.infection));
		draw_set_halign(fa_left);
	}
	*/
}

//Set Character for Dialogue
if (string_char_at(dialogue[dialogueLine], 1) == "#")
{
	character = player_obj;
}
if (string_char_at(dialogue[dialogueLine], 1) == "@")
{
	character = shopWorker_obj;
}
if (string_char_at(dialogue[dialogueLine], 1) == "$")
{
	character = cindy_obj;
}
if (string_char_at(dialogue[dialogueLine], 1) == "%")
{
	character = cutieplus_obj;
}
if (string_char_at(dialogue[dialogueLine], 1) == "]")
{
	character = bartender_obj;
}
if (string_char_at(dialogue[dialogueLine], 1) == "[")
{
	character = casinobunny_obj;
}

//Windows
if (string_char_at(dialogue[dialogueLine], 1) == "W")
{
	if (string_char_at(dialogue[dialogueLine], 2) == "1")
	{
		showWindowMenu = true;
		windowType = 1;
	}
}
//Games
if (string_char_at(dialogue[dialogueLine], 1) == "G")
{
	if (string_char_at(dialogue[dialogueLine], 2) == "1")
	{
		part_emitter_destroy_all(global.partSystem);
		room_goto(blackjackTable);
		instance_destroy(player_obj);
	}
}

//Draw Dialogue
if (drawText && !showWindowMenu)
{
	draw_set_font(gothicPixel_fnt);
	draw_set_halign(fa_center);
	draw_set_color(c_black);
	draw_sprite_ext(dialogBorder_spr, 0, character.x, character.y - 34,2 + string_length(dialogueStripped) / 3, 1.5, 0, -1, 1);
	draw_text(character.x - 1, character.y - 38 + 1, string_copy(dialogueStripped, 1, string_length(dialogue[dialogueLine])));
	draw_set_color(make_color_rgb(255, 215, 0));
	draw_text(character.x, character.y - 38, string_copy(dialogueStripped, 1, string_length(dialogue[dialogueLine])));
	draw_set_halign(fa_left);

	//Sentence incomplete
	if (letterCount < string_length(dialogue[dialogueLine]))
	{
		letterDelay -= global.dt;
		if (letterDelay < 0)
		{
			dialogueStripped = string_copy(dialogue[dialogueLine], 2, letterCount);
			letterCount++;
			letterDelay = letterDelaySave;
		}
	}
	else //Sentence complete
	{
		textDelay -= global.dt;
		if (textDelay < 0)
		{
			dialogueLine++;
			letterCount = 2;
			dialogueStripped = "";
			if (dialogue[dialogueLine] == "")
			{
				drawText = false;
				dialogueLine = 0;
			}
			textDelay = textDelaySave;
		}
	}
}

//Draw Tutorials
tutorialAnimTimer -= global.dt;

if (tutorialAnimTimer < 0)
{
	if (tutorialAnimImage == 0)
	{
		tutorialAnimImage = 1;
	}
	else
	{
		tutorialAnimImage = 0;
	}
	tutorialAnimTimer = tutorialAnimTimerSave;
}

with (player_obj)
{
	if (place_meeting(x, y, tutorialWKeyPromt_obj))
	{
		with (camera_obj)
		{
			draw_sprite(wKeyPromt_spr, tutorialAnimImage, player_obj.x, player_obj.y - 32);
		}
	}
	if (place_meeting(x, y, tutorialADKeyPromt_obj))
	{
		with (camera_obj)
		{
			draw_sprite(adKeyPrompt_spr, tutorialAnimImage, player_obj.x, player_obj.y - 32);
		}
	}
	if (place_meeting(x, y, tutorialSpaceKeyPromt_obj))
	{
		with (camera_obj)
		{
			draw_sprite(spaceKeyPrompt_spr, tutorialAnimImage, player_obj.x, player_obj.y - 32);
		}
	}
	if (place_meeting(x, y, tutorialShiftKeyPromt_obj))
	{
		with (camera_obj)
		{
			draw_sprite(shiftKeyPrompt_spr, tutorialAnimImage, player_obj.x, player_obj.y - 32);
		}
	}
	if (place_meeting(x, y, tutorialMousePromt_obj))
	{
		with (camera_obj)
		{
			draw_sprite(mousePromt_spr, tutorialAnimImage, player_obj.x, player_obj.y - 32);
		}
	}
}


//################################################################## GUI LAYER ######################################################################

//#####LAYER 0#####

//Lens Dirt + Vignette
draw_sprite_ext(lensDirt1_spr, 0, randParticleX + partMovement + (x - xScreenSize / 2), randParticleY + partMovement / 2 + (y - yScreenSize / 2), 1, 1, 0, -1, 0.135);
draw_sprite_ext(lensDirt2_spr, 0, randParticleX2 + partMovement + (x - xScreenSize / 2), randParticleY2 + partMovement / 2 + (y - yScreenSize / 2), 1, 1, 0, -1, 0.135);
draw_sprite_ext(lensDirt2_spr, 0, randParticleX3 + partMovement + (x - xScreenSize / 2), randParticleY3 + partMovement / 2 + (y - yScreenSize / 2), 1, 1, 0, -1, 0.135);
draw_sprite_ext(lensDirt2_spr, 0, randParticleX4 + partMovement + (x - xScreenSize / 2), randParticleY4 + partMovement / 2 + (y - yScreenSize / 2), 1, 1, 0, -1, 0.135);

draw_sprite_ext(lensDirt1_spr, 0, randParticle2X + partMovement + (x - xScreenSize / 2), randParticle2Y + partMovement / 2 + (y - yScreenSize / 2), 1, 1, 0, -1, 0.135);
draw_sprite_ext(lensDirt2_spr, 0, randParticle2X2 + partMovement + (x - xScreenSize / 2), randParticle2Y2 + partMovement / 2 + (y - yScreenSize / 2), 1, 1, 0, -1, 0.135);
draw_sprite_ext(lensDirt2_spr, 0, randParticle2X3 + partMovement + (x - xScreenSize / 2), randParticle2Y3 + partMovement / 2 + (y - yScreenSize / 2), 1, 1, 0, -1, 0.135);
draw_sprite_ext(lensDirt2_spr, 0, randParticle2X4 + partMovement + (x - xScreenSize / 2), randParticle2Y4 + partMovement / 2 + (y - yScreenSize / 2), 1, 1, 0, -1, 0.135);
	
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

if (instance_exists(player_obj)) {
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
}

if (hitVignetteTimer < 0)
{
	hitVignette = false;
	hitVignetteTimer = hitVignetteTimerSave;
}

shader_reset();
draw_set_alpha(vignetteAlpha);
draw_ellipse_colour(x - xScreenSize, y - yScreenSize, x + xScreenSize, y + yScreenSize, c_black , c_red, false);
draw_set_alpha(1);

if (instance_exists(player_obj)) {
	if (player_obj.plagueTransformation)
	{
	    shader_reset();
	    draw_set_alpha(0.4);
	    draw_ellipse_colour(x - xScreenSize, y - yScreenSize, x + xScreenSize, y + yScreenSize, c_black , c_purple, false);
	    draw_set_alpha(1);
	}

	if (player_obj.slowmo)
	{
		shader_reset();
	    draw_set_alpha(((player_obj.sniperDamageValue / 100) / 5) / 2);
	    draw_ellipse_colour(x - xScreenSize, y - yScreenSize, x + xScreenSize, y + yScreenSize, c_black , make_color_rgb(255,215,0), false);
	    draw_set_alpha(1);
	}
}

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

if (!noHUD && instance_exists(player_obj))
{
	draw_set_font(global.optixFont);
	draw_set_color(c_white);
	//Debug
	updateFPS -= global.dt;
	if (updateFPS < 0)
	{
		currFps = round(fps_real);
		currDeltatime = global.dt;
		updateFPS = updateFPSSave;
	}
	draw_text_colour((x - xScreenSize / 2) + 16, (y + yScreenSize / 2) - 16, "Framerate: " + string(currFps), c_white, c_white, c_white, c_white, 1);
	draw_text_colour((x - xScreenSize / 2) + 16, (y + yScreenSize / 2) - 32, "Delta: " + string(currDeltatime), c_white, c_white, c_white, c_white, 1);

	//Healthbar
	if (player_obj.plagueTransformation)
	{
		draw_sprite_ext(healthbarBorderInfection_spr, -1, (x - xScreenSize / 2) + 16, (y - yScreenSize / 2) + 9, 1, 1, 0, -1, 1);
	}
	else if (player_obj.hp == 100)
	{
		draw_sprite_ext(healthbarBorderFull_spr, -1, (x - xScreenSize / 2) + 16, (y - yScreenSize / 2) + 9, 1, 1, 0, -1, 1);
	}
	else if (player_obj.hp > 20)
	{
		draw_sprite_ext(healthbarBorder_spr, -1, (x - xScreenSize / 2) + 16, (y - yScreenSize / 2) + 9, 1, 1, 0, -1, 1);
	}
	else
	{
		draw_sprite_ext(healthbarBorderLow_spr, -1, (x - xScreenSize / 2) + 16, (y - yScreenSize / 2) + 9, 1, 1, 0, -1, 1);
	}
	if (!player_obj.damageRecieved && healthbarDone)
	{
		draw_sprite_ext(healthbarTop2_spr, -1, 18 + (x - xScreenSize / 2), 18 - (player_obj.hp - 100) + (y - yScreenSize / 2), 1, 1, 0, -1, 1);
	}
	draw_sprite_ext(healthbar_spr, 0, 18 + (x - xScreenSize / 2), 130 + (y - yScreenSize / 2), 1, 1 * (player_obj.hp / 100), 0, -1, 1);
	if (player_obj.plagueTransformation)
	{
		draw_sprite_ext(healthbarTop2Infection_spr, -1, 18 + (x - xScreenSize / 2), (118 - player_obj.infection) + (y - yScreenSize / 2), 1, 1, 0, -1, 1);
		draw_sprite_ext(healthbarInfection_spr, 0, 18 + (x - xScreenSize / 2), 130 + (y - yScreenSize / 2), 1, player_obj.infection / 100, 0, -1, 1);
	}
	//Damage Healthbar
	if (player_obj.damageRecieved || healthbarShrinkStart)
	{
		healthbarDone = false;
		draw_sprite_ext(healthbarTop2Damage_spr, -1, 18 + (x - xScreenSize / 2), ((18 - (player_obj.hpOld - 100)) + healthbarShrinking) + (y - yScreenSize / 2), 1, 1, 0, -1, 1);
		draw_sprite_ext(healthbarDamage_spr, 0, 18 + (x - xScreenSize / 2), (30 - (player_obj.hpOld - 100)) + healthbarShrinking + (y - yScreenSize / 2), 1, ((player_obj.hp / 100) - (player_obj.hpOld / 100)) + (healthbarShrinking / 100), 0, -1, 1);
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

	//Syringes
	for (i = 0; i < global.syringes; i++)
	{
		draw_sprite_ext(syringe_spr, -1, 32 + x - xScreenSize / 2, ((y - yScreenSize / 2) + 70) + 16 * i, 1, 1, -1, -1, 1);
	}
	
	//Chipbar
	draw_sprite_ext(scoreBorder_spr, -1, x + (xScreenSize / 2) - 16, 9 + y - (yScreenSize / 2), 1, 1, 0, -1, 1);
	
	//Radiation Meter
	if (instance_exists(player_obj))
	{
		if (player_obj.radiation > 0 && player_obj.radiation < 80)
		{
			draw_sprite(radiationMeter_spr, 0, (x + xScreenSize / 2) - 16, (y + yScreenSize / 2) - 9);
			draw_sprite_ext(radiationMeterLine_spr, 0, (x + xScreenSize / 2) - 60, (y + yScreenSize / 2) - 48, 1, 1, (-player_obj.radiation * 1.5) +75, -1, 1);
		}
		if (player_obj.radiation > 80)
		{
			draw_sprite(radiationMeterAlarm_spr, -1, (x + xScreenSize / 2) - 16, (y + yScreenSize / 2) - 9);
			draw_sprite_ext(radiationMeterLine_spr, 0, (x + xScreenSize / 2) - 60, (y + yScreenSize / 2) - 48, 1, 1, (-player_obj.radiation * 1.5) +75, -1, 1);
		}
	}
	
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
		draw_sprite(scoreNumberSpin_spr, -1, x + (xScreenSize / 2) - 28, 11 + (y - yScreenSize / 2));
		draw_sprite(scoreNumberSpin_spr, -1, x + (xScreenSize / 2) - 38, 11 + (y - yScreenSize / 2));
		draw_sprite(scoreNumberSpin_spr, -1, x + (xScreenSize / 2) - 48, 11 + (y - yScreenSize / 2));
		draw_sprite(scoreNumberSpin_spr, -1, x + (xScreenSize / 2) - 58, 11 + (y - yScreenSize / 2));
		draw_sprite(scoreNumberSpin_spr, -1, x + (xScreenSize / 2) - 68, 11 + (y - yScreenSize / 2));
		draw_sprite(scoreNumberSpin_spr, -1, x + (xScreenSize / 2) - 78, 11 + (y - yScreenSize / 2));
		draw_sprite(scoreNumberSpin_spr, -1, x + (xScreenSize / 2) - 88, 11 + (y - yScreenSize / 2));
	}
	else
	{
		draw_sprite(scoreNumber_spr, slots[6], x + (xScreenSize / 2) - 28, 11 + (y - yScreenSize / 2));
		draw_sprite(scoreNumber_spr, slots[5], x + (xScreenSize / 2) - 38, 11 + (y - yScreenSize / 2));
		draw_sprite(scoreNumber_spr, slots[4], x + (xScreenSize / 2) - 48, 11 + (y - yScreenSize / 2));
		draw_sprite(scoreNumber_spr, slots[3], x + (xScreenSize / 2) - 58, 11 + (y - yScreenSize / 2));
		draw_sprite(scoreNumber_spr, slots[2], x + (xScreenSize / 2) - 68, 11 + (y - yScreenSize / 2));
		draw_sprite(scoreNumber_spr, slots[1], x + (xScreenSize / 2) - 78, 11 + (y - yScreenSize / 2));
		draw_sprite(scoreNumber_spr, slots[0], x + (xScreenSize / 2) - 88, 11 + (y - yScreenSize / 2));
	}
	
	if (scoreSpinTimer < 0)
	{
		scoreSpinTimer = scoreSpinTimerSave;
		scoreSpin = false;
	}

	//Ammo
	draw_set_color(c_white);
	wheelRotation += wheelSpeed * global.dt;
	if (wheelRotation >= 360)
	{
		wheelRotation = 0;
	}
	var field1Degree = 230;
	var field2Degree = 50;
	var field1 = draw_sprite_ext(ammoCircleDualBarettaField_spr, global.pistolAmmo, 59 + x - xScreenSize / 2, 36 + y - yScreenSize / 2, -1, -1, wheelRotation, -1, 1);
	var field2 = draw_sprite_ext(ammoCircleShotgunField_spr, global.shotgunAmmo, 59 + x - xScreenSize / 2, 36 + y - yScreenSize / 2, 1, 1, wheelRotation, -1, 1);
	
	var field3 = draw_sprite_ext(ammoCircleRedField_spr, 0, 59 + x - xScreenSize / 2, 36 + y - yScreenSize / 2, -1, 1, wheelRotation, -1, 1);
	var field4 = draw_sprite_ext(ammoCircleRedField_spr, 0, 59 + x - xScreenSize / 2, 36 + y - yScreenSize / 2, 1, -1, wheelRotation, -1, 1);

	if (global.currentWeapon == gameManager_obj.pickedWeapon.dualBarettas)
	{
		draw_sprite(ammoCircle_spr, 1, 32 + x - xScreenSize / 2, 9 + y - yScreenSize / 2);
	}
	else if (global.currentWeapon == gameManager_obj.pickedWeapon.shotgun)
	{
		draw_sprite(ammoCircle_spr, 2, 32 + x - xScreenSize / 2, 9 + y - yScreenSize / 2);
	}
	else
	{
		draw_sprite(ammoCircle_spr, 0, 32 + x - xScreenSize / 2, 9 + y - yScreenSize / 2);
	}
	
	//Weapon
	draw_set_color(make_color_rgb(255,215,0));
	draw_set_halign(fa_center);
	newWeaponTimer -= global.dtNoSlowmo;
	if (newWeapon)
	{
		if (wheelSpeed < 19.5)
		{
			wheelSpeed += global.dt;
		}
		if (wheelSpeed > 19.5)
		{
			wheelSpeed = 20;
		}
		if (global.currentWeapon == gameManager_obj.pickedWeapon.pistol)
		{
			draw_text(x, y + (yScreenSize / 3), "Pistol");
		}
		if (global.currentWeapon == gameManager_obj.pickedWeapon.dualBarettas)
		{
			draw_text(x, y + (yScreenSize / 3), "Dual Barettas");
		}
		if (global.currentWeapon == gameManager_obj.pickedWeapon.shotgun)
		{
			draw_text(x, y + (yScreenSize / 3), "Shotgun");
		}
		if (global.currentWeapon == gameManager_obj.pickedWeapon.sniper)
		{
			draw_text(x, y + (yScreenSize / 3), "Sniper Rifle");
		}
	}
	else
	{
		if (wheelSpeed > 2)
		{
			wheelSpeed -= global.dt / 10;
		}
		if (wheelSpeed < 2 && wheelSpeed >= 0)
		{
			if (global.currentWeapon == gameManager_obj.pickedWeapon.dualBarettas)
			{
				if (wheelRotation > field1Degree - 15 && wheelRotation < field1Degree + 15)
				{
					wheelSpeed = 0;
					wheelRotation = field1Degree;
				}
			}
			if (global.currentWeapon == gameManager_obj.pickedWeapon.shotgun)
			{
				if (wheelRotation > field2Degree - 15 && wheelRotation < field2Degree + 15)
				{
					wheelSpeed = 0;
					wheelRotation = field2Degree;
				}
			}
		}
	}
	if (newWeaponTimer < 0)
	{
		newWeaponTimer = newWeaponTimerSave;
		newWeapon = false;
	}
	draw_set_halign(fa_left);
	
	//Timer + Combo for Horde Mode
	if (room == infiniteSpawn) {
		draw_text(x - xScreenSize / 3.5, y - yScreenSize / 2.5, "TIME: " + string(global.timer));
		draw_text(x - xScreenSize / 3.5, (y - yScreenSize / 2.5) + 16, "SCORE: " + string(global.scorepoints));
		
		if (global.multiplier == 1) {
			draw_sprite(score1X_spr, -1, player_obj.x + 32, player_obj.y - 32);
		}
		if (global.multiplier == 2) {
			draw_sprite(score2X_spr, -1, player_obj.x + 32, player_obj.y - 32);
		}
		if (global.multiplier == 4) {
			draw_sprite(score4X_spr, -1, player_obj.x + 32, player_obj.y - 32);
		}
		if (global.multiplier == 8) {
			draw_sprite(score8X_spr, -1, player_obj.x + 32, player_obj.y - 32);
		}
	}
}

//#####LAYER 2#####
//Menu Window
if (showWindowMenu)
{
	draw_sprite_ext(menuWindow_spr, 0, x, (y) + windowMenuOffset, 1, 1, 0, -1, 1);
	
	draw_set_font(gothicPixel_fnt);
	draw_set_halign(fa_center);
	draw_set_color(c_black);
	draw_text(x - 1, (y) + 86 + 1, "Press Esc to Cancel");
	draw_set_color(make_color_rgb(255, 215, 0));
	draw_text(x, (y) + 86, "Press Esc to Cancel");
	draw_set_halign(fa_left);
	
	//Draw items
	if (windowType == 1)
	{
		//Names
		draw_set_font(gothicPixel_fnt);
		draw_set_halign(fa_center);
		draw_set_color(c_black);
		draw_text(x - 1, (((y) + windowMenuOffset) - 48) + 1, "Shotgun");
		draw_text((x) + 86 - 1, (((y) + windowMenuOffset) - 48) + 1, "Jetpack");
		draw_text((x) - 86 - 1, (((y) + windowMenuOffset) - 48) + 1, "Pistol Lasersight");
		draw_set_color(make_color_rgb(255, 215, 0));
		draw_text(x, ((y) + windowMenuOffset) - 48, "Shotgun");
		draw_text((x) + 86, ((y) + windowMenuOffset) - 48, "Jetpack");
		draw_text((x) - 86, ((y) + windowMenuOffset) - 48, "Pistol Lasersight");
		draw_set_halign(fa_left);
		//Frames
		draw_sprite(itemFrame_spr, 0, x, (y) + windowMenuOffset);
		draw_sprite(itemFrame_spr, 0, (x) + 86, (y) + windowMenuOffset);
		draw_sprite(itemFrame_spr, 0, (x) - 86, (y) + windowMenuOffset);
		//Descriptions
		draw_set_font(gothicPixel_fnt);
		draw_set_halign(fa_center);
		draw_set_color(c_black);
		draw_text(x - 1, (((y) + windowMenuOffset) + 42) + 1, "1350$");
		draw_text((x) + 86 - 1, (((y) + windowMenuOffset) + 42) + 1, "3850$");
		draw_text((x) - 86 - 1, (((y) + windowMenuOffset) + 42) + 1, "215$");
		if (global.money > 1349)
		{
			draw_set_color(make_color_rgb(255, 215, 0));
		}
		else
		{
			draw_set_color(c_red);
		}
		draw_text(x, ((y) + windowMenuOffset) + 42, "1350$");
		if (global.money > 3849)
		{
			draw_set_color(make_color_rgb(255, 215, 0));
		}
		else
		{
			draw_set_color(c_red);
		}
		draw_text((x) + 86, ((y) + windowMenuOffset) + 42, "3850$");
		if (global.money > 214)
		{
			draw_set_color(make_color_rgb(255, 215, 0));
		}
		else
		{
			draw_set_color(c_red);
		}
		draw_text((x) - 86, ((y) + windowMenuOffset) + 42, "215$");
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
	deathDelayTimer -= global.dt;
}

if (deathDelayTimer < 0)
{
	if (!finalDeath)
	{
		if (deathFadeIn < 0.95)
		{
			deathFadeIn += global.dt / 100;
		}
		else
		{
			deathFadeIn = 1;
		}
		draw_set_alpha(deathFadeIn);
		draw_set_font(global.optixFont);
		draw_sprite_ext(death_spr, 0, x, (y - yScreenSize / 4), 1.5, 1.5, 0, -1, deathFadeIn);
		draw_set_color(c_white);
		draw_text((x + xScreenSize / 4) - 48, (y + yScreenSize / 4) + 32, "Syringes Left: " + string(global.syringes))
		draw_set_font(gothicPixel_fnt);
		draw_set_color(make_color_rgb(255, 215, 0));
		draw_set_halign(fa_center);
		draw_sprite(button_spr, 0, (x - xScreenSize / 4), (y + yScreenSize / 4));
		draw_sprite(button_spr, 0, (x + xScreenSize / 4), (y + yScreenSize / 4));
		draw_text((x - xScreenSize / 4), (y + yScreenSize / 4) - 4, "DIE [Q]");
		draw_text((x + xScreenSize / 4), (y + yScreenSize / 4) - 4, "INFECT [E]");
		draw_set_halign(fa_left);
	}
	else
	{
		draw_set_color(c_black);
		draw_rectangle(300 - (x - xScreenSize / 2), 225 - (y - yScreenSize / 2), 1600 + (x - xScreenSize / 2), 1150 + (y - yScreenSize / 2), false);
		draw_set_alpha(1);
		draw_sprite_ext(death_spr, 0, x, (y - yScreenSize / 4), 2, 2, 0, c_red, 0.2);
		draw_sprite_ext(death_spr, 0, x, (y - yScreenSize / 4), 1.5, 1.5, 0, c_red, 1);
		finalDeathScreenTimer -= global.dt;
		if (finalDeathScreenTimer < 0)
		{
			blackscreenStrength += global.dt / 100;
		}
		if (blackscreenStrength > 0.95)
		{
			pauseDeathTimer -= global.dt;
		}
		if (pauseDeathTimer < 0)
		{
			deathScreenIsDark = false;
			respawnSetScreenBrightness = true;
			finalDeathScreenTimer = finalDeathScreenTimerSave;
			fullDeath_scr();
			drawInfectionText = false;
			finalDeath = false;
			pauseDeathTimer = pauseDeathTimerSave;
			deathDelayTimer = deathDelayTimerSave;
			deathFadeIn = 0;
		}
	}
}

if (respawnSetScreenBrightness)
{
	if (blackscreenStrength > 0.05)
	{
		blackscreenStrength -= global.dt / 100;
	}
	else
	{
		blackscreenStrength = 0;
		respawnSetScreenBrightness = false;
	}
}

/*
if (player_obj.isZombie)
{
	draw_set_font(global.optixFontHuge);
	draw_sprite(death_spr, 0, camera_obj.xScreenSize / 2, camera_obj.yScreenSize / 2);
	draw_set_color(c_white);
	draw_text(116, 78, "PRESS 'F' TO BECOME HUMAN AGAIN!");
	draw_text(116, 111, "PRESS 'Q' TO DIE INSTANTLY!");
}
*/

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

	draw_sprite(infectedOverlay_spr, 0, infOverlayX + (x - xScreenSize / 2), infOverlayY + (y - yScreenSize / 2));
}

//#####LAYER 3#####
if (!noHUD)
{
	draw_sprite(guiBorder_spr, 0, x - xScreenSize / 2, y - yScreenSize / 2);
}

//#####LAYER 4#####
draw_set_alpha(blackscreenStrength);
draw_set_color(c_black);
draw_rectangle(x - xScreenSize, y - yScreenSize, x + xScreenSize, y + yScreenSize, false);
draw_set_alpha(1);

//black borders
draw_sprite(blackborder_spr, 0, x, blackbordersPos + (y - yScreenSize / 2));
draw_sprite(blackborder_spr, 0, x, (y + yScreenSize / 2) + 42 - blackbordersPos);

if (instance_exists(player_obj)) {
	if (player_obj.sniperDamageValue > 0)
	{
		draw_sprite_ext(blackborder_spr, 0, x, 42 + (y - yScreenSize / 2), 1, 1, 0, -1, (player_obj.sniperDamageValue / 100) / 5);
		draw_sprite_ext(blackborder_spr, 0, x, y + yScreenSize / 2, 1, 1, 0, -1, (player_obj.sniperDamageValue / 100) / 5);
	}

	//Cursor
	//Crosshair Setup
	if (player_obj.inputMethod == 0)
	{
		draw_sprite(cursor_spr, 0, mouse_x, mouse_y);
	}
}