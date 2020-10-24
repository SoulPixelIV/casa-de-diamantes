function reload_scr() {
	if (global.pistolMag >= 8 && global.pistolAmmo < 8)
	{
		global.pistolMag -= 8 - global.pistolAmmo;
		global.pistolAmmo += 8 - global.pistolAmmo;
	}
	
	if (global.pistolMag < 8 && global.pistolAmmo < 8)
	{
		global.pistolAmmo += global.pistolMag;
		global.pistolMag = 0;
	}
	if (global.pistolMag >= 8 && global.pistolAmmo < 8)
	{
		global.pistolMag -= 8 - global.pistolAmmo;
		global.pistolAmmo += 8 - global.pistolAmmo;
	}
	
	if (global.pistolMag < 8 && global.pistolAmmo < 8)
	{
		global.pistolAmmo += global.pistolMag;
		global.pistolMag = 0;
	}
	if (global.shotgunMag >= 3 && global.shotgunAmmo < 3)
	{
		global.shotgunMag -= 3 - global.shotgunAmmo;
		global.shotgunAmmo += 3 - global.shotgunAmmo;
	}
		
	if (global.shotgunMag < 3 && global.shotgunAmmo < 3)
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
