/// @description Pickup

if (global.pistolMag < 39)
{
    global.pistolMag += 8;
	audio_play_sound(pickupSingle_snd, 1, false);
    instance_destroy();
}
