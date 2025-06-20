/// @description Player UI

//HIDE UI
if (global.pause) {
	noHUD = true;
} else {
	if (room != level28) {
		noHUD = false;
	}
}

draw_text(128, 32, "delta_time (ms): " + string(delta_time / 1000000));
draw_text(128, 64, "global.dt: " + string(global.dt));
draw_text(128, 96, "global timescale: " + string(global.timeScale));

if (instance_exists(player_obj) && !noHUD)
{
	//Ammo Counter
	if (room != level_Casino && room != level_CasinoRoof && room != level_Basement && room != level_DiningHall && room != level_TristramRoom) {
		if (!player_obj.reloading)
		{
			anim = 0;
			if (global.currentWeapon == pickedWeapon.dualBarettas)
			{
				if (global.pistolAmmo < 5)
				{
					draw_sprite_ext(ammoCounter_spr, global.pistolAmmo, ((player_obj.x) - x) + 220, ((player_obj.y - 20) - y) + 120, 1, 1, 0, -1, 1 / (global.pistolAmmo + 1) * 3);
				}
			}
			if (global.currentWeapon == pickedWeapon.shotgun)
			{
				if (global.shotgunAmmo < 5)
				{
					draw_sprite_ext(ammoCounter_spr, global.shotgunAmmo, ((player_obj.x) - x) + 220, ((player_obj.y - 20) - y) + 120, 1, 1, 0, -1, 1 / (global.shotgunAmmo + 1) * 3);
				}
			}
			if (global.currentWeapon == pickedWeapon.silencedMP)
			{
				if (global.silencedMPAmmo < 9)
				{
					draw_sprite_ext(ammoCounter_spr, global.silencedMPAmmo / 2, ((player_obj.x) - x) + 220, ((player_obj.y - 20) - y) + 120, 1, 1, 0, -1, 1 / (global.silencedMPAmmo + 1) * 2);
				}
			}
			if (global.currentWeapon == pickedWeapon.bow)
			{
				if (global.bowAmmo < 5)
				{
					draw_sprite_ext(ammoCounter_spr, global.bowAmmo, ((player_obj.x) - x) + 220, ((player_obj.y - 20) - y) + 120, 1, 1, 0, -1, 1 / (global.bowAmmo + 1) * 3);
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
	}
	
	//Walljump Indicator
	if (showWalljumpsLeft)
	{
		draw_sprite_ext(walljumpIndicator_spr, player_obj.wallJumps, ((player_obj.x) - x) + 248, ((player_obj.y - 20) - y) + 122, 1, 1, 0, -1, 1);
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
		//var dashCircle = draw_sprite_ext(dashCircle_spr, 0, ((player_obj.x) - x) + 238, ((player_obj.y - 20) - y) + 143, 1 / (player_obj.dashDelay / 60), 1 / (player_obj.dashDelay / 60), 0, -1, 0.2 / (player_obj.dashDelay / 40))
	}
	
	//Draw Haze Effect
	if (hazeEffect) {
		gpu_set_blendmode(bm_subtract);
		draw_sprite(hazeEffectAnimated_spr, -1, 0, 0);
		gpu_set_blendmode(bm_normal);
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

if (room == level28) {
	//Draw Haze Effect
	if (hazeEffect) {
		gpu_set_blendmode(bm_subtract);
		draw_sprite(hazeEffectAnimated_spr, -1, 0, 0);
		gpu_set_blendmode(bm_normal);
	}
}

//Set Character for Dialogue
if (string_char_at(dialogue[dialogueLine], 1) == "#")
{
	if (instance_exists(steph2_obj)) {
		character = steph2_obj;
		follow = steph2_obj;
	} else {
		character = player_obj;
		follow = player_obj;
	}
}
if (string_char_at(dialogue[dialogueLine], 1) == "@")
{
	character = shopWorker_obj;
	follow = shopWorker_obj;
}
if (string_char_at(dialogue[dialogueLine], 1) == "$")
{
	if (instance_exists(cindy_obj)) {
		character = cindy_obj;
		follow = cindy_obj;
	}
	if (instance_exists(cindy3_obj)) {
		character = cindy3_obj;
		follow = cindy3_obj;
	}
	if (instance_exists(cindy4_obj)) {
		character = cindy4_obj;
		follow = cindy4_obj;
	}
	if (instance_exists(cindy5_obj)) {
		character = cindy5_obj;
		follow = cindy5_obj;
	}
	if (instance_exists(cindy6_obj)) {
		character = cindy6_obj;
		follow = cindy6_obj;
	}
	if (instance_exists(cindy7_obj)) {
		character = cindy7_obj;
		follow = cindy7_obj;
	}
	if (instance_exists(cindy8_obj)) {
		character = cindy8_obj;
		follow = cindy8_obj;
	}
}
if (string_char_at(dialogue[dialogueLine], 1) == "§")
{
	character = cindy3_obj;
	follow = cindy3_obj; 
}
if (string_char_at(dialogue[dialogueLine], 1) == "*")
{
	if (instance_exists(cindy_obj)) {
		character = cindy_obj;
		follow = cindy_obj;
	}
	if (instance_exists(cindy2_obj)) {
		character = cindy2_obj;
		follow = cindy2_obj;
	}
	if (instance_exists(cindy3_obj)) {
		character = cindy3_obj;
		follow = cindy3_obj;
	}
	if (instance_exists(cindy4_obj)) {
		character = cindy4_obj;
		follow = cindy4_obj;
	}
	if (instance_exists(cindy5_obj)) {
		character = cindy5_obj;
		follow = cindy5_obj;
	}
	if (instance_exists(cindy6_obj)) {
		character = cindy6_obj;
		follow = cindy6_obj;
	}
	if (instance_exists(cindy7_obj)) {
		character = cindy7_obj;
		follow = cindy7_obj;
	}
	if (instance_exists(cindy8_obj)) {
		character = cindy8_obj;
		follow = cindy8_obj;
	}
}
if (string_char_at(dialogue[dialogueLine], 1) == "%")
{
	character = cutieplusSteph_obj;
}
if (string_char_at(dialogue[dialogueLine], 1) == "]")
{
	character = bartender_obj;
	follow = bartender_obj; 
}
if (string_char_at(dialogue[dialogueLine], 1) == "[")
{
	character = casinobunny_obj;
	follow = casinobunny_obj; 
}
if (string_char_at(dialogue[dialogueLine], 1) == "^")
{
	if (instance_exists(vip_obj)) {
		character = vip_obj;
		follow = vip_obj;
	}
	if (instance_exists(vip3_obj)) {
		character = vip3_obj;
		follow = vip3_obj;
	}
	if (instance_exists(vip4_obj)) {
		character = vip4_obj;
		follow = vip4_obj;
	}
}
if (string_char_at(dialogue[dialogueLine], 1) == "<")
{
	character = vip2_obj;
	follow = vip2_obj; 
}
if (string_char_at(dialogue[dialogueLine], 1) == "ß")
{
	character = VIPConsumed_obj;
	follow = VIPConsumed_obj; 
}
if (string_char_at(dialogue[dialogueLine], 1) == "´")
{
	character = customStoryTarget_obj;
}
if (string_char_at(dialogue[dialogueLine], 1) == ";")
{
	if (instance_exists(tristram_obj)) {
		character = tristram_obj;
		follow = tristram_obj;
	}
	if (instance_exists(tristram2_obj)) {
		character = tristram2_obj;
		follow = tristram2_obj;
	}
	if (instance_exists(tristram3_obj)) {
		character = tristram3_obj;
		follow = tristram3_obj;
	}
	if (instance_exists(tristram4_obj)) {
		character = tristram4_obj;
		follow = tristram4_obj;
	}
	if (instance_exists(tristram5_obj)) {
		character = tristram5_obj;
		follow = tristram5_obj;
	}
	if (instance_exists(tristram6_obj)) {
		character = tristram6_obj;
		follow = tristram6_obj;
	}
	if (instance_exists(tristram7_obj)) {
		character = tristram7_obj;
		follow = tristram7_obj;
	}
}
if (string_char_at(dialogue[dialogueLine], 1) == ">")
{
	if (instance_exists(komo_obj)) {
		character = komo_obj;
		follow = komo_obj;
	}
	if (instance_exists(komo2_obj)) {
		character = komo2_obj;
		follow = komo2_obj;
	}
	if (instance_exists(komo3_obj)) {
		character = komo3_obj;
		follow = komo3_obj;
	}
	if (instance_exists(komo4_obj)) {
		character = komo4_obj;
		follow = komo4_obj;
	}
	if (instance_exists(komo5_obj)) {
		character = komo5_obj;
		follow = komo5_obj;
	}
	if (instance_exists(komo6_obj)) {
		character = komo6_obj;
		follow = komo6_obj;
	}
	if (instance_exists(komo7_obj)) {
		character = komo7_obj;
		follow = komo7_obj;
	}
	if (instance_exists(komo8_obj)) {
		character = komo8_obj;
		follow = komo8_obj;
	}
}
if (string_char_at(dialogue[dialogueLine], 1) == "_")
{
	if (instance_exists(komo_obj)) {
		character = casinoLantern_obj;
	}
	if (instance_exists(komo2_obj)) {
		character = dinnerTable_obj;
	}
}
if (string_char_at(dialogue[dialogueLine], 1) == "}")
{
	character = mannequin_obj;
}
if (string_char_at(dialogue[dialogueLine], 1) == "{")
{
	character = casinoCandleLight_obj;
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
if (string_char_at(dialogue[dialogueLine], 1) == "W")
{
	if (string_char_at(dialogue[dialogueLine], 2) == "2")
	{			
		part_emitter_destroy_all(global.partSystem);
		instance_destroy(player_obj);
		room_goto(upgrademenu);
	}
}
if (string_char_at(dialogue[dialogueLine], 1) == "W")
{
	if (string_char_at(dialogue[dialogueLine], 2) == "3")
	{			
		part_emitter_destroy_all(global.partSystem);
		instance_destroy(player_obj);
		room_goto(upgrademenu2);
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
	
	//Choose Dialogborder Color
	if (instance_exists(character) && drawDialogueBorder) {
		if (character == player_obj || character == steph2_obj) {
			draw_sprite_ext(dialogBorder_spr, 0, (character.x - x) + global.xScreenSize / 2, (character.y - y) - 42 + global.yScreenSize / 2, 2 + string_length(dialogueStripped) / 3, 1.5, 0, make_color_rgb(229, 171, 113), 1);
		} else if (character == cindy_obj || character == cindy2_obj || character == cindy3_obj || character == cindy4_obj || character == cindy5_obj || character == cindy6_obj || character == cindy7_obj || character == cindy8_obj) {
			draw_sprite_ext(dialogBorder_spr, 0, (character.x - x) + global.xScreenSize / 2, (character.y - y) - 42 + global.yScreenSize / 2, 2 + string_length(dialogueStripped) / 3, 1.5, 0, make_color_rgb(91, 204, 151), 1);
		} else if (character == cutieplusSteph_obj) {
			draw_sprite_ext(dialogBorder_spr, 0, (character.x - x) + global.xScreenSize / 2, (character.y - y) - 22 + global.yScreenSize / 2, 2 + string_length(dialogueStripped) / 3, 1.5, 0, make_color_rgb(82, 43, 82), 1);
		} else if (character == bartender_obj) {
			draw_sprite_ext(dialogBorder_spr, 0, (character.x - x) + global.xScreenSize / 2, (character.y - y) - 42 + global.yScreenSize / 2, 2 + string_length(dialogueStripped) / 3, 1.5, 0, make_color_rgb(102, 181, 181), 1);
		} else if (character == casinobunny_obj) {
			draw_sprite_ext(dialogBorder_spr, 0, (character.x - x) + global.xScreenSize / 2, (character.y - y) - 42 + global.yScreenSize / 2, 2 + string_length(dialogueStripped) / 3, 1.5, 0, make_color_rgb(255, 215, 215), 1);
		} else if (character == vip_obj || character == vip2_obj || character == vip3_obj || character == vip4_obj || character == customStoryTarget_obj) {
			draw_sprite_ext(dialogBorder_spr, 0, (character.x - x) + global.xScreenSize / 2, (character.y - y) - 42 + global.yScreenSize / 2, 2 + string_length(dialogueStripped) / 3, 1.5, 0, make_color_rgb(134, 105, 175), 1);
		} else if (character == VIPConsumed_obj) {
			draw_sprite_ext(dialogBorder_spr, 0, (character.x - x) + global.xScreenSize / 2, (character.y - y) - 42 + global.yScreenSize / 2, 2 + string_length(dialogueStripped) / 3, 1.5, 0, make_color_rgb(134, 105, 175), 1);
		} else if (character == casinoLantern_obj) {
			if (instance_exists(komo_obj)) {
				draw_sprite_ext(dialogBorder_spr, 0, (komo_obj.x - x) + global.xScreenSize / 2, (komo_obj.y - y) - 42 + global.yScreenSize / 2, 2 + string_length(dialogueStripped) / 3, 1.5, 0, make_color_rgb(127, 172, 255), 1);
			}
			if (instance_exists(tristram_obj)) {
				draw_sprite_ext(dialogBorder_spr, 0, (tristram_obj.x - x) + global.xScreenSize / 2, (tristram_obj.y - y) - 42 + global.yScreenSize / 2, 2 + string_length(dialogueStripped) / 3, 1.5, 0, make_color_rgb(198, 204, 99), 1);
			}
		} else if (character == dinnerTable_obj) {
			draw_sprite_ext(dialogBorder_spr, 0, (komo2_obj.x - x) + global.xScreenSize / 2, (komo2_obj.y - y) - 42 + global.yScreenSize / 2, 2 + string_length(dialogueStripped) / 3, 1.5, 0, make_color_rgb(127, 172, 255), 1);
			draw_sprite_ext(dialogBorder_spr, 0, (tristram2_obj.x - x) + global.xScreenSize / 2, (tristram2_obj.y - y) - 42 + global.yScreenSize / 2, 2 + string_length(dialogueStripped) / 3, 1.5, 0, make_color_rgb(198, 204, 99), 1);
		} else if (character == mannequin_obj) {
			draw_sprite_ext(dialogBorder_spr, 0, (player_obj.x - x) + global.xScreenSize / 2, (player_obj.y - y) - 42 + global.yScreenSize / 2, 2 + string_length(dialogueStripped) / 3, 1.5, 0, make_color_rgb(229, 171, 113), 1);
			draw_sprite_ext(dialogBorder_spr, 0, (cindy3_obj.x - x) + global.xScreenSize / 2, (cindy3_obj.y - y) - 42 + global.yScreenSize / 2, 2 + string_length(dialogueStripped) / 3, 1.5, 0, make_color_rgb(91, 204, 151), 1);
		} else if (character == casinoCandleLight_obj) {
			draw_sprite_ext(dialogBorder_spr, 0, (player_obj.x - x) + global.xScreenSize / 2, (player_obj.y - y) - 42 + global.yScreenSize / 2, 2 + string_length(dialogueStripped) / 3, 1.5, 0, make_color_rgb(229, 171, 113), 1);
			draw_sprite_ext(dialogBorder_spr, 0, (tristram3_obj.x - x) + global.xScreenSize / 2, (tristram3_obj.y - y) - 42 + global.yScreenSize / 2, 2 + string_length(dialogueStripped) / 3, 1.5, 0, make_color_rgb(91, 204, 151), 1);
		} else if (character == tristram_obj || character == tristram2_obj || character == tristram3_obj || character == tristram4_obj || character == tristram5_obj || character == tristram6_obj || character == tristram7_obj) {
			draw_sprite_ext(dialogBorder_spr, 0, (character.x - x) + global.xScreenSize / 2, (character.y - y) - 42 + global.yScreenSize / 2, 2 + string_length(dialogueStripped) / 3, 1.5, 0, make_color_rgb(198, 204, 99), 1);
		} else if (character == komo_obj || character == komo2_obj || character == komo3_obj || character == komo4_obj || character == komo5_obj || character == komo6_obj || character == komo7_obj || character == komo8_obj) {
			draw_sprite_ext(dialogBorder_spr, 0, (character.x - x) + global.xScreenSize / 2, (character.y - y) - 42 + global.yScreenSize / 2, 2 + string_length(dialogueStripped) / 3, 1.5, 0, make_color_rgb(127, 172, 255), 1);
		}
	
		if (character == cutieplusSteph_obj) {
			draw_text((character.x - x) + global.xScreenSize / 2 - 1, (character.y - y) - 26 + 1 + global.yScreenSize / 2, string_copy(dialogueStripped, 1, string_length(dialogue[dialogueLine])));
			draw_set_color(make_color_rgb(255, 215, 0));
			draw_text((character.x - x) + global.xScreenSize / 2, (character.y - y) - 26 + global.yScreenSize / 2, string_copy(dialogueStripped, 1, string_length(dialogue[dialogueLine])));
			draw_set_halign(fa_left);
		} else if (character == casinoLantern_obj) {
			if (instance_exists(komo_obj)) {
				draw_text((komo_obj.x - x) + global.xScreenSize / 2 - 1, (komo_obj.y - y) - 46 + 1 + global.yScreenSize / 2, string_copy(dialogueStripped, 1, string_length(dialogue[dialogueLine])));
				draw_set_color(make_color_rgb(255, 215, 0));
				draw_text((komo_obj.x - x) + global.xScreenSize / 2, (komo_obj.y - y) - 46 + global.yScreenSize / 2, string_copy(dialogueStripped, 1, string_length(dialogue[dialogueLine])));
				draw_set_halign(fa_left);
			}
			
			if (instance_exists(tristram_obj)) {
				draw_set_halign(fa_center);
				draw_set_color(c_black);
				draw_text((tristram_obj.x - x) + global.xScreenSize / 2 - 1, (tristram_obj.y - y) - 46 + 1 + global.yScreenSize / 2, string_copy(dialogueStripped, 1, string_length(dialogue[dialogueLine])));
				draw_set_color(make_color_rgb(255, 215, 0));
				draw_text((tristram_obj.x - x) + global.xScreenSize / 2, (tristram_obj.y - y) - 46 + global.yScreenSize / 2, string_copy(dialogueStripped, 1, string_length(dialogue[dialogueLine])));
				draw_set_halign(fa_left);
			}
		} else if (character == dinnerTable_obj) {
			draw_text((komo2_obj.x - x) + global.xScreenSize / 2 - 1, (komo2_obj.y - y) - 46 + 1 + global.yScreenSize / 2, string_copy(dialogueStripped, 1, string_length(dialogue[dialogueLine])));
			draw_set_color(make_color_rgb(255, 215, 0));
			draw_text((komo2_obj.x - x) + global.xScreenSize / 2, (komo2_obj.y - y) - 46 + global.yScreenSize / 2, string_copy(dialogueStripped, 1, string_length(dialogue[dialogueLine])));
			draw_set_halign(fa_left);
			
			draw_set_halign(fa_center);
			draw_set_color(c_black);
			draw_text((tristram2_obj.x - x) + global.xScreenSize / 2 - 1, (tristram2_obj.y - y) - 46 + 1 + global.yScreenSize / 2, string_copy(dialogueStripped, 1, string_length(dialogue[dialogueLine])));
			draw_set_color(make_color_rgb(255, 215, 0));
			draw_text((tristram2_obj.x - x) + global.xScreenSize / 2, (tristram2_obj.y - y) - 46 + global.yScreenSize / 2, string_copy(dialogueStripped, 1, string_length(dialogue[dialogueLine])));
			draw_set_halign(fa_left);
		} else if (character == mannequin_obj) {
			draw_text((player_obj.x - x) + global.xScreenSize / 2 - 1, (player_obj.y - y) - 46 + 1 + global.yScreenSize / 2, string_copy(dialogueStripped, 1, string_length(dialogue[dialogueLine])));
			draw_set_color(make_color_rgb(255, 215, 0));
			draw_text((player_obj.x - x) + global.xScreenSize / 2, (player_obj.y - y) - 46 + global.yScreenSize / 2, string_copy(dialogueStripped, 1, string_length(dialogue[dialogueLine])));
			draw_set_halign(fa_left);
			
			draw_set_halign(fa_center);
			draw_set_color(c_black);
			draw_text((cindy3_obj.x - x) + global.xScreenSize / 2 - 1, (cindy3_obj.y - y) - 46 + 1 + global.yScreenSize / 2, string_copy(dialogueStripped, 1, string_length(dialogue[dialogueLine])));
			draw_set_color(make_color_rgb(255, 215, 0));
			draw_text((cindy3_obj.x - x) + global.xScreenSize / 2, (cindy3_obj.y - y) - 46 + global.yScreenSize / 2, string_copy(dialogueStripped, 1, string_length(dialogue[dialogueLine])));
			draw_set_halign(fa_left);
		} else if (character == casinoCandleLight_obj) {
			draw_text((player_obj.x - x) + global.xScreenSize / 2 - 1, (player_obj.y - y) - 46 + 1 + global.yScreenSize / 2, string_copy(dialogueStripped, 1, string_length(dialogue[dialogueLine])));
			draw_set_color(make_color_rgb(255, 215, 0));
			draw_text((player_obj.x - x) + global.xScreenSize / 2, (player_obj.y - y) - 46 + global.yScreenSize / 2, string_copy(dialogueStripped, 1, string_length(dialogue[dialogueLine])));
			draw_set_halign(fa_left);
			
			draw_set_halign(fa_center);
			draw_set_color(c_black);
			draw_text((tristram3_obj.x - x) + global.xScreenSize / 2 - 1, (tristram3_obj.y - y) - 46 + 1 + global.yScreenSize / 2, string_copy(dialogueStripped, 1, string_length(dialogue[dialogueLine])));
			draw_set_color(make_color_rgb(255, 215, 0));
			draw_text((tristram3_obj.x - x) + global.xScreenSize / 2, (tristram3_obj.y - y) - 46 + global.yScreenSize / 2, string_copy(dialogueStripped, 1, string_length(dialogue[dialogueLine])));
			draw_set_halign(fa_left);
		} else {
			draw_text((character.x - x) + global.xScreenSize / 2 - 1, (character.y - y) - 46 + 1 + global.yScreenSize / 2, string_copy(dialogueStripped, 1, string_length(dialogue[dialogueLine])));
			draw_set_color(make_color_rgb(255, 215, 0));
			draw_text((character.x - x) + global.xScreenSize / 2, (character.y - y) - 46 + global.yScreenSize / 2, string_copy(dialogueStripped, 1, string_length(dialogue[dialogueLine])));
			draw_set_halign(fa_left);
		}
	}

	//Sentence incomplete
	if (letterCount < string_length(dialogue[dialogueLine]))
	{
		letterDelay -= global.dt * textSpeed;
		if (letterDelay < 0)
		{
			dialogueStripped = string_copy(dialogue[dialogueLine], 2, letterCount);
			letterCount++;
			letterDelay = letterDelaySave;
		}
	}
	else //Sentence complete
	{
		textDelay -= global.dt * textSpeed;
		if (textDelay < 0)
		{
			dialogueLine++;
			letterCount = 2;
			dialogueStripped = "";
			if (dialogue[dialogueLine] == "")
			{
				drawText = false;
				dialogueLine = 0;
				character = player_obj;
				follow = player_obj;
			}
			textDelay = textDelaySave;
		}
	}
	
	//Skip Dialogue
	if (room != level28) {
		if (keyboard_check_pressed(vk_enter) || gamepad_button_check_pressed(4, gp_start) || gamepad_button_check_pressed(0, gp_start)) {
			if (instance_exists(dialogueSystem_obj)) {
				if (dialogueSystem_obj.startScene2Timer) {
					showWindowMenu = true;
					windowType = 1;
					follow = player_obj;
					dialogueSystem_obj.scene2Timer = dialogueSystem_obj.scene2TimerSave;
					for (i = dialogueSystem_obj.scene2Low; i < dialogueSystem_obj.scene2High + 1; i++)
					{
						dialogue[i] = "";
					}
					dialogueStripped = "";
					drawDialogueBorder = false;
				}
				if (dialogueSystem_obj.startScene4Timer) {
					dialogueSystem_obj.scene4Timer = dialogueSystem_obj.scene4TimerSave;
					dialogueSystem_obj.startScene4Timer = false;
					global.introDialogueCindyDone = true;
					cindy2_obj.dialogueTriggered = false;
					player_obj.movement = true;
					dialogueSystem_obj.inCutscene = false;
					follow = player_obj;
					drawBlackborders = false;
					for (i = dialogueSystem_obj.scene4Low; i < dialogueSystem_obj.scene4High + 1; i++)
					{
						dialogue[i] = "";
					}
					dialogueStripped = "";
					drawDialogueBorder = false;
				}
				if (dialogueSystem_obj.startScene5Timer) {
					dialogueSystem_obj.scene5Timer = dialogueSystem_obj.scene5TimerSave;
					dialogueSystem_obj.startScene5Timer = false;
					vip_obj.dialogueTriggered = false;
					player_obj.movement = true;
					dialogueSystem_obj.inCutscene = false;
					follow = player_obj;
					drawBlackborders = false;
					global.act2Unlocked = true;
					global.introDialogueVIPDone = true;
					global.drawMission = true;
					drawDialogueBorder = false;
					for (i = dialogueSystem_obj.scene5Low; i < dialogueSystem_obj.scene5High + 1; i++)
					{
						dialogue[i] = "";
					}
					dialogueStripped = "";
					drawDialogueBorder = false;
				}
				if (dialogueSystem_obj.startScene6Timer) {
					part_emitter_destroy_all(global.partSystem);
					instance_destroy(player_obj);
					room_goto(upgrademenu);
				}
				if (dialogueSystem_obj.startScene7Timer) {
					dialogueSystem_obj.scene7Timer = 0;
				}
				if (dialogueSystem_obj.startScene8Timer) {
					dialogueLine = dialogueSystem_obj.scene8High - 1;
				}
				if (dialogueSystem_obj.startScene9Timer) {
					dialogueLine = dialogueSystem_obj.scene9High - 1;
				}
				if (dialogueSystem_obj.startScene10Timer) {
					dialogueLine = dialogueSystem_obj.scene10High - 1;
				}
				if (dialogueSystem_obj.startScene11Timer) {
					dialogueSystem_obj.scene11Timer = 0;
				}
				if (dialogueSystem_obj.startScene12Timer) {
					dialogueSystem_obj.scene12Timer = 0;
				}
				if (dialogueSystem_obj.startScene13Timer) {
					dialogueSystem_obj.scene13Timer = 0;
				}
				if (dialogueSystem_obj.startScene14Timer) {
					dialogueSystem_obj.scene14Timer = 0;
				}
				if (dialogueSystem_obj.startScene15Timer) {
					dialogueSystem_obj.scene15Timer = 0;
				}
				if (dialogueSystem_obj.startScene16Timer) {
					dialogueSystem_obj.scene16Timer = 0;
				}
				if (dialogueSystem_obj.startScene17Timer) {
					dialogueSystem_obj.scene17Timer = 0;
				}
				if (dialogueSystem_obj.startScene18Timer) {
					dialogueLine = dialogueSystem_obj.scene18High - 1;
				}
				if (dialogueSystem_obj.startScene19Timer) {
					dialogueLine = dialogueSystem_obj.scene19High - 1;
				}
				if (dialogueSystem_obj.startScene20Timer) {
					dialogueLine = dialogueSystem_obj.scene20High - 1;
				}
				if (dialogueSystem_obj.startScene21Timer) {
					dialogueLine = dialogueSystem_obj.scene21High - 1;
					dialogueSystem_obj.phase2 = true;
					if (instance_exists(tristram3_obj)) {
						tristram3_obj.sprite_index = tristram_spr;
						tristram3_obj.image_xscale = -1;
					}
				}
				if (dialogueSystem_obj.startScene22Timer) {
					dialogueLine = dialogueSystem_obj.scene22High - 1;
				}
				if (dialogueSystem_obj.startScene23Timer) {
					dialogueLine = dialogueSystem_obj.scene23High - 1;
				}
				if (dialogueSystem_obj.startScene28Timer) {
					dialogueLine = dialogueSystem_obj.scene28High - 1;
				}
				if (dialogueSystem_obj.startScene29Timer) {
					dialogueLine = dialogueSystem_obj.scene29High - 1;
				}
			}
		}
	}
} else {
	textDelay = 400;
	dialogueLine = 0;
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

/*
with (player_obj)
{
	if (place_meeting(x, y, tutorialWKeyPromt_obj))
	{
		with (camera_obj)
		{
			draw_sprite(wKeyPromt_spr, tutorialAnimImage, player_obj.x - x, (player_obj.y - 32) - y);
		}
	}
	if (place_meeting(x, y, tutorialADKeyPromt_obj))
	{
		with (camera_obj)
		{
			draw_sprite(adKeyPrompt_spr, tutorialAnimImage, player_obj.x - x, (player_obj.y - 32) - y);
		}
	}
	if (place_meeting(x, y, tutorialSpaceKeyPromt_obj))
	{
		with (camera_obj)
		{
			draw_sprite(spaceKeyPrompt_spr, tutorialAnimImage, player_obj.x - x, (player_obj.y - 32) - y);
		}
	}
	if (place_meeting(x, y, tutorialShiftKeyPromt_obj))
	{
		with (camera_obj)
		{
			draw_sprite(shiftKeyPrompt_spr, tutorialAnimImage, player_obj.x - x, (player_obj.y - 32) - y);
		}
	}
	if (place_meeting(x, y, tutorialMousePromt_obj))
	{
		with (camera_obj)
		{
			draw_sprite(mousePromt_spr, tutorialAnimImage, player_obj.x - x, (player_obj.y - 32) - y);
		}
	}
}
*/

if (drawTutorialInfection) {
	if (drawTutorialAlpha <= 1) {
		drawTutorialAlpha += global.dt / 24;
	}
	drawTutorialInputDelay += global.dt;
	
	draw_set_alpha(drawTutorialAlpha);
	player_obj.movement = false;
	draw_sprite_ext(menuWindow_spr, 0, global.xScreenSize / 2, global.yScreenSize / 2, 1, 1, 0, -1, drawTutorialAlpha);
	
	draw_set_font(gothicPixel_fnt);
	draw_set_halign(fa_center);
	draw_set_color(c_black);
	if (player_obj.inputMethod == 0) {
		draw_text(global.xScreenSize / 2 - 1, 76, "Tutorial - Infection\nToxic Fumes and more can cause an Infection.\nFind a sterilization chamber to heal yourself!\nWatch your healthbar to see the\nprogress of the Infection.\n\nPress Space to Continue!");
		draw_set_color(make_color_rgb(255, 215, 0));
		draw_text(global.xScreenSize / 2, 76, "Tutorial - Infection\nToxic Fumes and more can cause an Infection.\nFind a sterilization chamber to heal yourself!\nWatch your healthbar to see the\nprogress of the Infection.\n\nPress Space to Continue!");
	} else {
		draw_text(global.xScreenSize / 2 - 1, 76, "Tutorial - Infection\nToxic Fumes and more can cause an Infection.\nFind a sterilization chamber to heal yourself!\nWatch your healthbar to see the\nprogress of the Infection.\n\nPress A to Continue!");
		draw_set_color(make_color_rgb(255, 215, 0));
		draw_text(global.xScreenSize / 2, 76, "Tutorial - Infection\nToxic Fumes and more can cause an Infection.\nFind a sterilization chamber to heal yourself!\nWatch your healthbar to see the\nprogress of the Infection.\n\nPress A to Continue!");
	}
	draw_set_halign(fa_left);
	
	if (keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(4, gp_face1) || gamepad_button_check_pressed(0, gp_face1)) {
		if (drawTutorialInputDelay >= 120) {
			audio_play_sound(typewriterPush_snd, 1, false);
			drawTutorialInfection = false;
			player_obj.movement = true;
		}
	}
	
	draw_set_alpha(1);
} else {
	drawTutorialAlpha = 0;
	drawTutorialInputDelay = 0;
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
draw_ellipse_colour(-100, -100, global.xScreenSize + 100, global.yScreenSize + 100, c_black , c_red, false);
draw_set_alpha(1);

if (hazeEffect) {
	if (hazeAnimDir == 0) {
		hazeAnim -= global.dt / 7;
		if (hazeAnim < -15) {
			hazeAnimDir = 1;
		}
	}
	if (hazeAnimDir == 1) {
		hazeAnim += global.dt / 7;
		if (hazeAnim > 15) {
			hazeAnimDir = 0;
		}
	}
	draw_set_alpha(0.15);
	draw_ellipse_colour(-100 - hazeAnim, -100 - hazeAnim, global.xScreenSize + 100 + hazeAnim, global.yScreenSize + 100 + hazeAnim, c_black , c_green, false);
	draw_set_alpha(1);
}

if (instance_exists(player_obj)) {
	if (player_obj.plagueTransformation)
	{
	    //shader_reset();
	    //draw_set_alpha(0.4);
	    //draw_ellipse_colour(-100, -100, global.xScreenSize + 100, global.yScreenSize + 100, c_black , c_purple, false);
	    //draw_set_alpha(1);
		camera_obj.hazeEffect = true;
	}

	if (player_obj.slowmo)
	{
		shader_reset();
	    draw_set_alpha(((player_obj.sniperDamageValue / 100) / 5) / 2);
	    draw_ellipse_colour(-100, -100, global.xScreenSize + 100, global.yScreenSize + 100, c_black , make_color_rgb(255,215,0), false);
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
draw_sprite(blackborder_spr, 0, global.xScreenSize / 2, blackbordersPos);
draw_sprite(blackborder_spr, 0, global.xScreenSize / 2, (global.yScreenSize) + 42 - blackbordersPos);

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
	//draw_text_colour(16, (global.yScreenSize) - 16, "Framerate: " + string(currFps), c_white, c_white, c_white, c_white, 1);
	//draw_text_colour((0 / 2) + 16, (global.yScreenSize) - 32, "Delta: " + string(currDeltatime), c_white, c_white, c_white, c_white, 1);
	draw_set_halign(fa_center);
	//draw_text_color(x, (0 / 2) + 6, "F3 - Level Select", c_white, c_white, c_white, c_white, 1);
	draw_set_halign(fa_left);

	//Healthbar
	if (player_obj.plagueTransformation)
	{
		draw_sprite_ext(healthbarLensflare_spr, -1, (0 / 2) + 22, (0 / 2) + 130, 1, 1, 0, c_purple, 1);
		draw_sprite_ext(healthbarBorderInfection_spr, -1, (0 / 2) + 11, (0 / 2) + 11, 1, 1, 0, -1, 1);
	}
	else if (player_obj.hp == 100)
	{
		draw_sprite_ext(healthbarBorderFull_spr, -1, (0 / 2) + 11, (0 / 2) + 11, 1, 1, 0, -1, 1);
	}
	else if (player_obj.hp > 20)
	{
		draw_sprite_ext(healthbarBorderFull_spr, -1, (0 / 2) + 11, (0 / 2) + 11, 1, 1, 0, -1, 1);
	}
	else
	{
		draw_sprite_ext(healthbarLensflare_spr, -1, (0 / 2) + 22, (0 / 2) + 130, 1, 1, 0, -1, 1);
		draw_sprite_ext(healthbarBorderLow_spr, -1, (0 / 2) + 11, (0 / 2) + 11, 1, 1, 0, -1, 1);
	}
	if (!player_obj.damageRecieved && healthbarDone)
	{
		if (player_obj.hp > 1) {
			draw_sprite_ext(healthbarTop2_spr, -1, 12 + (0 / 2), 18 - (player_obj.hp - 100) + (0 / 2), 1, 1, 0, -1, 1);
		}
	}
	if (player_obj.hp > 1) {
		draw_sprite_ext(healthbar_spr, 0, 12 + (0 / 2), 130 + (0 / 2), 1, clamp(1 * (player_obj.hp / 100), 0, 100), 0, -1, 1);
	}
	if (player_obj.plagueTransformation)
	{
		draw_sprite_ext(healthbarTop2Infection_spr, -1, 12 + (0 / 2), (118 - player_obj.infection) + (0 / 2), 1, 1, 0, -1, 1);
		draw_sprite_ext(healthbarInfection_spr, 0, 12 + (0 / 2), 130 + (0 / 2), 1, player_obj.infection / 100, 0, -1, 1);
	}
	
	//Boss Healthbar
	if (instance_exists(plantBoss_obj)) {
		if (showBossHealthbar) {
			draw_sprite_ext(healthbarBorderBoss_spr, -1, global.xScreenSize / 2, global.yScreenSize - 26, 1, 1, 0, -1, 1);
			if (plantBoss_obj.hp > 1) {
				draw_sprite_ext(healthbarBoss_spr, 0, (global.xScreenSize / 2) - 86, global.yScreenSize - 27, clamp(1.6 * (plantBoss_obj.hp / 100), 0, 100), 1, 0, -1, 1);
			}
			if (plantBoss_obj.hp > 1) {
				draw_sprite_ext(healthbarTop2Boss_spr, -1, ((global.xScreenSize / 2) - 86) + (1.6 * plantBoss_obj.hp), global.yScreenSize - 27, 1, 1, 0, -1, 1);
			}
		}
		if (showBossHealthbar2) {
			draw_sprite_ext(healthbarBorderBoss_spr, -1, global.xScreenSize / 2, global.yScreenSize - 26, 1, 1, 0, -1, 1);
			if (plantBoss2_obj.hp > 1) {
				draw_sprite_ext(healthbarBoss_spr, 0, (global.xScreenSize / 2) - 86, global.yScreenSize - 27, clamp(1.6 * (plantBoss2_obj.hp / 100), 0, 100), 1, 0, -1, 1);
			}
			if (plantBoss2_obj.hp > 1) {
				draw_sprite_ext(healthbarTop2Boss_spr, -1, ((global.xScreenSize / 2) - 86) + (1.6 * plantBoss2_obj.hp), global.yScreenSize - 27, 1, 1, 0, -1, 1);
			}
		}
	}
	if (instance_exists(plantWallBoss_obj)) {
		if (showBossHealthbar) {
			draw_sprite_ext(healthbarBorderBoss_spr, -1, global.xScreenSize / 2, global.yScreenSize - 26, 1, 1, 0, -1, 1);
			if (plantWallBoss_obj.hp > 1) {
				draw_sprite_ext(healthbarBoss_spr, 0, (global.xScreenSize / 2) - 86, global.yScreenSize - 27, clamp(1.6 * (plantWallBoss_obj.hp / 100), 0, 100), 1, 0, -1, 1);
			}
			if (plantWallBoss_obj.hp > 1) {
				draw_sprite_ext(healthbarTop2Boss_spr, -1, ((global.xScreenSize / 2) - 86) + (1.6 * plantWallBoss_obj.hp), global.yScreenSize - 27, 1, 1, 0, -1, 1);
			}
		}
	}
	
	//Damage Healthbar
	if (player_obj.damageRecieved || healthbarShrinkStart)
	{
		healthbarDone = false;
		if (player_obj.hp > 1) {
			draw_sprite_ext(healthbarTop2Damage_spr, -1, 12 + (0 / 2), ((18 - (player_obj.hpOld - 100)) + healthbarShrinking) + (0 / 2), 1, 1, 0, -1, 1);
			draw_sprite_ext(healthbarDamage_spr, 0, 12 + (0 / 2), (30 - (player_obj.hpOld - 100)) + healthbarShrinking + (0 / 2), 1, ((player_obj.hp / 100) - (player_obj.hpOld / 100)) + (healthbarShrinking / 100), 0, -1, 1);
		}
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
	draw_sprite_ext(syringe_spr, -1, 25, 94, 1, 1, 0, -1, 1);
	draw_set_color(make_color_rgb(255,215,0));
	draw_set_font(gothicPixel_fnt);
	draw_set_halign(fa_left);
	draw_text(25 + 21, 95, "x " + string(global.syringes));
	draw_set_font(gothicPixel_fnt);
	
	//Keycards
	if (global.keyRed) {
		draw_sprite_ext(redKeycard_spr, -1, (global.xScreenSize) - 34, (0 / 2) + 32, 1, 1, 0, -1, 1);
	}
	if (global.keyBlue) {
		draw_sprite_ext(blueKeycard_spr, -1, (global.xScreenSize) - 48, (0 / 2) + 32, 1, 1, 0, -1, 1);
	}
	if (global.keyYellow) {
		draw_sprite_ext(yellowKeycard_spr, -1, (global.xScreenSize) - 62, (0 / 2) + 32, 1, 1, 0, -1, 1);
	}
	
	//Neural Key
	if (global.hasWarpzoneKey) {
		draw_sprite_ext(goldenKeyUI_spr, -1, (global.xScreenSize) - 76, (0 / 2) + 32, 1, 1, 0, -1, 1);
	}
	
	//Chipbar
	draw_sprite_ext(scoreBorder_spr, -1, global.xScreenSize - 11, 11, 1, 1, 0, -1, 1);
	
	//Diamonds
	draw_sprite_ext(diamond_spr, -1, global.xScreenSize - 39, global.yScreenSize - 20, 1, 1, 0, -1, 1);
	draw_set_color(make_color_rgb(255,215,0));
	draw_set_font(gothicPixel_fnt);
	draw_set_halign(fa_left);
	draw_text(global.xScreenSize - 29, global.yScreenSize - 17, "x " + string(global.diamonds));
	draw_set_font(gothicPixel_fnt);
	
	//###### UI TECH ######
	//Radiation Meter
	/*
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
	*/
	//Proximity Sensor
	/*
	if (room == level10) {
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
	*/
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
		draw_sprite(scoreNumberSpin_spr, -1, global.xScreenSize - 21, 12 + (0 / 2));
		draw_sprite(scoreNumberSpin_spr, -1, global.xScreenSize - 31, 12 + (0 / 2));
		draw_sprite(scoreNumberSpin_spr, -1, global.xScreenSize - 41, 12 + (0 / 2));
		draw_sprite(scoreNumberSpin_spr, -1, global.xScreenSize - 51, 12 + (0 / 2));
		draw_sprite(scoreNumberSpin_spr, -1, global.xScreenSize - 61, 12 + (0 / 2));
		draw_sprite(scoreNumberSpin_spr, -1, global.xScreenSize - 71, 12 + (0 / 2));
		draw_sprite(scoreNumberSpin_spr, -1, global.xScreenSize - 81, 12 + (0 / 2));
	}
	else
	{
		draw_sprite(scoreNumber_spr, slots[6], global.xScreenSize - 21, 12 + (0 / 2));
		draw_sprite(scoreNumber_spr, slots[5], global.xScreenSize - 31, 12 + (0 / 2));
		draw_sprite(scoreNumber_spr, slots[4], global.xScreenSize - 41, 12 + (0 / 2));
		draw_sprite(scoreNumber_spr, slots[3], global.xScreenSize - 51, 12 + (0 / 2));
		draw_sprite(scoreNumber_spr, slots[2], global.xScreenSize - 61, 12 + (0 / 2));
		draw_sprite(scoreNumber_spr, slots[1], global.xScreenSize - 71, 12 + (0 / 2));
		draw_sprite(scoreNumber_spr, slots[0], global.xScreenSize - 81, 12 + (0 / 2));
	}
	
	if (scoreSpinTimer < 0) {
		scoreSpin = false;
		scoreSpinTimer = scoreSpinTimerSave;
	}
	if (scoreDifTimer < 0) {	
		scoreDif = false;
	}
	
	//Draw Money Text
	if (scoreDif) {
		scoreDifTimer -= global.dt;
		
		draw_set_color(make_color_rgb(255,215,0));
		draw_set_font(gothicPixelSmall_fnt);
		draw_set_halign(fa_center);
		draw_text(global.xScreenSize - 16, 25, string(chipDif));
		draw_set_font(gothicPixel_fnt);
	} else {
		chipDif = 0;
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
	var field3Degree = 140;
	//var field1 = draw_sprite_ext(ammoCircleDualBarettaField_spr, global.pistolAmmo, 59 + 0 / 2, 36 + 0 / 2, -1, -1, wheelRotation, -1, 1);
	//var field2 = draw_sprite_ext(ammoCircleShotgunField_spr, global.shotgunAmmo, 59 + 0 / 2, 36 + 0 / 2, 1, 1, wheelRotation, -1, 1);	
	//var field3 = draw_sprite_ext(ammoCircleSilencedMPField_spr, global.silencedMPAmmo, 59 + 0 / 2, 36 + 0 / 2, -1, 1, wheelRotation, -1, 1);
	
	//var field4 = draw_sprite_ext(ammoCircleRedField_spr, 0, 59 + 0 / 2, 36 + 0 / 2, 1, -1, wheelRotation, -1, 1);

	draw_set_font(gothicPixel_fnt);
	draw_set_color(make_color_rgb(255, 215, 0));
	draw_set_halign(fa_left);
	
	if (global.currentWeapon == gameManager_obj.pickedWeapon.dualBarettas)
	{
		draw_sprite(ammoCircle_spr, 1, 32, 24);
		draw_sprite(bulletbarDualBarettas_spr, global.pistolAmmo, 26, 32);
		//draw_text(86, 29, string(global.pistolAmmo) + "-" + string(global.pistolAmmoMax));
		
		if (global.dualBarettasUpgrade1) {
			draw_sprite_ext(upgradeWindow_spr, 0, 34, 80, 1, 1, 0, -1, 1);
		}
		if (global.dualBarettasUpgrade2) {
			draw_sprite_ext(upgradeWindow_spr, 0, 34, 80, 1, 1, 0, -1, 1);
			draw_sprite_ext(upgradeWindow_spr, 1, 82, 80, 1, 1, 0, -1, 1);
		}
	}
	else if (global.currentWeapon == gameManager_obj.pickedWeapon.shotgun)
	{
		draw_sprite(ammoCircle_spr, 2, 32, 24);
		draw_sprite(bulletbarShotgun_spr, global.shotgunAmmo, 26, 32);
		//draw_text(86, 29, string(global.shotgunAmmo) + "-" + string(global.shotgunAmmoMax));
		
		if (global.shotgunUpgrade1) {
			draw_sprite_ext(upgradeWindow_spr, 2, 34, 80, 1, 1, 0, -1, 1);
		}
		if (global.shotgunUpgrade2) {
			draw_sprite_ext(upgradeWindow_spr, 2, 34, 80, 1, 1, 0, -1, 1);
			draw_sprite_ext(upgradeWindow_spr, 3, 82, 80, 1, 1, 0, -1, 1);
		}
	}
	else if (global.currentWeapon == gameManager_obj.pickedWeapon.silencedMP)
	{
		draw_sprite(ammoCircle_spr, 3, 32, 24);
		draw_sprite(bulletbarSilencedMP_spr, global.silencedMPAmmo, 26, 32);
		if (global.silencedMPUpgrade1) {
			draw_sprite_ext(upgradeWindow_spr, 4, 34, 80, 1, 1, 0, -1, 1);
		}
		if (global.silencedMPUpgrade2) {
			draw_sprite_ext(upgradeWindow_spr, 4, 34, 80, 1, 1, 0, -1, 1);
			draw_sprite_ext(upgradeWindow_spr, 5, 82, 80, 1, 1, 0, -1, 1);
		}
	}
	else if (global.currentWeapon == gameManager_obj.pickedWeapon.bow)
	{
		draw_sprite(ammoCircle_spr, 4, 32, 24);
		draw_sprite(bulletbarAntiMaterialRife_spr, global.bowAmmo, 26, 32);
		if (global.sniperUpgrade1) {
			draw_sprite_ext(upgradeWindow_spr, 6, 34, 80, 1, 1, 0, -1, 1);
		}
		if (global.sniperUpgrade2) {
			draw_sprite_ext(upgradeWindow_spr, 6, 34, 80, 1, 1, 0, -1, 1);
			draw_sprite_ext(upgradeWindow_spr, 7, 82, 80, 1, 1, 0, -1, 1);
		}
	}
	else
	{
		draw_sprite(ammoCircle_spr, 0, 32, 24);
		draw_sprite(bulletbarSilencedMP_spr, 0, 26, 32);
		//draw_text(86, 29, "No Ammo");
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
			draw_text(global.xScreenSize / 2, global.yScreenSize - global.yScreenSize / 4, "Pistol");
		}
		if (global.currentWeapon == gameManager_obj.pickedWeapon.dualBarettas)
		{
			draw_text(global.xScreenSize / 2, global.yScreenSize - global.yScreenSize / 4, "Dual Barettas");
		}
		if (global.currentWeapon == gameManager_obj.pickedWeapon.shotgun)
		{
			draw_text(global.xScreenSize / 2, global.yScreenSize - global.yScreenSize / 4, "Shotgun");
		}
		if (global.currentWeapon == gameManager_obj.pickedWeapon.silencedMP)
		{
			draw_text(global.xScreenSize / 2, global.yScreenSize - global.yScreenSize / 4, "Silenced MP");
		}
		if (global.currentWeapon == gameManager_obj.pickedWeapon.bow)
		{
			draw_text(global.xScreenSize / 2, global.yScreenSize - global.yScreenSize / 4, "Anti-Materiel Rifle");
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
			if (global.currentWeapon == gameManager_obj.pickedWeapon.silencedMP)
			{
				if (wheelRotation > field3Degree - 15 && wheelRotation < field3Degree + 15)
				{
					wheelSpeed = 0;
					wheelRotation = field3Degree;
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
		arenaCompleteMessageTimer -= global.dt;
		draw_set_halign(fa_center);
		draw_set_font(gothicPixel_fnt);
		draw_set_color(c_black);
		draw_text(global.xScreenSize / 2 - 1, global.yScreenSize / 4 + 1, "ARENA CLEARED");
		draw_set_color(make_color_rgb(255,215,0));
		draw_text(global.xScreenSize / 2, global.yScreenSize / 4, "ARENA CLEARED");
		draw_set_halign(fa_left);
		
		if (arenaCompleteMessageTimer < 0) {
			arenaCompleteMessage = false;
			arenaCompleteMessageTimer = arenaCompleteMessageTimerSave;
		}
	}
	
	//HP FULL MESSAGE
	if (hpFullMessage) {
		draw_set_color(c_red);
		draw_set_halign(fa_center);
		draw_set_font(gothicPixel_fnt);
		draw_text(global.xScreenSize / 2, global.yScreenSize - global.yScreenSize / 4 - 32, "HP already full!");
		draw_set_halign(fa_left);
	}
	
	//Door Messages
	if (redDoorMessage) {
		draw_set_color(make_color_rgb(255,215,0));
		draw_set_halign(fa_center);
		draw_set_font(gothicPixel_fnt);
		draw_text(global.xScreenSize / 2, global.yScreenSize - global.yScreenSize / 4 - 32, "You need the red keycard to unlock this door!");
		draw_set_halign(fa_left);
	}
	if (blueDoorMessage) {
		draw_set_color(make_color_rgb(255,215,0));
		draw_set_halign(fa_center);
		draw_set_font(gothicPixel_fnt);
		draw_text(global.xScreenSize / 2, global.yScreenSize - global.yScreenSize / 4 - 32, "You need the blue keycard to unlock this door!");
		draw_set_halign(fa_left);
	}
	if (yellowDoorMessage) {
		draw_set_color(make_color_rgb(255,215,0));
		draw_set_halign(fa_center);
		draw_set_font(gothicPixel_fnt);
		draw_text(global.xScreenSize / 2, global.yScreenSize - global.yScreenSize / 4 - 32, "You need the yellow keycard to unlock this door!");
		draw_set_halign(fa_left);
	}
	if (warpzoneMessage) {
		draw_set_color(make_color_rgb(255,215,0));
		draw_set_halign(fa_center);
		draw_set_font(gothicPixel_fnt);
		draw_text(global.xScreenSize / 2, global.yScreenSize - global.yScreenSize / 4 - 32, "You need the golden key to unlock this door!");
		draw_set_halign(fa_left);
	}
	
	//Mannequin Messages
	if (mannequinMessage1) {
		draw_set_color(make_color_rgb(255,215,0));
		draw_set_halign(fa_center);
		draw_set_font(gothicPixel_fnt);
		draw_text(global.xScreenSize / 2, global.yScreenSize - global.yScreenSize / 4 - 32, "Starfarer Skin - Purchase for 2 Diamonds");
		draw_set_halign(fa_left);
	}
	if (mannequinMessage2) {
		draw_set_color(make_color_rgb(255,215,0));
		draw_set_halign(fa_center);
		draw_set_font(gothicPixel_fnt);
		draw_text(global.xScreenSize / 2, global.yScreenSize - global.yScreenSize / 4 - 32, "Switch Skin?");
		draw_set_halign(fa_left);
	}
	if (drawDiningEntranceText) {
		draw_set_color(make_color_rgb(255,215,0));
		draw_set_halign(fa_center);
		draw_set_font(gothicPixel_fnt);
		draw_text(global.xScreenSize / 2, global.yScreenSize - global.yScreenSize / 4 - 32, "Locked");
		draw_set_halign(fa_left);
	}
	
	//Low Ammo Message
	if (!redDoorMessage && !blueDoorMessage && !yellowDoorMessage && !warpzoneMessage && room != level_Casino && room != level_CasinoRoof && room != level_Basement && room != level_DiningHall && room != level_TristramRoom) {
		draw_set_font(gothicPixel_fnt);
		if (global.currentWeapon != gameManager_obj.pickedWeapon.pistol) {
			if ((global.pistolAmmo < 6 && global.unlockedWeapon[1])) {
				draw_set_halign(fa_center);
				draw_set_color(c_black);
				draw_text(global.xScreenSize / 2 - 1, global.yScreenSize - global.yScreenSize / 4 + 16 + 1, "Low Dual Barettas Ammo");
				draw_set_color(make_color_rgb(255,0,0));
				draw_text(global.xScreenSize / 2, global.yScreenSize - global.yScreenSize / 4 + 16, "Low Dual Barettas Ammo");
				draw_set_alpha(0.1);
				draw_ellipse_color(-64, -150, global.xScreenSize + 64, global.yScreenSize + 360, c_red, c_black, false);
				draw_set_alpha(1);
				draw_set_halign(fa_left);
			} else if ((global.shotgunAmmo < 2 && global.unlockedWeapon[2])) {
				draw_set_halign(fa_center);
				draw_set_color(c_black);
				draw_text(global.xScreenSize / 2 - 1, global.yScreenSize - global.yScreenSize / 4 + 16 + 1, "Low Shotgun Ammo");
				draw_set_color(make_color_rgb(255,0,0));
				draw_text(global.xScreenSize / 2, global.yScreenSize - global.yScreenSize / 4 + 16, "Low Shotgun Ammo");
				draw_set_alpha(0.1);
				draw_ellipse_color(-64, -150, global.xScreenSize + 64, global.yScreenSize + 360, c_red, c_black, false);
				draw_set_alpha(1);
				draw_set_halign(fa_left);
			} else if ((global.silencedMPAmmo < 9 && global.unlockedWeapon[3])) {
				draw_set_halign(fa_center);
				draw_set_color(c_black);
				draw_text(global.xScreenSize / 2 - 1, global.yScreenSize - global.yScreenSize / 4 + 16 + 1, "Low Silenced MP Ammo");
				draw_set_color(make_color_rgb(255,0,0));
				draw_text(global.xScreenSize / 2, global.yScreenSize - global.yScreenSize / 4 + 16, "Low Silenced MP Ammo");
				draw_set_alpha(0.1);
				draw_ellipse_color(-64, -150, global.xScreenSize + 64, global.yScreenSize + 360, c_red, c_black, false);
				draw_set_alpha(1);
				draw_set_halign(fa_left);
			} else if ((global.bowAmmo < 4 && global.unlockedWeapon[4])) {
				draw_set_halign(fa_center);
				draw_set_color(c_black);
				draw_text(global.xScreenSize / 2 - 1, global.yScreenSize - global.yScreenSize / 4 + 16 + 1, "Low Anti-Material Rifle Ammo");
				draw_set_color(make_color_rgb(255,0,0));
				draw_text(global.xScreenSize / 2, global.yScreenSize - global.yScreenSize / 4 + 16, "Low Anti-Material Rifle Ammo");
				draw_set_alpha(0.1);
				draw_ellipse_color(-64, -150, global.xScreenSize + 64, global.yScreenSize + 360, c_red, c_black, false);
				draw_set_alpha(1);
				draw_set_halign(fa_left);
			}
		}
	}
	
	//Combo for Horde Mode
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

if (showInfOverlay && !showedInf && !noHUD)
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
		draw_sprite_ext(dialogBorder_spr, 0, global.xScreenSize / 2, global.yScreenSize / 6,2 + string_length("!Infected!") / 3, 1.5, 0, -1, overlayTextAlpha);
		draw_text(global.xScreenSize / 2 - 1,global.yScreenSize / 6 - 4, "!Infected!");
		draw_set_color(make_color_rgb(255, 75, 0));
		draw_text(global.xScreenSize / 2, global.yScreenSize / 6 - 4, "!Infected!");
		draw_set_halign(fa_left);
		draw_set_alpha(1);
	}
}
if (showInfectionHealedText && !noHUD) {
	infectionHealedTextTimer -= global.dt;
		
	draw_set_font(gothicPixel_fnt);
	draw_set_halign(fa_center);
	draw_set_color(c_black);
	draw_set_alpha(overlayTextAlpha);
	draw_sprite_ext(dialogBorder_spr, 0, global.xScreenSize / 2, global.yScreenSize / 6,2 + string_length("!Infection Healed!") / 3, 1.5, 0, -1, overlayTextAlpha);
	draw_text(global.xScreenSize / 2 - 1, global.yScreenSize / 6 - 4, "!Infection Healed!");
	draw_set_color(make_color_rgb(75, 255, 0));
	draw_text(global.xScreenSize / 2, global.yScreenSize / 6 - 4, "!Infection Healed!");
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
	draw_sprite_ext(menuWindow_spr, 0, global.xScreenSize / 2, (global.yScreenSize / 2) + windowMenuOffset, 1, 1, 0, -1, 1);
	
	draw_set_font(gothicPixel_fnt);
	draw_set_halign(fa_center);
	draw_set_color(c_black);
	draw_text(global.xScreenSize / 2 - 1, (global.yScreenSize / 2) + 86 + 1, "Press Esc to Cancel");
	draw_set_color(make_color_rgb(255, 215, 0));
	draw_text(global.xScreenSize / 2, (global.yScreenSize / 2) + 86, "Press Esc to Cancel");
	draw_set_halign(fa_left);
	
	//Draw items
	if (windowType == 1) {
		if (!window1SpawnedHitboxes) {
			for (var i = 0; i < 3; i++) {
				var hitbox = instance_create_layer((player_obj.x - 132) + 84 * i, player_obj.y - 46, "GameManagerLayer", cursorHitbox_obj);
				hitbox.image_yscale = 1.4;
				hitbox.image_xscale = 1.45;
				if (i == 0) {
					hitbox.index = 1;
				} else if (i == 1) {
					hitbox.index = 2;
				} else {
					hitbox.index = 0;
				}
			}
			window1SpawnedHitboxes = true;
		}
	
		player_obj.movement = false;
		//Names
		draw_set_font(gothicPixel_fnt);
		draw_set_halign(fa_center);
		draw_set_color(c_black);
		draw_text(global.xScreenSize / 2 - 1, (((global.yScreenSize / 2) + windowMenuOffset) - 48) + 1, "Syringe");
		draw_text((global.xScreenSize / 2) + 86 - 1, (((global.yScreenSize / 2) + windowMenuOffset) - 48) + 1, "Diamond");
		draw_text((global.xScreenSize / 2) - 86 - 1, (((global.yScreenSize / 2) + windowMenuOffset) - 48) + 1, "Cocktail");
		draw_set_color(make_color_rgb(255, 215, 0));
		draw_text(global.xScreenSize / 2, ((global.yScreenSize / 2) + windowMenuOffset) - 48, "Syringe");
		draw_text((global.xScreenSize / 2) + 86, ((global.yScreenSize / 2) + windowMenuOffset) - 48, "Diamond");
		draw_text((global.xScreenSize / 2) - 86, ((global.yScreenSize / 2) + windowMenuOffset) - 48, "Cocktail");
		draw_set_halign(fa_left);
		//Frames
		var frame1 = 2;
		var frame2 = 3;
		var frame3 = 4;
		
		if (barkeeperWindowIndex == 1) {
			frame3 = 5;
		} else {
			frame3 = 2;
		}
		if (barkeeperWindowIndex == 0) {
			frame2 = 7;
		} else {
			frame2 = 4;
		}
		if (barkeeperWindowIndex == 2) {
			frame1 = 6;
		} else {
			frame1 = 3;
		}
		
		draw_sprite(itemFrame_spr, frame1, global.xScreenSize / 2, (global.yScreenSize / 2) + windowMenuOffset);
		draw_sprite(itemFrame_spr, frame2, (global.xScreenSize / 2) + 86, (global.yScreenSize / 2) + windowMenuOffset);
		draw_sprite(itemFrame_spr, frame3, (global.xScreenSize / 2) - 86, (global.yScreenSize / 2) + windowMenuOffset);
		//Descriptions
		draw_set_font(gothicPixel_fnt);
		draw_set_halign(fa_center);
		draw_set_color(c_black);
		draw_text(global.xScreenSize / 2 - 1, (((global.yScreenSize / 2) + windowMenuOffset) + 42) + 1, "2250$");
		draw_text((global.xScreenSize / 2) + 86 - 1, (((global.yScreenSize / 2) + windowMenuOffset) + 42) + 1, "12300$");
		draw_text((global.xScreenSize / 2) - 86 - 1, (((global.yScreenSize / 2) + windowMenuOffset) + 42) + 1, "25$");
		if (global.money > 2249)
		{
			draw_set_color(make_color_rgb(255, 215, 0));
		}
		else
		{
			draw_set_color(c_red);
		}
		draw_text(global.xScreenSize / 2, ((global.yScreenSize / 2) + windowMenuOffset) + 42, "2250$");
		if (global.money > 12299)
		{
			draw_set_color(make_color_rgb(255, 215, 0));
		}
		else
		{
			draw_set_color(c_red);
		}
		draw_text((global.xScreenSize / 2) + 86, ((global.yScreenSize / 2) + windowMenuOffset) + 42, "12300$");
		if (global.money > 24)
		{
			draw_set_color(make_color_rgb(255, 215, 0));
		}
		else
		{
			draw_set_color(c_red);
		}
		draw_text((global.xScreenSize / 2) - 86, ((global.yScreenSize / 2) + windowMenuOffset) + 42, "25$");
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
	if (keyboard_check_pressed(vk_escape) || gamepad_button_check_pressed(4, gp_start) || gamepad_button_check_pressed(0, gp_start)) {
		audio_play_sound(typewriterPush_snd, 1, false);
		dialogueSystem_obj.inCutscene = false;
		dialogueSystem_obj.startScene2Timer = false;
		dialogueSystem_obj.scene2Timer = dialogueSystem_obj.scene2TimerSave;
		player_obj.movement = true;
		bartender_obj.dialogueTriggered = false;
		drawBlackborders = false;
		drawText = false;
		showWindowMenu = false;
		follow = player_obj;
		windowType = 0;
	}
	
	//Mouse Cursor Controls
	if (instance_exists(cursorHitbox_obj)) {
		for (var i = 0; i < instance_number(cursorHitbox_obj); ++i;) {
			var hitbox = instance_find(cursorHitbox_obj, i);
			if (instance_exists(hitbox)) {
				if (hitbox.open) {
					barkeeperWindowIndex = hitbox.index;
				
					if (mouse_check_button_pressed(mb_left)) {
						audio_play_sound(typewriterPush_snd, 1, false);
						switch (barkeeperWindowIndex)
						{
							case 0:
								if (global.money >= 12300) {
									global.diamonds += 1;
									audio_play_sound(buying_snd, 1, false);
									global.money -= 12300;
								}
							break;
							case 1:
								if (global.money >= 25) {
									if (global.drunknessLevel < 0.75) {
										global.drunknessLevel += 0.05;
									}
									audio_play_sound(buying_snd, 1, false);
									global.money -= 25;
								}
							break;
							case 2:
								if (global.money >= 2250) {
									if (global.syringes < 5) {
										global.syringes += 1;
									}
									audio_play_sound(buying_snd, 1, false);
									global.money -= 2250;
								}
							break;
						}
					}
				}
			}
		}
	}
		
	if (keyboard_check_pressed(vk_enter) || gamepad_button_check_pressed(0, gp_face1) || gamepad_button_check_pressed(4, gp_face1)) {
		if (barkeeperWindowIndex == 0) {
			if (global.money >= 12300) {
				audio_play_sound(typewriterPush_snd, 1, false);
				global.diamonds += 1;
				audio_play_sound(buying_snd, 1, false);
				global.money -= 12300;
			}
		}
		if (barkeeperWindowIndex == 2) {
			if (global.money >= 2250) {
				audio_play_sound(typewriterPush_snd, 1, false);
				if (global.syringes < 5) {
					global.syringes += 1;
				}
				audio_play_sound(buying_snd, 1, false);
				global.money -= 2250;
			}
		}
		if (barkeeperWindowIndex == 1) {
			if (global.money >= 25) {
				audio_play_sound(typewriterPush_snd, 1, false);
				if (global.drunknessLevel < 0.75) {
					global.drunknessLevel += 0.05;
				}
				audio_play_sound(buying_snd, 1, false);
				global.money -= 25;
			}
		}
	}
	if (keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D")) || gamepad_button_check_pressed(0, gp_padr) || gamepad_button_check_pressed(4, gp_padr)) {
		audio_play_sound(typewriter_snd, 1, false);
		if (barkeeperWindowIndex < 2) {
			barkeeperWindowIndex += 1;
		} else {
			barkeeperWindowIndex = 0;
		}
	}
	if (keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A")) || gamepad_button_check_pressed(0, gp_padl) || gamepad_button_check_pressed(4, gp_padl)) {
		audio_play_sound(typewriter_snd, 1, false);
		if (barkeeperWindowIndex > 0) {
			barkeeperWindowIndex -= 1;
		} else {
			barkeeperWindowIndex = 2;
		}
	}
}
else
{
	if (!camera_obj.drawElevatorSign) {
		windowMenuOffset = windowMenuOffsetSave;
		windowType = 0;
	}
	
	if (!global.pause) {
		if (instance_exists(cursorHitbox_obj)) {
			instance_destroy(cursorHitbox_obj);
		}
		window1SpawnedHitboxes = false;
	}
}

if (drawElevatorSign) {
	if (!createdElevatorSignButtons) {
		elevatorButton1 = instance_create_layer(x, y, "Instances", elevatorSelectMenuButton1_obj);
		elevatorButton2 = instance_create_layer(x, y, "Instances", elevatorSelectMenuButton2_obj);
		elevatorButton3 = instance_create_layer(x, y, "Instances", elevatorSelectMenuButton3_obj);
		elevatorButton4 = instance_create_layer(x, y, "Instances", elevatorSelectMenuButton4_obj);
		elevatorButton5 = instance_create_layer(x, y, "Instances", elevatorSelectMenuButton5_obj);
		createdElevatorSignButtons = true;
	}
	if (instance_exists(elevatorButton1)) {
		elevatorButton1.x = x;
		elevatorButton1.y = y;
	}
	if (instance_exists(elevatorButton2)) {
		elevatorButton2.x = x;
		elevatorButton2.y = y;
	}
	if (instance_exists(elevatorButton3)) {
		elevatorButton3.x = x;
		elevatorButton3.y = y;
	}
	if (instance_exists(elevatorButton4)) {
		elevatorButton4.x = x;
		elevatorButton4.y = y;
	}
	if (instance_exists(elevatorButton5)) {
		elevatorButton5.x = x;
		elevatorButton5.y = y;
	}
	
	if (elevatorButton1.hover) {
		draw_sprite(elevatorSelectMenu_spr, 1, global.xScreenSize / 2, (global.yScreenSize / 2) + windowMenuOffset);
	}
	if (elevatorButton2.hover) {
		draw_sprite(elevatorSelectMenu_spr, 2, global.xScreenSize / 2, (global.yScreenSize / 2) + windowMenuOffset);
	}
	if (elevatorButton3.hover) {
		draw_sprite(elevatorSelectMenu_spr, 3, global.xScreenSize / 2, (global.yScreenSize / 2) + windowMenuOffset);
	}
	if (elevatorButton4.hover) {
		draw_sprite(elevatorSelectMenu_spr, 4, global.xScreenSize / 2, (global.yScreenSize / 2) + windowMenuOffset);
	}
	if (elevatorButton5.hover) {
		draw_sprite(elevatorSelectMenu_spr, 5, global.xScreenSize / 2, (global.yScreenSize / 2) + windowMenuOffset);
	}
	if (!elevatorButton1.hover && !elevatorButton2.hover && !elevatorButton3.hover && !elevatorButton4.hover && !elevatorButton5.hover) {
		draw_sprite(elevatorSelectMenu_spr, 0, global.xScreenSize / 2, (global.yScreenSize / 2) + windowMenuOffset);
	}
	
	//Draw "You Are Here" Sign
	if (room == level_CasinoRoof) {
		draw_sprite(elevatorHereMarker_spr, 0, global.xScreenSize / 2, (global.yScreenSize / 2) + windowMenuOffset);
	}
	if (room == level_DiningHall) {
		draw_sprite(elevatorHereMarker_spr, 2, global.xScreenSize / 2, (global.yScreenSize / 2) + windowMenuOffset);
	}
	if (room == level_Basement) {
		draw_sprite(elevatorHereMarker_spr, 6, global.xScreenSize / 2, (global.yScreenSize / 2) + windowMenuOffset);
	}
	if (room == level_Casino) {
		with (player_obj) {
			if (distance_to_object(Spawn4_obj) < distance_to_object(Spawn3_obj)) {
				with (camera_obj) {
					draw_sprite(elevatorHereMarker_spr, 1, global.xScreenSize / 2, (global.yScreenSize / 2) + windowMenuOffset);
				}
			} else {
				with (camera_obj) {
					draw_sprite(elevatorHereMarker_spr, 5, global.xScreenSize / 2, (global.yScreenSize / 2) + windowMenuOffset);
				}
			}
		}
	}
	
	//Draw Interest Sign
	if (global.storyAct == 0) {
		if (!global.act2Unlocked) {
			draw_sprite(elevatorInterestMarker_spr, 1, global.xScreenSize / 2, (global.yScreenSize / 2) + windowMenuOffset);
		} else {
			draw_sprite(elevatorInterestMarker_spr, 0, global.xScreenSize / 2, (global.yScreenSize / 2) + windowMenuOffset);
		}
	}
	if (global.storyAct == 1) {
		if (!global.meeting2Dialogue) {
			if (!global.firstmeetingDialogue) {
				draw_sprite(elevatorInterestMarker_spr, 1, global.xScreenSize / 2, (global.yScreenSize / 2) + windowMenuOffset);
			} else {
				draw_sprite(elevatorInterestMarker_spr, 1, global.xScreenSize / 2, (global.yScreenSize / 2) + windowMenuOffset);
				if (!global.dinnerDialogue) {
					draw_sprite(elevatorInterestMarker_spr, 2, global.xScreenSize / 2, (global.yScreenSize / 2) + windowMenuOffset);
				}
				if (!global.komoBasementDialogue) {
					draw_sprite(elevatorInterestMarker_spr, 6, global.xScreenSize / 2, (global.yScreenSize / 2) + windowMenuOffset);
				}
			}
		} else {
			draw_sprite(elevatorInterestMarker_spr, 0, global.xScreenSize / 2, (global.yScreenSize / 2) + windowMenuOffset);
		}
	}
	if (global.storyAct == 2) {
		if (!global.komoGamblingDialogueDone) {
			draw_sprite(elevatorInterestMarker_spr, 5, global.xScreenSize / 2, (global.yScreenSize / 2) + windowMenuOffset);
		}
		if (!global.tristramCindyQuestioningDialogueDone) {
			draw_sprite(elevatorInterestMarker_spr, 1, global.xScreenSize / 2, (global.yScreenSize / 2) + windowMenuOffset);
		} else {
			draw_sprite(elevatorInterestMarker_spr, 0, global.xScreenSize / 2, (global.yScreenSize / 2) + windowMenuOffset);
		}
	}
	if (global.storyAct == 3) {
		draw_sprite(elevatorInterestMarker_spr, 1, global.xScreenSize / 2, (global.yScreenSize / 2) + windowMenuOffset);
	}
	
	draw_set_font(gothicPixel_fnt);
	draw_set_halign(fa_center);
	draw_set_color(c_black);
	draw_text(global.xScreenSize / 2 - 1, global.yScreenSize - 36 + 1, "Press Esc to Cancel");
	draw_set_color(make_color_rgb(255, 215, 0));
	draw_text(global.xScreenSize / 2, global.yScreenSize - 36, "Press Esc to Cancel");
	draw_set_halign(fa_left);
	
	if (windowMenuOffset < 4)
	{
		windowMenuOffset = 0;
	}
	else
	{
		windowMenuOffset -= global.dt * 1.5;
	}
	
	if (keyboard_check_pressed(vk_escape) || gamepad_button_check_pressed(4, gp_start) || gamepad_button_check_pressed(0, gp_start)) {
		audio_play_sound(typewriterPush_snd, 1, false);
		player_obj.movement = true;
		drawBlackborders = false;
		dialogueSystem_obj.inCutscene = false;
		drawElevatorSign = false;
	}
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
		draw_sprite_ext(death_spr, 0, global.xScreenSize / 2, global.yScreenSize / 3, 1.5, 1.5, 0, -1, deathFadeIn);
		
		draw_set_color(c_black);
		draw_text((global.xScreenSize - (global.xScreenSize / 4)) - 8 - 1, (global.yScreenSize / 1.5) + 32 + 1, "Syringes Left: " + string(global.syringes));
		draw_set_color(make_color_rgb(255, 215, 0));
		draw_text((global.xScreenSize - (global.xScreenSize / 4)) - 8, (global.yScreenSize / 1.5) + 32, "Syringes Left: " + string(global.syringes))
		
		draw_set_font(gothicPixel_fnt);
		draw_set_color(make_color_rgb(255, 215, 0));
		draw_set_halign(fa_center);
		draw_sprite(button_spr, 0, global.xScreenSize / 4, global.yScreenSize / 1.5);
		draw_sprite(button_spr, 0, global.xScreenSize - (global.xScreenSize / 4), global.yScreenSize / 1.5);
		
		draw_set_color(c_black);
		draw_text((global.xScreenSize / 4) - 1, (global.yScreenSize / 1.5) - 4 + 1, "DIE [Q]");
		draw_set_color(make_color_rgb(255, 215, 0));
		draw_text(global.xScreenSize / 4, (global.yScreenSize / 1.5) - 4, "DIE [Q]");
		
		draw_set_color(c_black);
		draw_text((global.xScreenSize - (global.xScreenSize / 4)) - 1, ((global.yScreenSize / 1.5) - 4) + 1, "INFECT [E]");
		draw_set_color(make_color_rgb(255, 215, 0));
		draw_text(global.xScreenSize - (global.xScreenSize / 4), (global.yScreenSize / 1.5) - 4, "INFECT [E]");
		
		draw_set_halign(fa_left);
	}
	else
	//FULL DEATH
	{
		draw_set_color(c_black);
		draw_rectangle(-100, -100, global.xScreenSize + 100, global.yScreenSize + 100, false);
		draw_set_alpha(1);
		draw_sprite_ext(death_spr, 0, global.xScreenSize / 2, global.yScreenSize / 3, 2, 2, 0, c_red, 0.2);
		draw_sprite_ext(death_spr, 0, global.xScreenSize / 2, global.yScreenSize / 3, 1.5, 1.5, 0, c_red, 1);
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

//Show Shooting Prohibited Text
if (showWeaponProhibited && !drawElevatorSign && !showWindowMenu) {
	weaponProhibitedTextTimer -= global.dt;
	draw_set_halign(fa_center);
	draw_text(global.xScreenSize / 2, global.yScreenSize - global.yScreenSize / 4, "Shooting Prohibited");
	
	if (weaponProhibitedTextTimer < 0) {
		weaponProhibitedTextTimer = weaponProhibitedTextTimerSave;
		showWeaponProhibited = false;
	}
}

//Show Mission Text
if (global.drawMission && !global.pause) {
	if (global.storyAct == 0) {
		if (room == level_Casino || room == level_CasinoRoof || room == level_DiningHall || room == level_Basement || room == level_TristramRoom) {
			draw_set_halign(fa_center);
			draw_set_font(gothicPixel_fnt);
			draw_set_color(c_black);
			draw_text(global.xScreenSize / 2 - 1 + 11, 11 + 1, "Mission - Find and Execute Target in Senzela Forest");
			draw_set_color(make_color_rgb(255, 215, 0));
			draw_text(global.xScreenSize / 2 + 11, 11, "Mission - Find and Execute Target in Senzela Forest");
		}
	}
	if (global.storyAct == 1 && global.firstmeetingDialogue && !global.meeting2Dialogue) {
		if (room == level_Casino || room == level_CasinoRoof || room == level_DiningHall || room == level_Basement || room == level_TristramRoom) {
			draw_set_halign(fa_center);
			draw_set_font(gothicPixel_fnt);
			draw_set_color(c_black);
			draw_text(global.xScreenSize / 2 - 1 + 11, 11 + 1, "Mission - Visit the Dining Hall");
			draw_set_color(make_color_rgb(255, 215, 0));
			draw_text(global.xScreenSize / 2 + 11, 11, "Mission - Visit the Dining Hall");
		}
	}
	if (global.storyAct == 1 && global.firstmeetingDialogue && global.meeting2Dialogue) {
		if (room == level_Casino || room == level_CasinoRoof || room == level_DiningHall || room == level_Basement || room == level_TristramRoom) {
			draw_set_halign(fa_center);
			draw_set_font(gothicPixel_fnt);
			draw_set_color(c_black);
			draw_text(global.xScreenSize / 2 - 1 + 11, 11 + 1, "Mission - Investigate EDEN Powerplant");
			draw_set_color(make_color_rgb(255, 215, 0));
			draw_text(global.xScreenSize / 2 + 11, 11, "Mission - Investigate EDEN Powerplant");
		}
	}
	if (global.storyAct == 2 && global.tristramCindyQuestioningDialogueDone) {
		if (room == level_Casino || room == level_CasinoRoof || room == level_DiningHall || room == level_Basement || room == level_TristramRoom) {
			draw_set_halign(fa_center);
			draw_set_font(gothicPixel_fnt);
			draw_set_color(c_black);
			draw_text(global.xScreenSize / 2 - 1 + 11, 11 + 1, "Mission - Investigate EDEN Powerplant");
			draw_set_color(make_color_rgb(255, 215, 0));
			draw_text(global.xScreenSize / 2 + 11, 11, "Mission - Investigate EDEN Powerplant");
		}
	}
}

//Pause Screen
if (global.pause) {
	drawPause = true;
	
	if (!pauseSpawnedHitboxes) {
		for (var i = 0; i < 5; i++) {
			var hitbox = instance_create_layer(player_obj.x - 52, player_obj.y - 29 + 16 * i, "GameManagerLayer", cursorHitbox_obj);
			hitbox.image_yscale = 0.18;
			hitbox.image_xscale = 1.65;
			hitbox.index = i;
		}
		pauseSpawnedHitboxes = true;
	}
	
	if (pauseScreen == 0) {
		if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")) || gamepad_button_check_pressed(0, gp_padu) || gamepad_button_check_pressed(4, gp_padu))
		{
			audio_play_sound(typewriter_snd, 1, false);
			if (cursorPos > 0)
			{
				cursorPos--;
			}
			else
			{
				cursorPos = 4;
			}
		}
		if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S")) || gamepad_button_check_pressed(0, gp_padd) || gamepad_button_check_pressed(4, gp_padd))
		{
			audio_play_sound(typewriter_snd, 1, false);
			if (cursorPos < 4)
			{
				cursorPos++;
			}
			else
			{
				cursorPos = 0;
			}
		}
		
		//Mouse Cursor Controls
		if (instance_exists(cursorHitbox_obj)) {
			for (var i = 0; i < instance_number(cursorHitbox_obj); ++i;) {
				var hitbox = instance_find(cursorHitbox_obj, i);
				if (instance_exists(hitbox)) {
					if (hitbox.open) {
						cursorPos = hitbox.index;
				
						if (mouse_check_button_pressed(mb_left)) {
							audio_play_sound(typewriterPush_snd, 1, false);
							switch (cursorPos)
							{
								case 0:
									if (!player_obj.pauseDelayStart) {
										global.pause = false;
									}
								break;
								case 1:
									pauseScreen = 1;
									cursorPos = 0;
								break;
								case 2:
									global.pause = false;
									room_restart();
								break;
								case 3:
									if (global.reachedCasino) {
										global.pause = false;
										room_goto(level_Casino);
									}
								break;
								case 4:
									global.pause = false;
									room_goto(mainmenu);
								break;
							}
						}
					}
				}
			}
		}

		if (keyboard_check_pressed(vk_enter) || gamepad_button_check_pressed(0, gp_face1) || gamepad_button_check_pressed(4, gp_face1))
		{
			audio_play_sound(typewriterPush_snd, 1, false);
			switch (cursorPos)
			{
				case 0:
					if (!player_obj.pauseDelayStart) {
						global.pause = false;
					}
				break;
				case 1:
					pauseScreen = 1;
					cursorPos = 0;
				break;
				case 2:
					global.pause = false;
					room_restart();
				break;
				case 3:
					if (global.reachedCasino) {
						global.pause = false;
						room_goto(level_Casino);
					}
				break;
				case 4:
					global.pause = false;
					room_goto(mainmenu);
				break;
			}
		}
	} else {
		if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")) || gamepad_button_check_pressed(0, gp_padu) || gamepad_button_check_pressed(4, gp_padu))
		{
			audio_play_sound(typewriter_snd, 1, false);
			if (cursorPos > 0)
			{
				cursorPos--;
			}
			else
			{
				cursorPos = 2;
			}
		}
		if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S")) || gamepad_button_check_pressed(0, gp_padd) || gamepad_button_check_pressed(4, gp_padd))
		{
			audio_play_sound(typewriter_snd, 1, false);
			if (cursorPos < 2)
			{
				cursorPos++;
			}
			else
			{
				cursorPos = 0;
			}
		}
		//Mouse Cursor Controls
		if (instance_exists(cursorHitbox_obj)) {
			for (var i = 0; i < instance_number(cursorHitbox_obj); ++i;) {
				var hitbox = instance_find(cursorHitbox_obj, i);
				if (instance_exists(hitbox)) {
					if (hitbox.open) {
						cursorPos = hitbox.index;
				
						if (mouse_check_button_pressed(mb_left)) {
							audio_play_sound(typewriterPush_snd, 1, false);
							switch (cursorPos)
							{
								case 2:
									pauseScreen = 0;
									cursorPos = 0;
								break;
							}
						}
					}
				}
			}
		}
		if (keyboard_check_pressed(vk_enter) || gamepad_button_check_pressed(0, gp_face1) || gamepad_button_check_pressed(4, gp_face1))
		{
			audio_play_sound(typewriterPush_snd, 1, false);
			switch (cursorPos)
			{
				case 2:
					pauseScreen = 0;
					cursorPos = 0;
				break;
			}
		}
		if (keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D")) || gamepad_button_check_pressed(0, gp_padr) || gamepad_button_check_pressed(4, gp_padr))
		{
			audio_play_sound(typewriter_snd, 1, false);
			switch (cursorPos)
			{
				case 0:
					if (global.soundVolume < 100) {
						global.soundVolume += 10;
					}
				break;
				case 1:
					if (global.musicVolume < 100) {
						global.musicVolume += 10;
					}
				break;
			}
			saveSettings_scr();
		}
	
		if (keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A")) || gamepad_button_check_pressed(0, gp_padl) || gamepad_button_check_pressed(4, gp_padl))
		{
			audio_play_sound(typewriter_snd, 1, false);
			switch (cursorPos)
			{
				case 0:
					if (global.soundVolume > 0) {
						global.soundVolume -= 10;
					}
				break;
				case 1:
					if (global.musicVolume > 0) {
						global.musicVolume -= 10;
					}
				break;
			}
			saveSettings_scr();
		}
	}
} else {
	if (pauseOffset < 1 && pauseAlpha < 0.05) {
		drawPause = false;
		cursorAnim = 0;
	}
	
	if (windowType != 1) {
		if (instance_exists(cursorHitbox_obj)) {
			instance_destroy(cursorHitbox_obj);
		}
		pauseSpawnedHitboxes = false;
	}
}
	
if (drawPause) {
	if (!global.pause) {
		if (pauseAlpha > 0) {
			pauseAlpha -= global.dtNoSlowmo / 100;
		}
		if (pauseOffset > 0) {
			pauseOffset -= round(global.dtNoSlowmo) * 4;
		}
	} else {
		if (pauseAlpha < 1) {
			pauseAlpha += global.dtNoSlowmo / 50;
		}
		if (pauseOffset < 142) {
			pauseOffset += round(global.dtNoSlowmo) * 2;
		} else {
			pauseOffset = 142;
		}
	}
	
	draw_set_alpha(pauseAlpha);
		
	draw_sprite_ext(goldcornerBottom_spr, 0, -pauseOffset + 142, -pauseOffset + 142, 1, 1, 0, c_white, pauseAlpha);
	draw_sprite_ext(goldcornerTop_spr, 0, pauseOffset - 142, pauseOffset - 142, 1, 1, 0, c_white, pauseAlpha);
	
	draw_sprite_ext(mainmenuTitleSmall_spr, 0, 16, global.yScreenSize - 16, 1, 1, 0, c_white, pauseAlpha);
	draw_set_font(gothicPixel_fnt);
	draw_set_halign(fa_center);
	draw_set_color(make_color_rgb(255, 215, 0));

	if (pauseScreen == 0) {
		draw_set_color(c_black);
		draw_text(global.xScreenSize / 2 - 1, global.yScreenSize / 2.5 + 1, "Resume");
		draw_set_color(make_color_rgb(255, 215, 0));
		draw_text(global.xScreenSize / 2, global.yScreenSize / 2.5, "Resume");
		draw_set_color(c_black);
		draw_text(global.xScreenSize / 2 - 1, global.yScreenSize / 2.5 + 16 + 1, "Settings");
		draw_set_color(make_color_rgb(255, 215, 0));
		draw_text(global.xScreenSize / 2, global.yScreenSize / 2.5 + 16, "Settings");
		draw_set_color(c_black);
		draw_text(global.xScreenSize / 2 - 1, global.yScreenSize / 2.5 + 32 + 1, "Restart Checkpoint");
		draw_set_color(make_color_rgb(255, 215, 0));
		draw_text(global.xScreenSize / 2, global.yScreenSize / 2.5 + 32, "Restart Checkpoint");
		if (global.reachedCasino) {
			draw_set_color(c_black);
			draw_text(global.xScreenSize / 2 - 1, global.yScreenSize / 2.5 + 48 + 1, "Return to Casino");
			draw_set_color(make_color_rgb(255, 215, 0));
			draw_text(global.xScreenSize / 2, global.yScreenSize / 2.5 + 48, "Return to Casino");
		} else {
			draw_set_color(c_black);
			draw_text(global.xScreenSize / 2 - 1, global.yScreenSize / 2.5 + 48 + 1, "Return to Casino");
			draw_set_color(make_color_rgb(110, 110, 110));
			draw_text(global.xScreenSize / 2, global.yScreenSize / 2.5 + 48, "Return to Casino");
		}
		draw_set_color(c_black);
		draw_text(global.xScreenSize / 2 - 1, global.yScreenSize / 2.5 + 64 + 1, "Quit to Main Menu");
		draw_set_color(make_color_rgb(255, 215, 0));
		draw_text(global.xScreenSize / 2, global.yScreenSize / 2.5 + 64, "Quit to Main Menu");
	
		cursorAnim += global.dtNoSlowmo / 17;
		switch (cursorPos)
		{
			case 0:
				draw_sprite(chipRed_spr, cursorAnim, global.xScreenSize / 2 - 64, global.yScreenSize / 2.5 + 4);
			break;
			case 1:
				draw_sprite(chipRed_spr, cursorAnim, global.xScreenSize / 2 - 64, global.yScreenSize / 2.5 + 20);
			break;
			case 2:
				draw_sprite(chipRed_spr, cursorAnim, global.xScreenSize / 2 - 64, global.yScreenSize / 2.5 + 36);
			break;
			case 3:
				draw_sprite(chipRed_spr, cursorAnim, global.xScreenSize / 2 - 64, global.yScreenSize / 2.5 + 50);
			break;
			case 4:
				draw_sprite(chipRed_spr, cursorAnim, global.xScreenSize / 2 - 64, global.yScreenSize / 2.5 + 66);
			break;
		}
	
		draw_set_alpha(1);
	} else {
		draw_set_color(c_black);
		draw_text(global.xScreenSize / 2 - 1, global.yScreenSize / 2.5 + 1, "Sound Volume [" + string(global.soundVolume) + "%]");
		draw_text(global.xScreenSize / 2 - 1, global.yScreenSize / 2.5 + 16 + 1, "Music Volume [" + string(global.musicVolume) + "%]");
		draw_text(global.xScreenSize / 2 - 1, global.yScreenSize / 2.5 + 32 + 1, "Back");
		draw_set_color(make_color_rgb(255, 215, 0));
		draw_text(global.xScreenSize / 2, global.yScreenSize / 2.5, "Sound Volume [" + string(global.soundVolume) + "%]");
		draw_text(global.xScreenSize / 2, global.yScreenSize / 2.5 + 16, "Music Volume [" + string(global.musicVolume) + "%]");
		draw_text(global.xScreenSize / 2, global.yScreenSize / 2.5 + 32, "Back");
	
		cursorAnim += global.dtNoSlowmo / 17;
		switch (cursorPos)
		{
			case 0:
				draw_sprite(chipRed_spr, cursorAnim, global.xScreenSize / 2 - 76, global.yScreenSize / 2.5 + 4);
			break;
			case 1:
				draw_sprite(chipRed_spr, cursorAnim, global.xScreenSize / 2 - 76, global.yScreenSize / 2.5 + 20);
			break;
			case 2:
				draw_sprite(chipRed_spr, cursorAnim, global.xScreenSize / 2 - 48, global.yScreenSize / 2.5 + 36);
			break;
		}
	
		draw_set_alpha(1);
	}
}

//Cursor
//Crosshair Setup
if (room != level28) {
	if (!dialogueSystem_obj.inCutscene || (dialogueSystem_obj.inCutscene && drawElevatorSign) || (dialogueSystem_obj.inCutscene && showWindowMenu)) {
		if (instance_exists(player_obj)) {
			if (windowType == 1 || drawElevatorSign) {
				draw_sprite(mousecursor_spr, 0, 
					(window_mouse_get_x() / ((window_get_width()+1) / global.xScreenSize)) + (0), 
					window_mouse_get_y() / ((window_get_height()+1) / global.yScreenSize) + (0));
			} else if (player_obj.inputMethod == 0) {
				if (!global.pause) {
					draw_sprite(cursor_spr, 0, 
					(window_mouse_get_x() / ((window_get_width()+1) / global.xScreenSize)) + (0), 
					window_mouse_get_y() / ((window_get_height()+1) / global.yScreenSize) + (0));
				} else {
					draw_sprite(mousecursor_spr, 0, 
					(window_mouse_get_x() / ((window_get_width()+1) / global.xScreenSize)) + (0), 
					window_mouse_get_y() / ((window_get_height()+1) / global.yScreenSize) + (0));
				}
			}
		}
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

//Skip Cutscene Prompt
draw_set_color(make_color_rgb(255, 215, 0));
if (instance_exists(player_obj) && room != level28) {
	if (blackscreenStrength < 0.98) {
		if (player_obj.inCutscene) {
			if (player_obj.inputMethod == 0) {
				draw_text(16, global.yScreenSize - 16, "Press Enter to Skip");
			} else {
				draw_text(16, global.yScreenSize - 16, "Press Select to Skip");
			}
		}
	}
}

//Fastforward Dialogue
if (blackscreenStrength < 0.98) {
	if (dialogueSystem_obj.inCutscene && !camera_obj.drawElevatorSign && !showWindowMenu && room != level28) {
		draw_set_color(make_color_rgb(255, 215, 0));
		draw_set_halign(fa_center);
		draw_text(global.xScreenSize / 2, global.yScreenSize - global.yScreenSize / 4 + 32, "Hold Space to Fastforward");
		draw_text(global.xScreenSize / 2, global.yScreenSize - global.yScreenSize / 4 + 48, "Press Enter to Skip");
		draw_set_color(c_black);
	}
}
	
if (character != cutieplusSteph_obj && room != level28) {
	if (keyboard_check(vk_space) || gamepad_button_check(4, gp_face1) || gamepad_button_check(0, gp_face1)) {
		textSpeed = 3;
	} else {
		textSpeed = 1;
	}
}

//Save Icon
if (currentlySaving) {
	if (saveIconDelay > 0) {
		draw_sprite(saveIcon_spr, 0, global.xScreenSize - 32, global.yScreenSize - 32);
		saveIconDelay -= global.dtNoSlowmo;
	} else {
		currentlySaving = false;
		saveIconDelay = saveIconDelaySave;
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