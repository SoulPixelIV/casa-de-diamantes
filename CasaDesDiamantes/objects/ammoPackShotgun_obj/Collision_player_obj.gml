/// @description Pickup

if (global.shotgunAmmo != global.shotgunAmmoMax)
{
	if (global.shotgunAmmo <= global.shotgunAmmoMax - 3)
	{
	    global.shotgunAmmo += 3;
		audio_play_sound(pickupSingle_snd, 1, false);
	    instance_destroy();
	}
	else if (global.shotgunAmmo > global.shotgunAmmoMax - 3)
	{
		global.shotgunAmmo = global.shotgunAmmoMax;
		audio_play_sound(pickupSingle_snd, 1, false);
	    instance_destroy();
	}
	
	global.vibrationDelay = 20;
	var pad = -1;
	if (gamepad_is_connected(0)) pad = 0;
	else if (gamepad_is_connected(4)) pad = 4;

	if (player_obj.inputMethod != 0) {
		if (pad != -1) {
			gamepad_set_vibration(pad, 0.7, 0.7);
		}
	}
}