/// @description Pickup

if (global.silencedMPAmmo <= global.silencedMPAmmoMax - 4)
{
    global.silencedMPAmmo += 4;
	audio_play_sound(pickupSingle_snd, 1, false);
    instance_destroy();
}
else if (global.silencedMPAmmo > global.silencedMPAmmoMax - 4)
{
	global.silencedMPAmmo = global.silencedMPAmmoMax;
	audio_play_sound(pickupSingle_snd, 1, false);
    instance_destroy();
}