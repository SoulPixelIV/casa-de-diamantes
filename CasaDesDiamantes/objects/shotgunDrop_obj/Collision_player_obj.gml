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
    instance_destroy();
}