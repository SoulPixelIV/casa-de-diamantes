function loadSettings_scr(){
	ini_open("gameSettings");

	global.soundVolume = ini_read_real("gameSettings", "soundVol", 100);
	global.musicVolume = ini_read_real("gameSettings", "musicVol", 100);
	globalSettings_obj.TARGET_FRAMERATE = ini_read_real("gameSettings", "targetFramerate", 60);
	global.speedrunTimer = ini_read_real("gameSettings", "speedrunTimer", 0);
		
	ini_close();
}