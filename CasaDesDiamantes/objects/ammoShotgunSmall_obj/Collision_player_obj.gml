/// @description Pickup

if (global.shotgunAmmo <= global.shotgunAmmoMax - 1)
{
    global.shotgunAmmo += 1;
	audio_play_sound(pickupSingle_snd, 1, false);
    instance_destroy();
}
else if (global.shotgunAmmo > global.shotgunAmmoMax - 1)
{
	global.shotgunAmmo = global.shotgunAmmoMax;
	audio_play_sound(pickupSingle_snd, 1, false);
    instance_destroy();
}