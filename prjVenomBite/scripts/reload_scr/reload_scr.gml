if (global.currentWeapon == gameManager_obj.pickedWeapon.pistol)
{
	if (global.pistolMag >= 6 && global.pistolAmmo < 6)
	{
		global.pistolMag -= 6 - global.pistolAmmo;
		global.pistolAmmo += 6 - global.pistolAmmo;
	}
	
	if (global.pistolMag < 6 && global.pistolAmmo < 6)
	{
		global.pistolAmmo += global.pistolMag;
		global.pistolMag = 0;
	}
}
if (global.currentWeapon == gameManager_obj.pickedWeapon.dualBarettas)
{
	if (global.dualBarettasMag >= 8 && global.dualBarettasAmmo < 8)
	{
		global.dualBarettasMag -= 8 - global.dualBarettasAmmo;
		global.dualBarettasAmmo += 8 - global.dualBarettasAmmo;
	}
	
	if (global.dualBarettasMag < 8 && global.dualBarettasAmmo < 8)
	{
		global.dualBarettasAmmo += global.dualBarettasMag;
		global.dualBarettasMag = 0;
	}
}
if (global.currentWeapon == gameManager_obj.pickedWeapon.shotgun)
{
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
}

global.pistolReload = global.pistolReloadSave;
global.dualBarettasReload = global.dualBarettasReloadSave;
global.shotgunReload = global.shotgunReloadSave;
player_obj.reloading = false;