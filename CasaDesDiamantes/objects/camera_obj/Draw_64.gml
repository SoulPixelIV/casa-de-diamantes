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
if (string_char_at(dialogue[dialogueLine], 1) == "^")
{
	character = vip_obj;
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

if (drawTutorialInfection) {	
	player_obj.movement = false;
	draw_sprite_ext(menuWindow_spr, 0, x, y, 1, 1, 0, -1, 1);
	
	draw_set_font(gothicPixel_fnt);
	draw_set_halign(fa_center);
	draw_set_color(c_black);
	draw_text(x - 1, 0 / 3 + 32, "Tutorial - Infection\nToxic Fumes and more can cause an Infection.\nFind a sterilization chamber to heal yourself!\nWatch your healthbar to see the\nprogress of the Infection.\n\nPress Space to Continue!");
	draw_set_color(make_color_rgb(255, 215, 0));
	draw_text(x, 0 / 3 + 32, "Tutorial - Infection\nToxic Fumes and more can cause an Infection.\nFind a sterilization chamber to heal yourself!\nWatch your healthbar to see the\nprogress of the Infection.\n\nPress Space to Continue!");
	draw_set_halign(fa_left);
	
	if (keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(4, gp_face1) || gamepad_button_check_pressed(0, gp_face1)) {
		drawTutorialInfection = false;
		player_obj.movement = true;
	}
}

//################################################################## GUI LAYER ######################################################################

//#####LAYER 0#####

//Lens Dirt + Vignette
/*
draw_sprite_ext(lensDirt1_spr, 0, randParticleX + partMovement + (0 / 2), randParticleY + partMovement / 2 + (0 / 2), 1, 1, 0, -1, 0.135);
draw_sprite_ext(lensDirt2_spr, 0, randParticleX2 + partMovement + (0 / 2), randParticleY2 + partMovement / 2 + (0 / 2), 1, 1, 0, -1, 0.135);
draw_sprite_ext(lensDirt2_spr, 0, randParticleX3 + partMovement + (0 / 2), randParticleY3 + partMovement / 2 + (0 / 2), 1, 1, 0, -1, 0.135);
draw_sprite_ext(lensDirt2_spr, 0, randParticleX4 + partMovement + (0 / 2), randParticleY4 + partMovement / 2 + (0 / 2), 1, 1, 0, -1, 0.135);

draw_sprite_ext(lensDirt1_spr, 0, randParticle2X + partMovement + (0 / 2), randParticle2Y + partMovement / 2 + (0 / 2), 1, 1, 0, -1, 0.135);
draw_sprite_ext(lensDirt2_spr, 0, randParticle2X2 + partMovement + (0 / 2), randParticle2Y2 + partMovement / 2 + (0 / 2), 1, 1, 0, -1, 0.135);
draw_sprite_ext(lensDirt2_spr, 0, randParticle2X3 + partMovement + (0 / 2), randParticle2Y3 + partMovement / 2 + (0 / 2), 1, 1, 0, -1, 0.135);
draw_sprite_ext(lensDirt2_spr, 0, randParticle2X4 + partMovement + (0 / 2), randParticle2Y4 + partMovement / 2 + (0 / 2), 1, 1, 0, -1, 0.135);
*/
	
//Vignette Effect
if (!hitVignette && !visualalarmlight)
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
		if (vignetteAlpha > 0)
		{
			vignetteAlpha -= 0.02;
		}
		if (vignetteAlpha < 0)
		{
			vignetteAlpha += 0.02;
		}
	}
}

if (instance_exists(player_obj)) {
	if ((hitVignette || player_obj.hp < 20) && !visualalarmlight)
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
	
	if (visualalarmlight) {
		if (visualalarmlightDir == 0) {
			vignetteAlpha += 0.001;
		}
		if (visualalarmlightDir == 1) {
			vignetteAlpha -= 0.001;
		}
		
		if (vignetteAlpha > 0.5) {
			visualalarmlightDir = 1;
		}
		if (vignetteAlpha < 0) {
			visualalarmlightDir = 0;
		}
	}
}

