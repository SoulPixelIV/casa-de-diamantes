/// @description Pickup

if (global.shotgunMag < 11)
{
    global.shotgunMag += 4;
	audio_play_sound(pickupSingle_snd, 1, false);
    instance_destroy();
}
