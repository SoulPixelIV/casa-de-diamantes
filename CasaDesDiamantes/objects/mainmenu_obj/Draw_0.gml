draw_set_font(gothicPixel_fnt);
draw_set_halign(fa_center);

if (file_exists("save1")) {
	draw_set_color(make_color_rgb(255, 215, 0));
	draw_text(global.xScreenSize / 2, optionsY[0], "Continue");
} else {
	draw_set_color(make_color_rgb(110, 110, 110));
	draw_text(global.xScreenSize / 2, optionsY[0], "Continue");
}
draw_set_color(make_color_rgb(255, 215, 0));
draw_text(global.xScreenSize / 2, optionsY[1], "New Game");
draw_text(global.xScreenSize / 2, optionsY[2], "Settings");
draw_text(global.xScreenSize / 2, optionsY[3], "Exit");

draw_set_halign(fa_right);
draw_text(global.xScreenSize - 24, global.yScreenSize - 16, "MAIN v.1.7");
draw_set_halign(fa_center);
//draw_text(global.xScreenSize / 2, global.yScreenSize - 16, "Mouse & Keyboard Recommended");
draw_set_halign(fa_left);

//Draw title
draw_sprite_ext(mainmenuTitle_spr, 0, global.xScreenSize / 2, 86, 1, 1, 0, -1, titleAlpha);

//Draw cursor
cursorImage += global.dt / 16;
if (!drawStartMenu) {
	draw_sprite(chipRed_spr, cursorImage, global.xScreenSize / 2 - 40, optionsY[cursorPos] + 4);
	draw_sprite(chipRed_spr, cursorImage, global.xScreenSize / 2 + 40, optionsY[cursorPos] + 4);
}

