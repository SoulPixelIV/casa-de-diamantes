/// @description Pickup

if (global.pistolMag < 90 || (global.pistolMag == 90 && global.unlockedWeapon[1] = true && global.unlockedWeapon[0] = false))
{
	if (global.unlockedWeapon[0] == false)
	{
		pickWeapon_scr(0);
	}
    global.pistolMag += 18;
	audio_play_sound(pickupSingle_snd, 1, false);
	reload_scr();
    instance_destroy();
}
