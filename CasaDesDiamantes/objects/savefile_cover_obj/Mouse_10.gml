if (!global.drawWarningMenu && !global.drawStartMenu && !global.drawSkipMenu && !global.drawEraseMenu) {
	image_index = saveImageIndex + 8;
	open = true;

	audio_play_sound(typewriter_snd, 1, false);
}