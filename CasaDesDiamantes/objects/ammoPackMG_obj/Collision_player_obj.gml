/// @description Pickup

if (global.silencedMPAmmo != global.silencedMPAmmoMax)
{
	if (global.silencedMPAmmo <= global.silencedMPAmmoMax - 9)
	{
	    global.silencedMPAmmo += 9;
		audio_play_sound(pickupSingle_snd, 1, false);
	    instance_destroy();
	}
	else if (global.silencedMPAmmo > global.silencedMPAmmoMax - 9)
	{
		global.silencedMPAmmo = global.silencedMPAmmo;
		audio_play_sound(pickupSingle_snd, 1, false);
	    instance_destroy();
	}
}