/// @description Pickup

if (global.unlockedWeapon[1] == false)
{
	pickWeapon_scr(0);
}
audio_play_sound(pickupSingle_snd, 1, false);
instance_destroy();

