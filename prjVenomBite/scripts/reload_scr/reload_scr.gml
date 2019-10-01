if (global.pickedWeapon[0])
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
if (global.pickedWeapon[1])
{
	if (global.dualBarettasMag >= 12 && global.dualBarettasAmmo < 12)
	{
		global.dualBarettasMag -= 12 - global.dualBarettasAmmo;
		global.dualBarettasAmmo += 12 - global.dualBarettasAmmo;
	}
	
	if (global.dualBarettasMag < 12 && global.dualBarettasAmmo < 12)
	{
		global.dualBarettasAmmo += global.dualBarettasMag;
		global.dualBarettasMag = 0;
	}
}
if (global.pickedWeapon[2])
{
	if (global.shotgunMag >= 2 && global.shotgunAmmo < 2)
	{
		global.shotgunMag -= 2 - global.shotgunAmmo;
		global.shotgunAmmo += 2 - global.shotgunAmmo;
	}
	
	if (global.shotgunMag < 2 && global.shotgunAmmo < 2)
	{
		global.shotgunAmmo += global.shotgunMag;
		global.shotgunMag = 0;
	}
}