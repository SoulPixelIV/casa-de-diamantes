/// @description Pickup

if (global.bowAmmo <= global.bowAmmoMax - 3)
{
    global.bowAmmo += 3;
	audio_play_sound(pickupSingle_snd, 1, false);
    instance_destroy();
}
else if (global.bowAmmo > global.bowAmmoMax - 3)
{
	global.bowAmmo = global.bowAmmoMax;
	audio_play_sound(pickupSingle_snd, 1, false);
    instance_destroy();
}