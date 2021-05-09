/// @description Pickup

if (global.sniperAmmo <= global.sniperAmmoMax - 3)
{
    global.sniperAmmo += 3;
	audio_play_sound(pickupSingle_snd, 1, false);
    instance_destroy();
}
else if (global.sniperAmmo > global.sniperAmmoMax - 3)
{
	global.sniperAmmo = global.sniperAmmoMax;
	audio_play_sound(pickupSingle_snd, 1, false);
    instance_destroy();
}