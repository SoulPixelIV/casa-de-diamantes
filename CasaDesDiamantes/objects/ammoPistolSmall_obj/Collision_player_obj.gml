/// @description Pickup

if (global.pistolMag < 106)
{
    global.pistolMag += 2;
	audio_play_sound(pickupSingle_snd, 1, false);
    instance_destroy();
}
