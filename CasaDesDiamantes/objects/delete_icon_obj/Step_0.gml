if (!global.drawWarningMenu && !global.drawStartMenu && !global.drawSkipMenu && !global.drawEraseMenu) {
	pushDelay = pushDelaySave;
	
	if (open) {
		if (gamepad_button_check_pressed(0, gp_face1) || gamepad_button_check_pressed(4, gp_face1)) {
			if (index == 0) {
				global.currentSaveFile = 0;
					
				if (file_exists("save1")) {
					global.drawEraseMenu = true;
				}
			}

			if (index == 1) {
				global.currentSaveFile = 1;
					
				if (file_exists("save2")) {
					global.drawEraseMenu = true;
				}
			}

			if (index == 2) {
				global.currentSaveFile = 2;
					
				if (file_exists("save3")) {
					global.drawEraseMenu = true;
				}
			}
		}
	}
}

pushDelay -= global.dt;

if (global.drawWarningMenu) {
	if (pushDelay < 0) {
		if (gamepad_button_check_pressed(0, gp_face1) || mouse_check_button_pressed(mb_left) || gamepad_button_check_pressed(4, gp_face1) || keyboard_check_pressed(vk_enter)) {
			room_goto(mainmenu);
		}
	}
}