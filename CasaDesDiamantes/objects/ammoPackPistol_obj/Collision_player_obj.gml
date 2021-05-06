/// @description Pickup

if (global.pistolAmmo <= global.pistolAmmoMax - 6)
{
    global.pistolAmmo += 6;
	audio_play_sound(pickupSingle_snd, 1, false);
    instance_destroy();
}
else if (global.pistolAmmo > global.pistolAmmoMax - 6)
{
	global.pistolAmmo = global.pistolAmmoMax;
	audio_play_sound(pickupSingle_snd, 1, false);
    instance_destroy();
}
