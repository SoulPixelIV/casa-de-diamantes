/// @description Pickup

if (global.silencedMPAmmo != global.silencedMPAmmoMax)
{
	if (global.silencedMPAmmo <= global.silencedMPAmmoMax - 16)
	{
	    global.silencedMPAmmo += 16;
		audio_play_sound(pickupSingle_snd, 1, false);
	    instance_destroy();
	}
	else if (global.silencedMPAmmo > global.silencedMPAmmoMax - 16)
	{
		global.silencedMPAmmo = global.silencedMPAmmoMax;
		audio_play_sound(pickupSingle_snd, 1, false);
	    instance_destroy();
	}
}