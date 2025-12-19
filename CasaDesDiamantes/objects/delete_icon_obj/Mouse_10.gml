if (!global.drawWarningMenu && !global.drawStartMenu && !global.drawSkipMenu) {
	if ((file_exists("save1") && index == 0) || (file_exists("save2") && index == 1) || (file_exists("save3") && index == 2)) {
		image_index = 1;
		open = true;

		audio_play_sound(typewriter_snd, 1, false);
	}
}