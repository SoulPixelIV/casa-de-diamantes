/// @description Pickup

if (global.sniperAmmo < global.sniperAmmoMax || global.unlockedWeapon[2] = false)
{
	if (global.unlockedWeapon[3] = false)
	{
		pickWeapon_scr(3);
	}
	if (global.sniperAmmo <= global.sniperAmmoMax - 2)
	{
	    global.sniperAmmo += 2;
	}
	else if (global.sniperAmmo > global.sniperAmmoMax - 2)
	{
		global.sniperAmmo = global.sniperAmmoMax;
	}
	audio_play_sound(pickupSingle_snd, 1, false);
    instance_destroy();
}