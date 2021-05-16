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
}