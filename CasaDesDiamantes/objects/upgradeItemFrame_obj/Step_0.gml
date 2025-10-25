if (instance_exists(upgradeMenu_obj)) {
	if (upgradeMenu_obj.inputMethod != 0) {
		var pad = -1;
		if (gamepad_is_connected(0)) pad = 0;
		else if (gamepad_is_connected(4)) pad = 4;

		if (pad != -1) {
			if (gamepad_button_check_pressed(pad, gp_face1) || gamepad_button_check_pressed(pad, gp_shoulderrb)) {
				audio_play_sound(typewriterPush_snd, 1, false);
				switch (frame) {
					case 1:
					break;
					case 2:
						if (global.money >= 1350 && !global.dualBarettasUpgrade1) {
							audio_play_sound(buying_snd, 1, false);
							global.dualBarettasUpgrade1 = true;
							global.money -= 1350;
							frame = 0;
							used = true;
						}
					break;
					case 3:
						if (global.money >= 1920 && !global.dualBarettasUpgrade2 && global.dualBarettasUpgrade1) {
							audio_play_sound(buying_snd, 1, false);
							global.dualBarettasUpgrade2 = true;
							global.money -= 1920;
							frame = 0;
							used = true;
						}
					break;
					case 4:
						if (global.money >= 1850 && !global.shotgunUpgrade1) {
							audio_play_sound(buying_snd, 1, false);
							global.shotgunUpgrade1 = true;
							global.money -= 1850;
							frame = 0;
							used = true;
						}
					break;
					case 5:
						if (global.money >= 2430 && !global.shotgunUpgrade2 && global.shotgunUpgrade1) {
							audio_play_sound(buying_snd, 1, false);
							global.shotgunUpgrade2 = true;
							global.money -= 2430;
							frame = 0;
							used = true;
						}
					break;
					case 6:
						if (!global.cupyUpgrade1) {
							audio_play_sound(buying_snd, 1, false);
							global.cupyUpgrade1 = true;
							frame = 0;
							used = true;
						}
					break;
					case 7:
						if (global.money >= 3450 && !global.cupyUpgrade2 && global.cupyUpgrade1) {
							audio_play_sound(buying_snd, 1, false);
							global.cupyUpgrade2 = true;
							global.money -= 3450;
							frame = 0;
							used = true;
						}
					break;
					case 8:
						if (global.money >= 3400 && !global.silencedMPUpgrade1) {
							audio_play_sound(buying_snd, 1, false);
							global.silencedMPUpgrade1 = true;
							global.money -= 3400;
							frame = 0;
							used = true;
						}
					break;
					case 9:
						if (global.money >= 5000 && !global.silencedMPUpgrade2 && global.silencedMPUpgrade1) {
							audio_play_sound(buying_snd, 1, false);
							global.silencedMPUpgrade2 = true;
							global.money -= 5000;
							frame = 0;
							used = true;
						}
					break;
					case 10:
						if (global.money >= 4200 && !global.sniperUpgrade1) {
							audio_play_sound(buying_snd, 1, false);
							global.sniperUpgrade1 = true;
							global.money -= 4200;
							frame = 0;
							used = true;
						}
					break;
					case 11:
						if (global.money >= 5500 && !global.sniperUpgrade2 && global.sniperUpgrade1) {
							audio_play_sound(buying_snd, 1, false);
							global.sniperUpgrade2 = true;
							global.money -= 5500;
							frame = 0;
							used = true;
						}
					break;
				}
			}
		}
	}
}

if (instance_exists(upgradeMenu2_obj)) {
	if (upgradeMenu2_obj.inputMethod != 0) {
		var pad = -1;
		if (gamepad_is_connected(0)) pad = 0;
		else if (gamepad_is_connected(4)) pad = 4;

		if (pad != -1) {
			if (gamepad_button_check_pressed(pad, gp_face1) || gamepad_button_check_pressed(pad, gp_shoulderrb)) {
				audio_play_sound(typewriterPush_snd, 1, false);
				switch (frame) {
					case 1:
					break;
					case 2:
						if (global.money >= 1350 && !global.dualBarettasUpgrade1) {
							audio_play_sound(buying_snd, 1, false);
							global.dualBarettasUpgrade1 = true;
							global.money -= 1350;
							frame = 0;
							used = true;
						}
					break;
					case 3:
						if (global.money >= 1920 && !global.dualBarettasUpgrade2 && global.dualBarettasUpgrade1) {
							audio_play_sound(buying_snd, 1, false);
							global.dualBarettasUpgrade2 = true;
							global.money -= 1920;
							frame = 0;
							used = true;
						}
					break;
					case 4:
						if (global.money >= 1850 && !global.shotgunUpgrade1) {
							audio_play_sound(buying_snd, 1, false);
							global.shotgunUpgrade1 = true;
							global.money -= 1850;
							frame = 0;
							used = true;
						}
					break;
					case 5:
						if (global.money >= 2430 && !global.shotgunUpgrade2 && global.shotgunUpgrade1) {
							audio_play_sound(buying_snd, 1, false);
							global.shotgunUpgrade2 = true;
							global.money -= 2430;
							frame = 0;
							used = true;
						}
					break;
					case 6:
						if (!global.cupyUpgrade1) {
							audio_play_sound(buying_snd, 1, false);
							global.cupyUpgrade1 = true;
							frame = 0;
							used = true;
						}
					break;
					case 7:
						if (global.money >= 3450 && !global.cupyUpgrade2 && global.cupyUpgrade1) {
							audio_play_sound(buying_snd, 1, false);
							global.cupyUpgrade2 = true;
							global.money -= 3450;
							frame = 0;
							used = true;
						}
					break;
					case 8:
						if (global.money >= 3400 && !global.silencedMPUpgrade1) {
							audio_play_sound(buying_snd, 1, false);
							global.silencedMPUpgrade1 = true;
							global.money -= 3400;
							frame = 0;
							used = true;
						}
					break;
					case 9:
						if (global.money >= 5000 && !global.silencedMPUpgrade2 && global.silencedMPUpgrade1) {
							audio_play_sound(buying_snd, 1, false);
							global.silencedMPUpgrade2 = true;
							global.money -= 5000;
							frame = 0;
							used = true;
						}
					break;
					case 10:
						if (global.money >= 4200 && !global.sniperUpgrade1) {
							audio_play_sound(buying_snd, 1, false);
							global.sniperUpgrade1 = true;
							global.money -= 4200;
							frame = 0;
							used = true;
						}
					break;
					case 11:
						if (global.money >= 5500 && !global.sniperUpgrade2 && global.sniperUpgrade1) {
							audio_play_sound(buying_snd, 1, false);
							global.sniperUpgrade2 = true;
							global.money -= 5500;
							frame = 0;
							used = true;
						}
					break;
				}
			}
		}
	}
}