//Start Window
if (drawStartMenu) {
	draw_sprite_ext(menuWindow_spr, 0, global.xScreenSize / 2, global.yScreenSize / 2.5, 1, 0.79, 0, -1, 1);
	
	draw_sprite_ext(button_spr, 0, global.xScreenSize / 2 - 72, global.yScreenSize / 2.5 + 16, 1, 0.78, 0, -1, 1);
	draw_sprite_ext(button_spr, 0, global.xScreenSize / 2 + 72, global.yScreenSize / 2.5 + 16, 1, 0.78, 0, -1, 1);
	
	draw_set_font(gothicPixel_fnt);
	draw_set_halign(fa_center);
	draw_set_color(c_black);
	draw_text(global.xScreenSize / 2 - 1, global.yScreenSize / 2.5 - 45, "Start a new Save File?");
	draw_set_color(make_color_rgb(255, 215, 0));
	draw_text(global.xScreenSize / 2, global.yScreenSize / 2.5 - 45, "Start a new Save File?");
	
	draw_set_color(c_black);
	draw_text((global.xScreenSize / 2 - 1) - 72, global.yScreenSize / 2.5 + 12, "Yes, Please!");
	draw_set_color(make_color_rgb(255, 215, 0));
	draw_text(global.xScreenSize / 2 - 72, global.yScreenSize / 2.5 + 12, "Yes, Please!");
	
	draw_set_color(c_black);
	draw_text((global.xScreenSize / 2 - 1) + 72, global.yScreenSize / 2.5 + 12, "No");
	draw_set_color(make_color_rgb(255, 215, 0));
	draw_text(global.xScreenSize / 2 + 72, global.yScreenSize / 2.5 + 12, "No");
	draw_set_halign(fa_left);
	
	//Mouse Cursor Controls
	if (instance_exists(cursorHitbox_obj)) {
		for (var i = 0; i < instance_number(cursorHitbox_obj); ++i;) {
			var hitbox = instance_find(cursorHitbox_obj, i);
			if (instance_exists(hitbox)) {
				if (hitbox.open) {
					if (hitbox.index == 4 || hitbox.index == 5) {
						if (hitbox.index == 4) {
							startMenuElement = 0;
						}
						if (hitbox.index == 5) {
							startMenuElement = 1;
						}
				
						if (mouse_check_button_pressed(mb_left)) {
							audio_play_sound(typewriterPush_snd, 1, false);
							if (!buttonBufferStart) {
								switch (startMenuElement)
								{
									case 0:
										global.transitionScreenDest = level0;
										global.unlockedWeapon[1] = false;
										global.unlockedWeapon[2] = false;
										global.unlockedWeapon[3] = false;
										global.unlockedWeapon[4] = false;
										global.pistolAmmo = 0;
										global.shotgunAmmo = 0;
										global.sniperAmmo = 0;
										global.bowAmmo = 0;
										global.silencedMPAmmo = 0;
										global.cutsceneLevel2Done = false;
										global.reachedCasino = false;					
										global.spawn = 0;
										global.money = 0;
										global.skin = 0;
										global.syringes = 0;
										global.room = noone;
										global.diamonds = 0;
										global.lastCheckpoint = noone;
										global.hasWarpzoneKey = false;
										global.keyRed = false;
										global.keyBlue = false;
										global.keyYellow = false;
										global.scorepoints = 0;
										global.currentWorld = 0;
										global.storyAct = 0;
										global.multiplier = 1;
										global.multiplierTimer = 700;
										global.multiplierTimerSave = global.multiplierTimer;
										global.timer = 0;
										global.drawTutorialInfectionUsed = false;
										global.level5AArena1Done = false;
										global.level5AArena2Done = false;
										global.level5BArena3Done = false;
										global.level4DoorOpen = false;

										global.shotgunUpgrade1 = false;
										global.shotgunUpgrade2 = false;

										global.dualBarettasUpgrade1 = false;
										global.dualBarettasUpgrade2 = false;
										
										global.silencedMPUpgrade1 = false;
										global.silencedMPUpgrade2 = false;

										global.sniperUpgrade1 = false;
										global.sniperUpgrade2 = false;

										global.cupyUpgrade1 = false;
										global.cupyUpgrade2 = false;

										global.boughtSkin1 = false;

										global.reachedCasino = false;
										global.act2Unlocked = false;
										global.act3Unlocked = false;

										global.cutsceneLevel2Done = false;
										global.cutsceneCasinoIntroDone = false;

										global.arrowLevel2Done = false;
										global.arrowVIPDone = false;
										global.arrowCindyDone = false;

										global.pwlevel2UnlockedElevator = false;
										global.pwlevel3UnlockedElevator = false;

										global.level2Gate = false;
										global.level5ABooster = false;
										global.level5AGate = false;
										global.level5BGate = false;
										global.level5BGate2 = false;
										global.level8Booster = false;
										global.level8Booster2 = false;
										global.level8Booster3 = false;
										global.level12Gate = false;
										global.level13Booster = false;
										global.level15Spring = false;
										global.level15Shortcut = false;
										
										global.level4DoorOpen = false;
										global.level6GateAOpen = false;
										global.level6GateBOpen = false;

										global.warpzone1DoorOpen = false;
										global.warpzone1Reward = false;
										global.warpzone1RewardGiven = false;

										global.drawMission = false;
										global.introDialogueCindyDone = false;
										global.introDialogueVIPDone = false;
										global.introDialogueOutOfRoomDone = false;
										global.cupyDialogue1Done = false;
										global.cupyDialogue2Done = false;
										global.cupyDialogue3Done = false;
										global.cupyDialogue4Done = false;
										global.cupyDialogue5Done = false;
										global.cupyDialogue6Done = false;
										global.moveToWorld = 0;
										
										room_goto(transitionScreen);
										startMenuElement = 1;
									break;
									case 1:
										startMenuElement = 1;
										drawStartMenu = false;
									break;
								}
							}
						}
					}
				}
			}
		}
	}
	
	if (startMenuElement == 0) {
		draw_sprite(chipRed_spr, cursorImage, global.xScreenSize / 2 - 72 - 42, global.yScreenSize / 2.5 + 16);
	} else {
		draw_sprite(chipRed_spr, cursorImage, global.xScreenSize / 2 + 72 - 17, global.yScreenSize / 2.5 + 16);
	}
	
	if (keyboard_check_pressed(ord("A")) || keyboard_check_pressed(vk_left) || gamepad_button_check_pressed(0, gp_padl) || gamepad_button_check_pressed(4, gp_padl)) {
		audio_play_sound(typewriter_snd, 1, false);
		if (startMenuElement == 0) {
			startMenuElement = 1;
		} else {
			startMenuElement = 0;
		}
	}
	
	if (keyboard_check_pressed(ord("D")) || keyboard_check_pressed(vk_right) || gamepad_button_check_pressed(0, gp_padr) || gamepad_button_check_pressed(4, gp_padr)) {
		audio_play_sound(typewriter_snd, 1, false);
		if (startMenuElement == 1) {
			startMenuElement = 0;
		} else {
			startMenuElement = 1;
		}
	}
	
	if (!buttonBufferStart) {
		if (keyboard_check_pressed(vk_enter) || gamepad_button_check_pressed(0, gp_face1) || gamepad_button_check_pressed(4, gp_face1))
		{
			audio_play_sound(typewriterPush_snd, 1, false);
			if (startMenuElement == 0) {
				global.transitionScreenDest = level0;
				global.unlockedWeapon[1] = false;
				global.unlockedWeapon[2] = false;
				global.unlockedWeapon[3] = false;
				global.unlockedWeapon[4] = false;
				global.pistolAmmo = 0;
				global.shotgunAmmo = 0;
				global.sniperAmmo = 0;
				global.bowAmmo = 0;
				global.silencedMPAmmo = 0;
				global.cutsceneLevel2Done = false;
				global.reachedCasino = false;					
				global.spawn = 0;
				global.money = 0;
				global.skin = 0;
				global.syringes = 0;
				global.room = noone;
				global.diamonds = 0;
				global.lastCheckpoint = noone;
				global.hasWarpzoneKey = false;
				global.keyRed = false;
				global.keyBlue = false;
				global.keyYellow = false;
				global.scorepoints = 0;
				global.currentWorld = 0;
				global.storyAct = 0;
				global.multiplier = 1;
				global.multiplierTimer = 700;
				global.multiplierTimerSave = global.multiplierTimer;
				global.timer = 0;
				global.drawTutorialInfectionUsed = false;
				global.level5AArena1Done = false;
				global.level5AArena2Done = false;
				global.level5BArena3Done = false;

				global.shotgunUpgrade1 = false;
				global.shotgunUpgrade2 = false;

				global.dualBarettasUpgrade1 = false;
				global.dualBarettasUpgrade2 = false;

				global.cupyUpgrade1 = false;
				global.cupyUpgrade2 = false;

				global.boughtSkin1 = false;

				global.reachedCasino = false;
				global.act2Unlocked = false;
				global.act3Unlocked = false;

				global.cutsceneLevel2Done = false;
				global.cutsceneCasinoIntroDone = false;

				global.arrowLevel2Done = false;
				global.arrowVIPDone = false;
				global.arrowCindyDone = false;

				global.pwlevel2UnlockedElevator = false;
				global.pwlevel3UnlockedElevator = false;

				global.level2Gate = false;
				global.level5ABooster = false;
				global.level5AGate = false;
				global.level5BGate = false;
				global.level5BGate2 = false;
				global.level8Booster = false;
				global.level8Booster2 = false;
				global.level8Booster3 = false;
				global.level12Gate = false;
				global.level13Booster = false;
				global.level15Spring = false;
				global.level15Shortcut = false;
										
				global.level4DoorOpen = false;
				global.level6GateAOpen = false;
				global.level6GateBOpen = false;

				global.warpzone1DoorOpen = false;
				global.warpzone1Reward = false;
				global.warpzone1RewardGiven = false;

				global.drawMission = false;
				global.introDialogueCindyDone = false;
				global.introDialogueVIPDone = false;
				global.introDialogueOutOfRoomDone = false;
				global.cupyDialogue1Done = false;
				global.cupyDialogue2Done = false;
				global.cupyDialogue3Done = false;
				global.cupyDialogue4Done = false;
				global.cupyDialogue5Done = false;
				global.cupyDialogue6Done = false;
				global.moveToWorld = 0;
										
				room_goto(transitionScreen);
				startMenuElement = 1;
			} else {
				startMenuElement = 1;
				drawStartMenu = false;
			}
		}
	}
}

