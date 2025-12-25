if (!global.drawWarningMenu && !global.drawStartMenu && !global.drawSkipMenu && !global.drawEraseMenu) {
	pushDelay = pushDelaySave;
	
	if (open) {
		if (gamepad_button_check_pressed(0, gp_face1) || gamepad_button_check_pressed(4, gp_face1)) {
			if (index == 0) {
				global.currentSaveFile = 0;
					
				if (file_exists("save1")) {
					ini_open("save1");
	
					var rm_name = ini_read_string("save1", "room", "level0");
	
					// erzwinge string
					rm_name = string(rm_name);
	
					// Jetzt den Raum holen
					var rm_index = asset_get_index(rm_name);
	
					// wenn ungültig → fallback
					if (rm_index < 0 || !room_exists(rm_index)) {
						global.drawWarningMenu = true;
					} else {
						if (file_exists("save1")) {
							if (global.roomTeleportWish == noone) {
								global.drawWarningMenu = false;
								global.drawStartMenu = false;
								global.drawSkipMenu = false;
								global.drawEraseMenu = false;
								global.roomTeleportWish = noone;
								load_scr();
							} else {
								room_goto(global.roomTeleportWish);
								global.drawWarningMenu = false;
								global.drawStartMenu = false;
								global.drawSkipMenu = false;
								global.drawEraseMenu = false;
								global.roomTeleportWish = noone;
								loadNoRoom_scr();
								global.lastCheckpoint = noone;
							}					
						} else {
							global.drawWarningMenu = true;
						}
					}
								
					ini_close();
				} else {
					global.drawStartMenu = true;
				}
			}

			if (index == 1) {
				global.currentSaveFile = 1;
					
				if (file_exists("save2")) {
					ini_open("save2");
	
					var rm_name = ini_read_string("save2", "room", "level0");
	
					// erzwinge string
					rm_name = string(rm_name);
	
					// Jetzt den Raum holen
					var rm_index = asset_get_index(rm_name);
	
					// wenn ungültig → fallback
					if (rm_index < 0 || !room_exists(rm_index)) {
						global.drawWarningMenu = true;
					} else {
						if (file_exists("save2")) {
							if (global.roomTeleportWish == noone) {
								global.drawWarningMenu = false;
								global.drawStartMenu = false;
								global.drawSkipMenu = false;
								global.drawEraseMenu = false;
								global.roomTeleportWish = noone;
								load_scr();
							} else {
								room_goto(global.roomTeleportWish);
								global.drawWarningMenu = false;
								global.drawStartMenu = false;
								global.drawSkipMenu = false;
								global.drawEraseMenu = false;
								global.roomTeleportWish = noone;
								loadNoRoom_scr();
								global.lastCheckpoint = noone;
							}		
						} else {
							global.drawWarningMenu = true;
						}
					}
								
					ini_close();
				} else {
					global.drawStartMenu = true;
				}
			}

			if (index == 2) {
				global.currentSaveFile = 2;
					
				if (file_exists("save3")) {
					ini_open("save3");
	
					var rm_name = ini_read_string("save3", "room", "level0");
	
					// erzwinge string
					rm_name = string(rm_name);
	
					// Jetzt den Raum holen
					var rm_index = asset_get_index(rm_name);
	
					// wenn ungültig → fallback
					if (rm_index < 0 || !room_exists(rm_index)) {
						global.drawWarningMenu = true;
					} else {
						if (file_exists("save3")) {
							if (global.roomTeleportWish == noone) {
								global.drawWarningMenu = false;
								global.drawStartMenu = false;
								global.drawSkipMenu = false;
								global.drawEraseMenu = false;
								global.roomTeleportWish = noone;
								load_scr();
							} else {
								room_goto(global.roomTeleportWish);
								global.drawWarningMenu = false;
								global.drawStartMenu = false;
								global.drawSkipMenu = false;
								global.drawEraseMenu = false;
								global.roomTeleportWish = noone;
								loadNoRoom_scr();
								global.lastCheckpoint = noone;
							}		
						} else {
							global.drawWarningMenu = true;
						}
					}
								
					ini_close();
				} else {
					global.drawStartMenu = true;
				}
			}
		}
	}
}

pushDelay -= global.dt;

if (global.drawWarningMenu) {
	if (pushDelay < 0) {
		if (gamepad_button_check_pressed(0, gp_face1) || mouse_check_button_pressed(mb_left) || gamepad_button_check_pressed(4, gp_face1) || keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space)) {
			global.roomTeleportWish = noone;
			global.drawWarningMenu = false;
			room_goto(mainmenu);
		}
	}
}
