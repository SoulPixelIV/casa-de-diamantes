animationSpeed = 1;
teleportTimer = 1800;
flysnd = audio_play_sound(blimpFlying_snd, 1, false);

if (global.moveToWorld == 6) {
	audio_play_sound(impactGround_snd, 1, false);
}