//Skip Window
if (drawSkipMenu) {
	draw_sprite_ext(menuWindow_spr, 0, global.xScreenSize / 2, global.yScreenSize / 2.5, 1, 0.79, 0, -1, 1);
	
	draw_sprite_ext(button_spr, 0, global.xScreenSize / 2 - 72, global.yScreenSize / 2.5 + 16, 1, 0.78, 0, -1, 1);
	draw_sprite_ext(button_spr, 0, global.xScreenSize / 2 + 72, global.yScreenSize / 2.5 + 16, 1, 0.78, 0, -1, 1);
	
	draw_set_font(gothicPixel_fnt);
	draw_set_halign(fa_center);
	draw_set_color(c_black);
	draw_text(global.xScreenSize / 2 - 1, global.yScreenSize / 2.5 - 45, "Skip Intro?");
	draw_set_color(make_color_rgb(255, 215, 0));
	draw_text(global.xScreenSize / 2, global.yScreenSize / 2.5 - 45, "Skip Intro?");
	
	draw_set_color(c_black);
	draw_text((global.xScreenSize / 2 - 1) - 72, global.yScreenSize / 2.5 + 12, "Yes");
	draw_set_color(make_color_rgb(255, 215, 0));
	draw_text(global.xScreenSize / 2 - 72, global.yScreenSize / 2.5 + 12, "Yes");
	
	draw_set_color(c_black);
	draw_text((global.xScreenSize / 2 - 1) + 72, global.yScreenSize / 2.5 + 12, "Don't Skip");
	draw_set_color(make_color_rgb(255, 215, 0));
	draw_text(global.xScreenSize / 2 + 72, global.yScreenSize / 2.5 + 12, "Don't Skip");
	draw_set_halign(fa_left);
	
	//Mouse Cursor Controls
	if (instance_exists(cursorHitbox_obj)) {
		for (var i = 0; i < instance_number(cursorHitbox_obj); ++i;) {
			var hitbox = instance_find(cursorHitbox_obj, i);
			if (instance_exists(hitbox)) {
				if (hitbox.open) {
					if (hitbox.index == 4 || hitbox.index == 5) {
						if (hitbox.index == 4) {
							startMenuElement = 0;
						}
						if (hitbox.index == 5) {
							startMenuElement = 1;
						}
				
						if (mouse_check_button_pressed(mb_left)) {
							if (buttonBuffer2 < 0) {
								switch (startMenuElement)
								{
									case 0:
										room_goto(level1);
										drawSkipMenu = false;
										buttonBuffer2 = buttonBufferSave2;
										buttonBufferStart2 = false;
									break;
									case 1:
										global.transitionScreenDest = level0;
										room_goto(transitionScreen);
										startMenuElement = 1;
										drawSkipMenu = false;
										buttonBuffer2 = buttonBufferSave2;
										buttonBufferStart2 = false;
									break;
								}
							}
						}
					}
				}
			}
		}
	}
	
	if (startMenuElement == 0) {
		draw_sprite(chipRed_spr, cursorImage, global.xScreenSize / 2 - 72 - 21, global.yScreenSize / 2.5 + 16);
	} else {
		draw_sprite(chipRed_spr, cursorImage, global.xScreenSize / 2 + 72 - 42, global.yScreenSize / 2.5 + 16);
	}
	
	if (keyboard_check_pressed(ord("A")) || keyboard_check_pressed(vk_left) || gamepad_button_check_pressed(0, gp_padl) || gamepad_button_check_pressed(4, gp_padl)) {
		if (startMenuElement == 0) {
			startMenuElement = 1;
		} else {
			startMenuElement = 0;
		}
	}
	
	if (keyboard_check_pressed(ord("D")) || keyboard_check_pressed(vk_right) || gamepad_button_check_pressed(0, gp_padr) || gamepad_button_check_pressed(4, gp_padr)) {
		if (startMenuElement == 1) {
			startMenuElement = 0;
		} else {
			startMenuElement = 1;
		}
	}
	
	if (buttonBuffer2 < 0) {
		if (keyboard_check_pressed(vk_enter) || gamepad_button_check_pressed(0, gp_face1) || gamepad_button_check_pressed(4, gp_face1))
		{
			if (startMenuElement == 0) {
				room_goto(level1);
				drawSkipMenu = false;
				buttonBuffer2 = buttonBufferSave2;
				buttonBufferStart2 = false;
			} else {
				global.transitionScreenDest = level0;
				room_goto(transitionScreen);
				startMenuElement = 1;
				drawSkipMenu = false;
				buttonBuffer2 = buttonBufferSave2;
				buttonBufferStart2 = false;
			}
		}
	}
}

if (buttonBufferStart2) {
	buttonBuffer2 -= global.dt;
}

//Cursor
if (inputMethod == 0) {
	draw_sprite(mousecursor_spr, 0, 
		(window_mouse_get_x() / ((window_get_width()+1) / global.xScreenSize)) + (0), 
		window_mouse_get_y() / ((window_get_height()+1) / global.yScreenSize) + (0));
}