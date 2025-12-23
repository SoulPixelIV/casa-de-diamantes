draw_self();

//Warning Window
if (global.drawWarningMenu && !global.drawStartMenu && !global.drawSkipMenu && !global.drawEraseMenu) {
	draw_sprite_ext(menuWindow_spr, 0, global.xScreenSize / 2, global.yScreenSize / 2.5, 1, 0.79, 0, -1, 1);
	draw_set_font(gothicPixel_fnt);
	draw_set_halign(fa_center);
	draw_set_color(c_black);
	draw_set_alpha(1);
	draw_text(global.xScreenSize / 2 - 1, global.yScreenSize / 2.5 - 45, "Important!\nThe selected save file is corrupted due to an Update.\nEverything except for the level progress is saved!\nPlease use the Level Select in the Main Menu.\nPress any key");
	draw_set_color(make_color_rgb(255, 215, 0));
	draw_text(global.xScreenSize / 2, global.yScreenSize / 2.5 - 45, "Important!\nThe selected save file is corrupted due to an Update.\nEverything except for the level progress is saved!\nPlease use the Level Select in the Main Menu.\nPress any key!");
}

//Start Window
if (global.drawStartMenu) {
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
					if (hitbox.index == 5 || hitbox.index == 6) {
						if (hitbox.index == 5) {
							startMenuElement = 0;
						}
						if (hitbox.index == 6) {
							startMenuElement = 1;
						}
				
						if (mouse_check_button_pressed(mb_left)) {
							audio_play_sound(typewriterPush_snd, 1, false);
							if (pushDelay < 0) {
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
										global.deaths = 0;
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
										global.playtime = 0;

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

										global.level6GateAOpen = false;
										global.level6GateBOpen = false;
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
										global.level16Shortcut = false;
	
										global.level16FloorGate = false;
										global.level16ArenaGate = false;
										global.level16BacktrackGate1 = false;
										global.level16BacktrackGate2 = false;
										global.level18SecretGate1 = false;
										global.level18SecretGate2 = false;
										global.level19Shortcut1 = false;
										global.level21WeaponGate = false;
										global.level21MainGate = false;
										global.level21ExitGate = false;
										global.level22Stage1Gate = false;
										global.level22Stage2Gate = false;
										global.level22Stage3Gate = false;

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
										global.drawStartMenu = false;
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
		draw_sprite(chipRed_spr, cursorImage, global.xScreenSize / 2 - 72 - 42 - 3, global.yScreenSize / 2.5 + 16);
	} else {
		draw_sprite(chipRed_spr, cursorImage, global.xScreenSize / 2 + 72 - 17 - 3, global.yScreenSize / 2.5 + 16);
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
	
	if (pushDelay < 0) {
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
				global.deaths = 0;
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
				global.playtime = 0;
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
				global.drawStartMenu = false;
			}
		}
	}
}

//Erase Window
if (global.drawEraseMenu) {
	draw_sprite_ext(menuWindow_spr, 0, global.xScreenSize / 2, global.yScreenSize / 2.5, 1, 0.79, 0, -1, 1);
	
	draw_sprite_ext(button_spr, 0, global.xScreenSize / 2 - 72, global.yScreenSize / 2.5 + 16, 1, 0.78, 0, -1, 1);
	draw_sprite_ext(button_spr, 0, global.xScreenSize / 2 + 72, global.yScreenSize / 2.5 + 16, 1, 0.78, 0, -1, 1);
	
	draw_set_font(gothicPixel_fnt);
	draw_set_halign(fa_center);
	draw_set_color(c_black);
	draw_text(global.xScreenSize / 2 - 1, global.yScreenSize / 2.5 - 45, "Erase this Save File?");
	draw_set_color(make_color_rgb(255, 215, 0));
	draw_text(global.xScreenSize / 2, global.yScreenSize / 2.5 - 45, "Erase this Save File?");
	
	draw_set_color(c_black);
	draw_text((global.xScreenSize / 2 - 1) - 72, global.yScreenSize / 2.5 + 12, "Yes, Delete it!");
	draw_set_color(make_color_rgb(255, 215, 0));
	draw_text(global.xScreenSize / 2 - 72, global.yScreenSize / 2.5 + 12, "Yes, Delete it!");
	
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
					if (hitbox.index == 5 || hitbox.index == 6) {
						if (hitbox.index == 5) {
							startMenuElement = 0;
						}
						if (hitbox.index == 6) {
							startMenuElement = 1;
						}
				
						if (mouse_check_button_pressed(mb_left)) {
							audio_play_sound(typewriterPush_snd, 1, false);
							if (pushDelay < 0) {
								switch (startMenuElement)
								{
									case 0:
										if (global.currentSaveFile == 0) {
											if (file_exists("save1")) {
												file_delete("save1");
											}
										}
										if (global.currentSaveFile == 1) {
											if (file_exists("save2")) {
												file_delete("save2");
											}
										}
										if (global.currentSaveFile == 2) {
											if (file_exists("save3")) {
												file_delete("save3");
											}
										}
										
										if (instance_exists(delete_icon_obj)) {
											with (delete_icon_obj) {
												if (index == 0) {
													if (file_exists("save1")) {
														ini_open("save1");
								
														ini_close();
													} 
													if (!file_exists("save1")) {
														image_index = 2;
													}
												}

												if (index == 1) {
													if (file_exists("save2")) {
														ini_open("save2");
								
														ini_close();
													}
													if (!file_exists("save2")) {
														image_index = 2;
													}
												}

												if (index == 2) {
													if (file_exists("save3")) {
														ini_open("save3");
								
														ini_close();
													}
													if (!file_exists("save3")) {
														image_index = 2;
													}
												}
											}
										}
										
										image_index = 0;
										saveImageIndex = 0;
										
										global.drawEraseMenu = false;
										startMenuElement = 1;
									break;
									case 1:
										startMenuElement = 1;
										global.drawEraseMenu = false;
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
		draw_sprite(chipRed_spr, cursorImage, global.xScreenSize / 2 - 72 - 42 - 3, global.yScreenSize / 2.5 + 16);
	} else {
		draw_sprite(chipRed_spr, cursorImage, global.xScreenSize / 2 + 72 - 17 - 3, global.yScreenSize / 2.5 + 16);
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
	
	if (pushDelay < 0) {
		if (keyboard_check_pressed(vk_enter) || gamepad_button_check_pressed(0, gp_face1) || gamepad_button_check_pressed(4, gp_face1))
		{
			audio_play_sound(typewriterPush_snd, 1, false);
			if (startMenuElement == 0) {
				if (global.currentSaveFile == 0) {
					if (file_exists("save1")) {
						file_delete("save1");
					}
				}
				if (global.currentSaveFile == 1) {
					if (file_exists("save2")) {
						file_delete("save2");
					}
				}
				if (global.currentSaveFile == 2) {
					if (file_exists("save3")) {
						file_delete("save3");
					}
				}
				
				if (instance_exists(delete_icon_obj)) {
					with (delete_icon_obj) {
						if (index == 0) {
							if (file_exists("save1")) {
								ini_open("save1");
								
								ini_close();
							} 
							if (!file_exists("save1")) {
								image_index = 2;
							}
						}

						if (index == 1) {
							if (file_exists("save2")) {
								ini_open("save2");
								
								ini_close();
							}
							if (!file_exists("save2")) {
								image_index = 2;
							}
						}

						if (index == 2) {
							if (file_exists("save3")) {
								ini_open("save3");
								
								ini_close();
							}
							if (!file_exists("save3")) {
								image_index = 2;
							}
						}
					}
				}
				
				image_index = 0;
				saveImageIndex = 0;
										
				global.drawEraseMenu = false;
				startMenuElement = 1;
			} else {
				startMenuElement = 1;
				global.drawEraseMenu = false;
			}
		}
	}
}

cursorImage += global.dt / 16;

//Go to Background
if (global.drawWarningMenu || global.drawStartMenu || global.drawEraseMenu) {
	image_alpha = 0.2;
} else {
	image_alpha = 1;
}