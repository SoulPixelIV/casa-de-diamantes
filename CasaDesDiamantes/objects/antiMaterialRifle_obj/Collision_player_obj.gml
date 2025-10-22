/// @description Pickup

if (global.bowAmmo < global.bowAmmoMax || global.unlockedWeapon[4] = false)
{
	if (global.unlockedWeapon[4] = false)
	{
		pickWeapon_scr(4);
	}
	if (global.bowAmmo <= global.bowAmmoMax - 3)
	{
	    global.bowAmmo += 3;
	}
	else if (global.bowAmmo > global.bowAmmoMax - 3)
	{
		global.bowAmmo = global.bowAmmoMax;
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