if (hitVignetteTimer < 0)
{
	hitVignette = false;
	hitVignetteTimer = hitVignetteTimerSave;
}

shader_reset();
draw_set_alpha(vignetteAlpha);
draw_ellipse_colour(0, 0, global.xScreenSize, global.yScreenSize, c_black , c_red, false);
draw_set_alpha(1);

if (instance_exists(player_obj)) {
	if (player_obj.plagueTransformation)
	{
	    shader_reset();
	    draw_set_alpha(0.4);
	    draw_ellipse_colour(0, 0, global.xScreenSize, global.yScreenSize, c_black , c_purple, false);
	    draw_set_alpha(1);
	}

	if (player_obj.slowmo)
	{
		shader_reset();
	    draw_set_alpha(((player_obj.sniperDamageValue / 100) / 5) / 2);
	    draw_ellipse_colour(0, 0, global.xScreenSize, global.yScreenSize, c_black , make_color_rgb(255,215,0), false);
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

//black borders
draw_sprite(blackborder_spr, 0, x, blackbordersPos + (0 / 2));
draw_sprite(blackborder_spr, 0, x, (global.yScreenSize) + 42 - blackbordersPos);

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
	draw_text_colour((0 / 2) + 16, (global.yScreenSize) - 16, "Framerate: " + string(currFps), c_white, c_white, c_white, c_white, 1);
	//draw_text_colour((0 / 2) + 16, (global.yScreenSize) - 32, "Delta: " + string(currDeltatime), c_white, c_white, c_white, c_white, 1);
	draw_set_halign(fa_center);
	//draw_text_color(x, (0 / 2) + 6, "F3 - Level Select", c_white, c_white, c_white, c_white, 1);
	draw_set_halign(fa_left);

	//Healthbar
	if (player_obj.plagueTransformation)
	{
		draw_sprite_ext(healthbarLensflare_spr, -1, (0 / 2) + 22, (0 / 2) + 130, 1, 1, 0, c_purple, 1);
		draw_sprite_ext(healthbarBorderInfection_spr, -1, (0 / 2) + 16, (0 / 2) + 9, 1, 1, 0, -1, 1);
	}
	else if (player_obj.hp == 100)
	{
		draw_sprite_ext(healthbarBorderFull_spr, -1, (0 / 2) + 16, (0 / 2) + 9, 1, 1, 0, -1, 1);
	}
	else if (player_obj.hp > 20)
	{
		draw_sprite_ext(healthbarBorder_spr, -1, (0 / 2) + 16, (0 / 2) + 9, 1, 1, 0, -1, 1);
	}
	else
	{
		draw_sprite_ext(healthbarLensflare_spr, -1, (0 / 2) + 22, (0 / 2) + 130, 1, 1, 0, -1, 1);
		draw_sprite_ext(healthbarBorderLow_spr, -1, (0 / 2) + 16, (0 / 2) + 9, 1, 1, 0, -1, 1);
	}
	if (!player_obj.damageRecieved && healthbarDone)
	{
		draw_sprite_ext(healthbarTop2_spr, -1, 18 + (0 / 2), 18 - (player_obj.hp - 100) + (0 / 2), 1, 1, 0, -1, 1);
	}
	draw_sprite_ext(healthbar_spr, 0, 18 + (0 / 2), 130 + (0 / 2), 1, clamp(1 * (player_obj.hp / 100), 0, 100), 0, -1, 1);
	if (player_obj.plagueTransformation)
	{
		draw_sprite_ext(healthbarTop2Infection_spr, -1, 18 + (0 / 2), (118 - player_obj.infection) + (0 / 2), 1, 1, 0, -1, 1);
		draw_sprite_ext(healthbarInfection_spr, 0, 18 + (0 / 2), 130 + (0 / 2), 1, player_obj.infection / 100, 0, -1, 1);
	}
	//Damage Healthbar
	if (player_obj.damageRecieved || healthbarShrinkStart)
	{
		healthbarDone = false;
		draw_sprite_ext(healthbarTop2Damage_spr, -1, 18 + (0 / 2), ((18 - (player_obj.hpOld - 100)) + healthbarShrinking) + (0 / 2), 1, 1, 0, -1, 1);
		draw_sprite_ext(healthbarDamage_spr, 0, 18 + (0 / 2), (30 - (player_obj.hpOld - 100)) + healthbarShrinking + (0 / 2), 1, ((player_obj.hp / 100) - (player_obj.hpOld / 100)) + (healthbarShrinking / 100), 0, -1, 1);
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
		draw_sprite_ext(syringe_spr, -1, 32 + 0 / 2, ((0 / 2) + 70) + 16 * i, 1, 1, 0, -1, 1);
	}
	
	//Keycards
	if (global.keyRed) {
		draw_sprite_ext(redKeycard_spr, -1, (global.xScreenSize) - 28, (0 / 2) + 32, 1, 1, 0, -1, 1);
	}
	if (global.keyBlue) {
		draw_sprite_ext(blueKeycard_spr, -1, (global.xScreenSize) - 42, (0 / 2) + 32, 1, 1, 0, -1, 1);
	}
	if (global.keyYellow) {
		draw_sprite_ext(yellowKeycard_spr, -1, (global.xScreenSize) - 56, (0 / 2) + 32, 1, 1, 0, -1, 1);
	}
	
	//Diamond Key
	if (global.hasWarpzoneKey) {
		if (global.syringes == 0) {
			draw_sprite_ext(diamond_spr, -1, 32 + 0 / 2, (0 / 2) + 64, 1, 1, 0, -1, 1);
		} else {
			draw_sprite_ext(diamond_spr, -1, 54 + 0 / 2, (0 / 2) + 64, 1, 1, 0, -1, 1);
		}
	}
	
	//Chipbar
	draw_sprite_ext(scoreBorder_spr, -1, global.xScreenSize - 16, 9, 1, 1, 0, -1, 1);
	
	//###### UI TECH ######
	//Radiation Meter
	if (instance_exists(player_obj))
	{
		if (player_obj.radiation > 0 && player_obj.radiation < 80)
		{
			draw_sprite(radiationMeter_spr, 0, (global.xScreenSize) - 16, (global.yScreenSize) - 9);
			draw_sprite_ext(radiationMeterLine_spr, 0, (global.xScreenSize) - 60, (global.yScreenSize) - 48, 1, 1, (-player_obj.radiation * 1.5) +75, -1, 1);
		}
		if (player_obj.radiation > 80)
		{
			draw_sprite(radiationMeterAlarm_spr, -1, (global.xScreenSize) - 16, (global.yScreenSize) - 9);
			draw_sprite_ext(radiationMeterLine_spr, 0, (global.xScreenSize) - 60, (global.yScreenSize) - 48, 1, 1, (-player_obj.radiation * 1.5) +75, -1, 1);
		}
	}
	
	//Proximity Sensor
	if (room == level0_DarkSewers) {
		var nearestProximityEnemy = instance_nearest(x, y, enemy_obj);
		if (distance_to_object(nearestProximityEnemy) < 512) {
			if (nearestProximityEnemy.object_index == crawler_obj || nearestProximityEnemy.object_index == zombieGirl_obj) {
				draw_sprite(proximitySensor_spr, 0, (global.xScreenSize) - 16, (global.yScreenSize) - 9);
			
				proximitysensorTimer -= global.dt;
				if (proximitysensorTimer < 0) {
					for (var i = 0; i < instance_number(enemy_obj); i++)
					{
						if (distance_to_object(instance_find(enemy_obj, i)) < 512) {
								if (instance_find(enemy_obj, i).object_index == crawler_obj || instance_find(enemy_obj, i).object_index == zombieGirl_obj) {
									enemy[i] = instance_find(enemy_obj, i);
								}
						}
					}
					proximitysensorTimer = proximitysensorTimerSave;
				}

				for (var i = 0; i < array_length(enemy); i++) {
					var offsetX = (global.xScreenSize) - 60;
					var offsetY = (global.yScreenSize) - 29;
					var distToCenterX = 0;
					var distToCenterY = 0;
					if (instance_exists(enemy[i])) {
						distToCenterX = (enemy[i].x - player_obj.x) / 16;
						distToCenterY = clamp((enemy[i].y - player_obj.y) / 16, -999, 0);
					}

					draw_sprite(proximitySensorPoint_spr, 0, distToCenterX + offsetX, distToCenterY + offsetY);
				}
			}
		}
	}
	
	//Chipbar Digit Calculation
	convMoney = string(global.money);
	slots = [0,0,0,0,0,0,0];
	
	convMoneyLen = string_length(convMoney); //3000 = 4
	var normIndex = 1;
	
	//Fill all digits with Zeros first
	for (i = 0; i < 7; i++) {
		slots[i] = 0;
	}
	
	//Fill last digits with money count
	for (i = array_length(slots) - convMoneyLen; i < 7; i++) {
		slots[i] = int64(string_char_at(convMoney, normIndex));
		normIndex ++; //Index starting at 0 for convMoney reading
	}

	if (scoreSpin)
	{
		scoreSpinTimer -= global.dt;
		draw_sprite(scoreNumberSpin_spr, -1, global.xScreenSize - 28, 11 + (0 / 2));
		draw_sprite(scoreNumberSpin_spr, -1, global.xScreenSize - 38, 11 + (0 / 2));
		draw_sprite(scoreNumberSpin_spr, -1, global.xScreenSize - 48, 11 + (0 / 2));
		draw_sprite(scoreNumberSpin_spr, -1, global.xScreenSize - 58, 11 + (0 / 2));
		draw_sprite(scoreNumberSpin_spr, -1, global.xScreenSize - 68, 11 + (0 / 2));
		draw_sprite(scoreNumberSpin_spr, -1, global.xScreenSize - 78, 11 + (0 / 2));
		draw_sprite(scoreNumberSpin_spr, -1, global.xScreenSize - 88, 11 + (0 / 2));
	}
	else
	{
		draw_sprite(scoreNumber_spr, slots[6], global.xScreenSize - 28, 11 + (0 / 2));
		draw_sprite(scoreNumber_spr, slots[5], global.xScreenSize - 38, 11 + (0 / 2));
		draw_sprite(scoreNumber_spr, slots[4], global.xScreenSize - 48, 11 + (0 / 2));
		draw_sprite(scoreNumber_spr, slots[3], global.xScreenSize - 58, 11 + (0 / 2));
		draw_sprite(scoreNumber_spr, slots[2], global.xScreenSize - 68, 11 + (0 / 2));
		draw_sprite(scoreNumber_spr, slots[1], global.xScreenSize - 78, 11 + (0 / 2));
		draw_sprite(scoreNumber_spr, slots[0], global.xScreenSize - 88, 11 + (0 / 2));
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
	var field1 = draw_sprite_ext(ammoCircleDualBarettaField_spr, global.pistolAmmo, 59 + 0 / 2, 36 + 0 / 2, -1, -1, wheelRotation, -1, 1);
	var field2 = draw_sprite_ext(ammoCircleShotgunField_spr, global.shotgunAmmo, 59 + 0 / 2, 36 + 0 / 2, 1, 1, wheelRotation, -1, 1);
	
	var field3 = draw_sprite_ext(ammoCircleRedField_spr, 0, 59 + 0 / 2, 36 + 0 / 2, -1, 1, wheelRotation, -1, 1);
	var field4 = draw_sprite_ext(ammoCircleRedField_spr, 0, 59 + 0 / 2, 36 + 0 / 2, 1, -1, wheelRotation, -1, 1);

	if (global.currentWeapon == gameManager_obj.pickedWeapon.dualBarettas)
	{
		draw_sprite(ammoCircle_spr, 1, 32 + 0 / 2, 9 + 0 / 2);
	}
	else if (global.currentWeapon == gameManager_obj.pickedWeapon.shotgun)
	{
		draw_sprite(ammoCircle_spr, 2, 32 + 0 / 2, 9 + 0 / 2);
	}
	else
	{
		draw_sprite(ammoCircle_spr, 0, 32 + 0 / 2, 9 + 0 / 2);
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
		if (global.currentWeapon == gameManager_obj.pickedWeapon.silencedMP)
		{
			draw_text(x, y + (yScreenSize / 3), "Silenced MP");
		}
		if (global.currentWeapon == gameManager_obj.pickedWeapon.bow)
		{
			draw_text(x, y + (yScreenSize / 3), "Golden Arrow");
		}
	}
	else
	{
		if (wheelSpeed > 2)
		{
			wheelSpeed -= global.dt / 2;
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
	
	//Battlearena Onscreen Message
	if (arenaCompleteMessage) {
		draw_set_color(make_color_rgb(255,215,0));
		draw_set_halign(fa_center);
		arenaCompleteMessageTimer -= global.dt;
		draw_text(x, (yScreenSize / 3), "ARENA CLEARED!");
		draw_set_halign(fa_left);
		
		if (arenaCompleteMessageTimer < 0) {
			arenaCompleteMessage = false;
			arenaCompleteMessageTimer = arenaCompleteMessageTimerSave;
		}
	}
	
	//Door Messages
	if (redDoorMessage) {
		draw_set_color(make_color_rgb(255,215,0));
		draw_set_halign(fa_center);
		draw_text(x, (y + (yScreenSize / 3)) - 32, "You need the red keycard to unlock this door!");
		draw_set_halign(fa_left);
	}
	if (blueDoorMessage) {
		draw_set_color(make_color_rgb(255,215,0));
		draw_set_halign(fa_center);
		draw_text(x, (y + (yScreenSize / 3)) - 32, "You need the blue keycard to unlock this door!");
		draw_set_halign(fa_left);
	}
	if (yellowDoorMessage) {
		draw_set_color(make_color_rgb(255,215,0));
		draw_set_halign(fa_center);
		draw_text(x, (y + (yScreenSize / 3)) - 32, "You need the yellow keycard to unlock this door!");
		draw_set_halign(fa_left);
	}
	if (warpzoneMessage) {
		draw_set_color(make_color_rgb(255,215,0));
		draw_set_halign(fa_center);
		draw_text(x, (y + (yScreenSize / 3)) - 32, "You need the golden key to unlock this door!");
		draw_set_halign(fa_left);
	}
	
	//Timer + Combo for Horde Mode
	if (room == infiniteSpawn) {
		draw_text(0 / 3.5, 0 / 2.5, "TIME: " + string(global.timer));
		draw_text(0 / 3.5, (0 / 2.5) + 16, "SCORE: " + string(global.scorepoints));
		
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

if (showInfOverlay && !showedInf)
{
	if (!showInfectionHealedText) {
		if (!startAlphaTransition) {
			overlayTextAlpha = 0;
			startAlphaTransition = true;
		}
		
		if (overlayTextAlpha < 1) {
			overlayTextAlpha += global.dt / 50;
		}
		
		draw_set_font(gothicPixel_fnt);
		draw_set_halign(fa_center);
		draw_set_color(c_black);
		draw_set_alpha(overlayTextAlpha);
		draw_sprite_ext(dialogBorder_spr, 0, x, 0 / 3,2 + string_length("!Infected!") / 3, 1.5, 0, -1, overlayTextAlpha);
		draw_text(x - 1, 0 / 3 - 4, "!Infected!");
		draw_set_color(make_color_rgb(255, 75, 0));
		draw_text(x, 0 / 3 - 4, "!Infected!");
		draw_set_halign(fa_left);
		draw_set_alpha(1);
	}
}
if (showInfectionHealedText) {
	infectionHealedTextTimer -= global.dt;
		
	draw_set_font(gothicPixel_fnt);
	draw_set_halign(fa_center);
	draw_set_color(c_black);
	draw_set_alpha(overlayTextAlpha);
	draw_sprite_ext(dialogBorder_spr, 0, x, 0 / 3,2 + string_length("!Infection Healed!") / 3, 1.5, 0, -1, overlayTextAlpha);
	draw_text(x - 1, 0 / 3 - 4, "!Infection Healed!");
	draw_set_color(make_color_rgb(75, 255, 0));
	draw_text(x, 0 / 3 - 4, "!Infection Healed!");
	draw_set_halign(fa_left);
	draw_set_alpha(1);
		
	if (infectionHealedTextTimer < 0) {
		overlayTextAlpha -= global.dt / 100;
		
		if (overlayTextAlpha < 0.05) {
			infectionHealedTextTimer = infectionHealedTextTimerSave;
			overlayTextAlpha = 1;
			startAlphaTransition = false;
			showInfectionHealedText = false;
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
	deathInProg = true;
	//REVIVE SCREEN
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
		draw_sprite_ext(death_spr, 0, x, (0 / 4), 1.5, 1.5, 0, -1, deathFadeIn);
		draw_set_color(c_white);
		draw_text((global.xScreenSize / 4) - 48, (global.yScreenSize / 4) + 32, "Syringes Left: " + string(global.syringes))
		draw_set_font(gothicPixel_fnt);
		draw_set_color(make_color_rgb(255, 215, 0));
		draw_set_halign(fa_center);
		draw_sprite(button_spr, 0, (0 / 4), (global.yScreenSize / 4));
		draw_sprite(button_spr, 0, (global.xScreenSize / 4), (global.yScreenSize / 4));
		draw_text((0 / 4), (global.yScreenSize / 4) - 4, "DIE [Q]");
		draw_text((global.xScreenSize / 4), (global.yScreenSize / 4) - 4, "INFECT [E]");
		draw_set_halign(fa_left);
	}
	else
	//FULL DEATH
	{
		draw_set_color(c_black);
		draw_rectangle(300 - (0 / 2), 225 - (0 / 2), 1600 + (0 / 2), 1150 + (0 / 2), false);
		draw_set_alpha(1);
		draw_sprite_ext(death_spr, 0, x, (0 / 4), 2, 2, 0, c_red, 0.2);
		draw_sprite_ext(death_spr, 0, x, (0 / 4), 1.5, 1.5, 0, c_red, 1);
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
			room_restart();
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

//#####LAYER 3#####
if (!noHUD)
{
	draw_sprite(guiBorder_spr, 0, 0, 0);
}

//Cursor
//Crosshair Setup
if (instance_exists(player_obj)) {
	if (player_obj.inputMethod == 0)
	{
		draw_sprite(cursor_spr, 0, 
		(window_mouse_get_x() / ((window_get_width()+1) / global.xScreenSize)) + (0), 
		window_mouse_get_y() / ((window_get_height()+1) / global.yScreenSize) + (0));
	}
}

//#####LAYER 4#####
draw_set_alpha(blackscreenStrength);
draw_set_color(c_black);
draw_rectangle(0, 0, global.xScreenSize, global.yScreenSize, false);
draw_set_alpha(1);

if (instance_exists(player_obj)) {
	if (player_obj.sniperDamageValue > 0)
	{
		draw_sprite_ext(blackborder_spr, 0, x, 42 + (0 / 2), 1, 1, 0, -1, (player_obj.sniperDamageValue / 100) / 5);
		draw_sprite_ext(blackborder_spr, 0, x, global.yScreenSize, 1, 1, 0, -1, (player_obj.sniperDamageValue / 100) / 5);
	}
}

//Start Screen
if (showStartscreen) {
	player_obj.movement = false;
	startScreenXAxis1 += global.dt / 2;
	startScreenXAxis2 += global.dt / 2;
	startScreen1Pos = (0) - startScreenXAxis1;
	startScreen2Pos = ((0) - startScreenXAxis2) + 540;
	
	draw_sprite(startOverlay_spr, 0, startScreen1Pos, y - global.yScreenSize - startScreenYAxis);
	draw_sprite(startOverlay_spr, 0, startScreen2Pos, y - global.yScreenSize - startScreenYAxis);
	
	if (startScreenXAxis1 > 540) {
		startScreenXAxis1 = 0;
	}
	if (startScreenXAxis2 > 540) {
		startScreenXAxis2 = 0;
	}
	
	if (player_obj.key_jump || keyboard_check_pressed(vk_enter)) {
		startScreenDone = true;
	}
	
	if (startScreenDone) {
		startScreenYAxis += global.dt * 5;
		if (startScreenYAxis > 350) {
			startScreenXAxis1 = 0;
			startScreenXAxis2 = 0;
			startScreenYAxis = 0;
			
			startScreenDone = false;
			showStartscreen = false;
			showStartTitle1 = false;
			showStartTitle2 = false;
			showStartTitle3 = false;
			showStartTitle4 = false;
			
			player_obj.movement = true;
		}
	}
}

if (showStartTitle1) {
	draw_set_font(gothicPixelBig_fnt);
	draw_set_color(make_color_rgb(255, 215, 0));
	draw_set_halign(fa_center);
	draw_text(x, y - global.yScreenSize / 3 - startScreenYAxis, "-Paredia West-");
	draw_set_font(gothicPixel_fnt);
	draw_text(x, y - global.yScreenSize / 3 + 48 - startScreenYAxis, "Escape to Safety");
	draw_set_font(gothicPixelSmall_fnt);
	draw_text(x, y - global.yScreenSize / 3 + 72 - startScreenYAxis, "PRESS -START-");
	draw_set_halign(fa_left);
}
if (showStartTitle2) {
	draw_set_font(gothicPixelBig_fnt);
	draw_set_color(make_color_rgb(255, 215, 0));
	draw_set_halign(fa_center);
	draw_text(x, y - global.yScreenSize / 3 - startScreenYAxis, "-Casa De Diamantes-");
	draw_set_font(gothicPixelSmall_fnt);
	draw_text(x, y - global.yScreenSize / 3 + 72 - startScreenYAxis, "PRESS -START-");
	draw_set_halign(fa_left);
}
if (showStartTitle3) {
	draw_set_font(gothicPixelBig_fnt);
	draw_set_color(make_color_rgb(255, 215, 0));
	draw_set_halign(fa_center);
	draw_text(x, y - global.yScreenSize / 3 - startScreenYAxis, "-Senzela Forest-");
	draw_set_font(gothicPixel_fnt);
	draw_text(x, y - global.yScreenSize / 3 + 48 - startScreenYAxis, "Eliminate the target");
	draw_set_font(gothicPixelSmall_fnt);
	draw_text(x, y - global.yScreenSize / 3 + 72 - startScreenYAxis, "PRESS -START-");
	draw_set_halign(fa_left);
}
if (showStartTitle4) {
	draw_set_font(gothicPixelBig_fnt);
	draw_set_color(make_color_rgb(255, 215, 0));
	draw_set_halign(fa_center);
	draw_text(x, y - global.yScreenSize / 3 - startScreenYAxis, "-EDEN Powerplant-");
	draw_set_font(gothicPixel_fnt);
	draw_text(x, y - global.yScreenSize / 3 + 48 - startScreenYAxis, "Reroute power to the Casino");
	draw_set_font(gothicPixelSmall_fnt);
	draw_text(x, y - global.yScreenSize / 3 + 72 - startScreenYAxis, "PRESS -START-");
	draw_set_halign(fa_left);
}