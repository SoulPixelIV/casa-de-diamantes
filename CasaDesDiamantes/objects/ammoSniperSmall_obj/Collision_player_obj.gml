/// @description Pickup

if (global.bowAmmo <= global.bowAmmoMax - 1)
{
    global.bowAmmo += 1;
	audio_play_sound(pickupSingle_snd, 1, false);
    instance_destroy();
}
else if (global.bowAmmo > global.bowAmmoMax - 1)
{
	global.bowAmmo = global.bowAmmoMax;
	audio_play_sound(pickupSingle_snd, 1, false);
    instance_destroy();
}