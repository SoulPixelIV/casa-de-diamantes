function pickWeapon_scr(argument0) {
	switch (argument0)
	{
		case 0:
			global.currentWeapon = gameManager_obj.pickedWeapon.pistol;	
			//global.pistolAmmo += 6 - global.pistolAmmo;
			global.unlockedWeapon[0] = true;
			break;
		case 1:
			global.currentWeapon = gameManager_obj.pickedWeapon.dualBarettas;		
			//global.dualBarettasAmmo += 8 - global.dualBarettasAmmo;
			global.unlockedWeapon[1] = true;
			break;
		case 2:
			global.currentWeapon = gameManager_obj.pickedWeapon.shotgun;
			//global.shotgunAmmo += 3 - global.shotgunAmmo;
			global.unlockedWeapon[2] = true;
			break;
	}
	player_obj.unarmed = false;
	audio_play_sound(pickup_snd, 1, false);


}
