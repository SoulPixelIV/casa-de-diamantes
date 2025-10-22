/// @description Pickup

if (global.silencedMPAmmo < global.silencedMPAmmoMax || global.unlockedWeapon[3] = false)
{
	if (global.unlockedWeapon[3] == false)
	{
		pickWeapon_scr(3);
	}
	if (global.silencedMPAmmo <= global.silencedMPAmmoMax - 16)
	{
	    global.silencedMPAmmo += 16;
	}
	else if (global.silencedMPAmmo > global.silencedMPAmmoMax - 16)
	{
		global.silencedMPAmmo = global.silencedMPAmmoMax;
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