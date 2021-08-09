function removeAllWeapons_scr(){
	global.pistolAmmo = 0;
	global.shotgunAmmo = 0;
	global.sniperAmmo = 0;
	
	global.currentWeapon = pickedWeapon.unarmed;

	global.unlockedWeapon[0] = false;
	global.unlockedWeapon[1] = false;
	global.unlockedWeapon[2] = false;
	global.unlockedWeapon[3] = false;
}