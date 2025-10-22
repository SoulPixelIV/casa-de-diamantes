/// @description Pickup

if (global.shotgunAmmo <= global.shotgunAmmoMax - 1)
{
    global.shotgunAmmo += 1;
	audio_play_sound(pickupSingle_snd, 1, false);
	
	global.vibrationDelay = 10;
	var pad = -1;
	if (gamepad_is_connected(0)) pad = 0;
	else if (gamepad_is_connected(4)) pad = 4;

	if (player_obj.inputMethod != 0) {
		if (pad != -1) {
			gamepad_set_vibration(pad, 0.5, 0.5);
		}
	}
	
    instance_destroy();
}
else if (global.shotgunAmmo > global.shotgunAmmoMax - 1)
{
	global.shotgunAmmo = global.shotgunAmmoMax;
	audio_play_sound(pickupSingle_snd, 1, false);
	
	global.vibrationDelay = 10;
	var pad = -1;
	if (gamepad_is_connected(0)) pad = 0;
	else if (gamepad_is_connected(4)) pad = 4;

	if (player_obj.inputMethod != 0) {
		if (pad != -1) {
			gamepad_set_vibration(pad, 0.5, 0.5);
		}
	}
	
    instance_destroy();
}