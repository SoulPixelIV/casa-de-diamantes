/// @description Pickup

pickWeapon_scr(2);
if (global.shotgunMag < 11)
{
    global.shotgunMag += 4;
	audio_play_sound(pickupSingle_snd, 1, false);
	reload_scr();
    instance_destroy();
}