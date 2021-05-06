/// @description Pickup

if (global.shotgunAmmo <= global.shotgunAmmoMax - 2)
{
    global.shotgunAmmo += 2;
	audio_play_sound(pickupSingle_snd, 1, false);
    instance_destroy();
}
else if (global.shotgunAmmo > global.shotgunAmmoMax - 2)
{
	global.shotgunAmmo = global.shotgunAmmoMax;
	audio_play_sound(pickupSingle_snd, 1, false);
    instance_destroy();
}

