function pickWeapon_scr(argument0) {
	
	if (argument0 == 0 && global.currentWeapon != gameManager_obj.pickedWeapon.pistol || argument0 == 1 && global.currentWeapon != gameManager_obj.pickedWeapon.dualBarettas || argument0 == 2 && global.currentWeapon != gameManager_obj.pickedWeapon.shotgun || argument0 == 3 && global.currentWeapon != gameManager_obj.pickedWeapon.sniper)
	{
		audio_play_sound(pickup_snd, 1, false);
	}
	
	switch (argument0)
	{
		case 0:
			global.currentWeapon = gameManager_obj.pickedWeapon.pistol;	
			global.unlockedWeapon[0] = true;
			break;
		case 1:
			global.currentWeapon = gameManager_obj.pickedWeapon.dualBarettas;		
			global.unlockedWeapon[1] = true;
			break;
		case 2:
			global.currentWeapon = gameManager_obj.pickedWeapon.shotgun;
			global.unlockedWeapon[2] = true;
			break;
		case 3:
			global.currentWeapon = gameManager_obj.pickedWeapon.sniper;
			global.unlockedWeapon[3] = true;
			break;
		case 4:
			global.currentWeapon = gameManager_obj.pickedWeapon.bow;
			global.unlockedWeapon[4] = true;
			break;
	}
	player_obj.unarmed = false;
	player_obj.slowmo = false;
	camera_obj.newWeapon = true;
	camera_obj.newWeaponTimer = camera_obj.newWeaponTimerSave;
}
