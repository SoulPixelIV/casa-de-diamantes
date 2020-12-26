/// @description Pickup

if (global.shotgunMag < 30 || global.unlockedWeapon[2] = false)
{
	if (global.unlockedWeapon[2] = false)
	{
		pickWeapon_scr(2);
	}
	if (global.shotgunMag < 30)
	{
		global.shotgunMag += 6;
	}
	audio_play_sound(pickupSingle_snd, 1, false);
	reload_scr();
    instance_destroy();
}