/// @description Player UI

if (instance_exists(player_obj))
{
	//Ammo Counter
	if (!player_obj.reloading)
	{
		anim = 0;
		if (global.currentWeapon == pickedWeapon.pistol || global.currentWeapon == pickedWeapon.dualBarettas)
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
if (string_char_at(dialogue[dialogueLine], 1) == "W")
{
	if (string_char_at(dialogue[dialogueLine], 2) == "1")
	{
		showWindowMenu = true;
		windowType = 1;
	}
}

//Draw Dialogue
if (drawText && !showWindowMenu)
{
	draw_set_font(gothicPixel_fnt);
	draw_set_halign(fa_center);
	draw_set_color(c_black);
	draw_text(character.x - 1, character.y - 32 + 1, string_copy(dialogueStripped, 1, string_length(dialogue[dialogueLine])));
	draw_set_color(make_color_rgb(255, 215, 0));
	draw_text(character.x, character.y - 32, string_copy(dialogueStripped, 1, string_length(dialogue[dialogueLine])));
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