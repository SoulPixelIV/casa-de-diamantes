/// @description Pickup

pickWeapon_scr(1);
if (global.pistolMag < 39)
{
    global.pistolMag += 8;
	audio_play_sound(pickupSingle_snd, 1, false);
	reload_scr();
    instance_destroy();
}
