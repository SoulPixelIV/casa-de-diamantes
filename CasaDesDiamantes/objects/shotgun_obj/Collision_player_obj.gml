/// @description Pickup

if (global.shotgunMag < 30)
{
	pickWeapon_scr(2);
    global.shotgunMag += 6;
	audio_play_sound(pickupSingle_snd, 1, false);
	reload_scr();
    instance_destroy();
}