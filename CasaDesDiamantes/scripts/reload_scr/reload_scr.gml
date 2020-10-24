function reload_scr() {
	if (global.pistolMag >= 18 && global.pistolAmmo < 18)
	{
		global.pistolMag -= 18 - global.pistolAmmo;
		global.pistolAmmo += 18 - global.pistolAmmo;
	}	
	if (global.pistolMag < 18 && global.pistolAmmo < 18)
	{
		global.pistolAmmo += global.pistolMag;
		global.pistolMag = 0;
	}

	if (global.shotgunMag >= 6 && global.shotgunAmmo < 6)
	{
		global.shotgunMag -= 6 - global.shotgunAmmo;
		global.shotgunAmmo += 6 - global.shotgunAmmo;
	}
		
	if (global.shotgunMag < 6 && global.shotgunAmmo < 6)
	{
		global.shotgunAmmo += global.shotgunMag;
		global.shotgunMag = 0;
	}

	global.pistolReload = global.pistolReloadSave;
	global.dualBarettasReload = global.dualBarettasReloadSave;
	global.shotgunReload = global.shotgunReloadSave;
	player_obj.reloading = false;
	camera_obj.reloadFailed = false;

}
