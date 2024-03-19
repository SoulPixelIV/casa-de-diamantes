if (global.bulletDelay < 0) {
	audio_play_sound(bulletHitGround_snd, 1, false);
	global.bulletDelay = global.bulletDelaySave;
}
instance_change(bulletHit_obj, true);
