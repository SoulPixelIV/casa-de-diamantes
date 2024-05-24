/// @description Pickup

if (global.silencedMPAmmo <= global.silencedMPAmmoMax - 3)
{
    global.silencedMPAmmo += 3;
	audio_play_sound(pickupSingle_snd, 1, false);
    instance_destroy();
}
else if (global.silencedMPAmmo > global.silencedMPAmmoMax - 3)
{
	global.silencedMPAmmo = global.silencedMPAmmoMax;
	audio_play_sound(pickupSingle_snd, 1, false);
    instance_destroy();
}