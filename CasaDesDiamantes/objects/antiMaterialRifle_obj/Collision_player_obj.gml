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
    instance_destroy();
}