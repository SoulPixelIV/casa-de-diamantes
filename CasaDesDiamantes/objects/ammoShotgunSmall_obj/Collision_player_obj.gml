/// @description Pickup

if (global.shotgunMag < 35)
{
    global.shotgunMag += 1;
	audio_play_sound(pickupSingle_snd, 1, false);
    instance_destroy();
}
