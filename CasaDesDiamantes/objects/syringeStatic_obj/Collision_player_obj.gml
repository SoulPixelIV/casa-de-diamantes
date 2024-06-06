/// @description Pickup

if (global.syringes < 5)
{
	audio_play_sound(coin3_snd, 1, false);
	global.syringes++;
	instance_destroy();
}
