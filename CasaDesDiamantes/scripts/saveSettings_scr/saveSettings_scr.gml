function saveSettings_scr(){
	ini_open("gameSettings");
	
	ini_write_real("gameSettings", "soundVol", global.soundVolume);
	ini_write_real("gameSettings", "musicVol", global.musicVolume);
	ini_write_real("gameSettings", "targetFramerate", globalSettings_obj.TARGET_FRAMERATE);
	ini_write_real("gameSettings", "vsync", global.vsync);
	ini_write_real("gameSettings", "speedrunTimer", global.speedrunTimer);
	ini_write_real("gameSettings", "fullscreen", global.fullscreen);
	
	ini_close();
}