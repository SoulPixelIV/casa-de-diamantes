drawStartMenu = false;
drawSkipMenu = false;

pushDelay = 50;
pushDelaySave = pushDelay;

image_speed = 0;
saveImageIndex = 0;
open = false;

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