pushDelay = pushDelaySave;

if (!global.drawWarningMenu && !global.drawStartMenu && !global.drawSkipMenu && !global.drawEraseMenu) {
	pushDelay = pushDelaySave;
	
	if (open) {
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