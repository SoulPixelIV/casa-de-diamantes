/// @description Pickup

if (global.shotgunAmmo < global.shotgunAmmoMax || global.unlockedWeapon[2] == false)
{
	if (global.unlockedWeapon[2] == false)
	{
		pickWeapon_scr(2);
	}
	if (global.shotgunAmmo <= global.shotgunAmmoMax - 2)
	{
	    global.shotgunAmmo += 2;
	}
	else if (global.shotgunAmmo > global.shotgunAmmoMax - 2)
	{
		global.shotgunAmmo = global.shotgunAmmoMax;
	}
	audio_play_sound(pickupSingle_snd, 1, false);
	
	global.vibrationDelay = 20;
	var pad = -1;
	if (gamepad_is_connected(0)) pad = 0;
	else if (gamepad_is_connected(4)) pad = 4;

	if (player_obj.inputMethod != 0) {
		if (pad != -1) {
			gamepad_set_vibration(pad, 0.7, 0.7);
		}
	}
	
    instance_destroy();
}