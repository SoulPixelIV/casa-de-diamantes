/// @description Pickup

if (global.shotgunMag < 30)
{
    global.shotgunMag += 6;
	audio_play_sound(pickupSingle_snd, 1, false);
    instance_destroy();
}

