pushDelay = pushDelaySave;

if (!global.drawWarningMenu && !global.drawStartMenu && !global.drawSkipMenu && !global.drawEraseMenu) {
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
						load_scr();
					} else {
						room_goto(global.roomTeleportWish);
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
						load_scr();
					} else {
						room_goto(global.roomTeleportWish);
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
						load_scr();
					} else {
						room_goto(global.roomTeleportWish);
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