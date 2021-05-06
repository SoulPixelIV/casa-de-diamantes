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
    instance_destroy();
}
