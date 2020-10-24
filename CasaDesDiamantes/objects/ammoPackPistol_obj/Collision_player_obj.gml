/// @description Pickup

if (global.pistolMag < 90)
{
    global.pistolMag += 18;
	audio_play_sound(pickupSingle_snd, 1, false);
    instance_destroy();
}
