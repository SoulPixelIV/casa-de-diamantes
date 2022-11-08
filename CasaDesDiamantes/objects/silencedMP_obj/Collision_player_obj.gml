/// @description Pickup

if (global.silencedMPAmmo < global.silencedMPAmmoMax || global.unlockedWeapon[3] = false)
{
	if (global.unlockedWeapon[3] == false)
	{
		pickWeapon_scr(3);
	}
	if (global.silencedMPAmmo <= global.silencedMPAmmoMax - 8)
	{
	    global.silencedMPAmmo += 8;
	}
	else if (global.silencedMPAmmo > global.silencedMPAmmoMax - 8)
	{
		global.silencedMPAmmo = global.silencedMPAmmoMax;
	}
	audio_play_sound(pickupSingle_snd, 1, false);
    instance_destroy();
}