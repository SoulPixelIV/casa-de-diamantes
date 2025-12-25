global.drawWarningMenu = false;

drawStartMenu = false;
drawSkipMenu = false;

pushDelay = 50;
pushDelaySave = pushDelay;

image_speed = 0;
saveImageIndex = 0;
open = false;

startMenuElement = 1;
cursorImage = 0;

buttonBuffer = 120;
buttonBuffer2 = 120;
buttonBufferStart = false;
buttonBufferStart2 = false;
buttonBufferSave = buttonBuffer;
buttonBufferSave2 = buttonBuffer2;

if (index == 0) {
	if (file_exists("save1")) {
		ini_open("save1");
	
		var rm_name = ini_read_string("save1", "room", "level0");
	
		// erzwinge string
		rm_name = string(rm_name);
	
		// Jetzt den Raum holen
		var rm_index = asset_get_index(rm_name);
	
		// wenn ungültig → fallback
		if (rm_index < 0 || !room_exists(rm_index)) {
			image_index = 0;
		} else {
			if (file_exists("save1")) {
				if (rm_index == level_Basement || rm_index == level_Casino || rm_index == level_CasinoRoof || rm_index == level_DiningHall || rm_index == level_TristramRoom) {
					image_index = 1;
					saveImageIndex = 1;
				}
				if (rm_index == level0 || rm_index == level1 || rm_index == level2 || rm_index == level3) {
					image_index = 2;
					saveImageIndex = 2;
				}
				if (rm_index == level4 || rm_index == level5A || rm_index == level5B || rm_index == level6 || rm_index == level7 || rm_index == level8 || rm_index == level9 || rm_index == warpzone1) {
					image_index = 3;
					saveImageIndex = 3;
				}
				if (rm_index == level10 || rm_index == level11 || rm_index == level12 || rm_index == level13 || rm_index == level14 || rm_index == warpzone2) {
					image_index = 4;
					saveImageIndex = 4;
				}
				if (rm_index == level15 || rm_index == level16 || rm_index == level17 || rm_index == level18 || rm_index == level19 || rm_index == warpzone3) {
					image_index = 5;
					saveImageIndex = 5;
				}
				if (rm_index == level20 || rm_index == level21 || rm_index == level22 || rm_index == level23 || rm_index == level24) {
					image_index = 6;
					saveImageIndex = 6;
				}
				if (rm_index == level25 || rm_index == level26 || rm_index == level27 || rm_index == level28 || rm_index == level_ConsumedCasino || rm_index == level_BasementConsumed) {
					image_index = 7;
					saveImageIndex = 7;
				}
			} else {
				image_index = 0;
			}
		}
								
		ini_close();
	} else {
		image_index = 0;
	}
}

if (index == 1) {
	if (file_exists("save2")) {
		ini_open("save2");
	
		var rm_name = ini_read_string("save2", "room", "level0");
	
		// erzwinge string
		rm_name = string(rm_name);
	
		// Jetzt den Raum holen
		var rm_index = asset_get_index(rm_name);
	
		// wenn ungültig → fallback
		if (rm_index < 0 || !room_exists(rm_index)) {
			image_index = 0;
		} else {
			if (file_exists("save2")) {
				if (rm_index == level_Basement || rm_index == level_Casino || rm_index == level_CasinoRoof || rm_index == level_DiningHall || rm_index == level_TristramRoom) {
					image_index = 1;
					saveImageIndex = 1;
				}
				if (rm_index == level0 || rm_index == level1 || rm_index == level2 || rm_index == level3) {
					image_index = 2;
					saveImageIndex = 2;
				}
				if (rm_index == level4 || rm_index == level5A || rm_index == level5B || rm_index == level6 || rm_index == level7 || rm_index == level8 || rm_index == level9 || rm_index == warpzone1) {
					image_index = 3;
					saveImageIndex = 3;
				}
				if (rm_index == level10 || rm_index == level11 || rm_index == level12 || rm_index == level13 || rm_index == level14 || rm_index == warpzone2) {
					image_index = 4;
					saveImageIndex = 4;
				}
				if (rm_index == level15 || rm_index == level16 || rm_index == level17 || rm_index == level18 || rm_index == level19 || rm_index == warpzone3) {
					image_index = 5;
					saveImageIndex = 5;
				}
				if (rm_index == level20 || rm_index == level21 || rm_index == level22 || rm_index == level23 || rm_index == level24) {
					image_index = 6;
					saveImageIndex = 6;
				}
				if (rm_index == level25 || rm_index == level26 || rm_index == level27 || rm_index == level28 || rm_index == level_ConsumedCasino || rm_index == level_BasementConsumed) {
					image_index = 7;
					saveImageIndex = 7;
				}
			} else {
				image_index = 0;
			}
		}
								
		ini_close();
	} else {
		image_index = 0;
	}
}

if (index == 2) {
	if (file_exists("save3")) {
		ini_open("save3");
	
		var rm_name = ini_read_string("save3", "room", "level0");
	
		// erzwinge string
		rm_name = string(rm_name);
	
		// Jetzt den Raum holen
		var rm_index = asset_get_index(rm_name);
	
		// wenn ungültig → fallback
		if (rm_index < 0 || !room_exists(rm_index)) {
			image_index = 0;
		} else {
			if (file_exists("save3")) {
				if (rm_index == level_Basement || rm_index == level_Casino || rm_index == level_CasinoRoof || rm_index == level_DiningHall || rm_index == level_TristramRoom) {
					image_index = 1;
					saveImageIndex = 1;
				}
				if (rm_index == level0 || rm_index == level1 || rm_index == level2 || rm_index == level3) {
					image_index = 2;
					saveImageIndex = 2;
				}
				if (rm_index == level4 || rm_index == level5A || rm_index == level5B || rm_index == level6 || rm_index == level7 || rm_index == level8 || rm_index == level9 || rm_index == warpzone1) {
					image_index = 3;
					saveImageIndex = 3;
				}
				if (rm_index == level10 || rm_index == level11 || rm_index == level12 || rm_index == level13 || rm_index == level14 || rm_index == warpzone2) {
					image_index = 4;
					saveImageIndex = 4;
				}
				if (rm_index == level15 || rm_index == level16 || rm_index == level17 || rm_index == level18 || rm_index == level19 || rm_index == warpzone3) {
					image_index = 5;
					saveImageIndex = 5;
				}
				if (rm_index == level20 || rm_index == level21 || rm_index == level22 || rm_index == level23 || rm_index == level24) {
					image_index = 6;
					saveImageIndex = 6;
				}
				if (rm_index == level25 || rm_index == level26 || rm_index == level27 || rm_index == level28 || rm_index == level_ConsumedCasino || rm_index == level_BasementConsumed) {
					image_index = 7;
					saveImageIndex = 7;
				}
			} else {
				image_index = 0;
			}
		}
								
		ini_close();
	} else {
		image_index = 0;
	}
}