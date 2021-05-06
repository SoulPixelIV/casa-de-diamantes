/// @description Pickup

if (global.pistolAmmo <= global.pistolAmmoMax - 1)
{
    global.pistolAmmo += 1;
	audio_play_sound(pickupSingle_snd, 1, false);
    instance_destroy();
}
else if (global.pistolAmmo > global.pistolAmmoMax - 1)
{
	global.pistolAmmo = global.pistolAmmoMax;
	audio_play_sound(pickupSingle_snd, 1, false);
    instance_destroy();
}
