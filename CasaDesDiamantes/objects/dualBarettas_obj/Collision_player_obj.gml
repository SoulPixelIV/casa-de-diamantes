/// @description Pickup

if (global.pistolMag < 90 || (global.pistolMag == 90 && global.unlockedWeapon[0] = true && global.unlockedWeapon[1] = false))
{
	pickWeapon_scr(1);
    global.pistolMag += 18;
	audio_play_sound(pickupSingle_snd, 1, false);
	reload_scr();
    instance_destroy();
}
