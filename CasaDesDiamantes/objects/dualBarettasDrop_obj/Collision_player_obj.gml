/// @description Pickup

if (global.pistolAmmo < global.pistolAmmoMax || global.unlockedWeapon[1] = false)
{
	if (global.unlockedWeapon[1] == false)
	{
		pickWeapon_scr(1);
	}
	if (global.pistolAmmo <= global.pistolAmmoMax - 6)
	{
	    global.pistolAmmo += 6;
	}
	else if (global.pistolAmmo > global.pistolAmmoMax - 6)
	{
		global.pistolAmmo = global.pistolAmmoMax;
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
