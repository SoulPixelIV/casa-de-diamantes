/// @description Score

dt = (delta_time / 1000000) * globalSettings_obj.TARGET_FRAMERATE;

if (multiplierRun)
{
	global.multiplierTimer -= dt;
}
else
{
	global.multiplierTimer = 300;
}

if (global.multiplierTimer < 0)
{
	global.multiplier = 1;
	multiplierRun = false;
}

//Level lighting

if (room_get_name(room) == "level0_RoadToCasino")
{
	//global.levelLighting = 1.5;
}

//Audio Pitch
audio_sound_pitch(pistolShot_snd, 1 * global.timeScale);
audio_sound_pitch(dualBarettasShot_snd, 1 * global.timeScale);
audio_sound_pitch(shotgunShot_snd, 1 * global.timeScale);
audio_sound_pitch(bulletHit_snd, 1 * global.timeScale);
audio_sound_pitch(bulletHitGround_snd, 1 * global.timeScale);
audio_sound_pitch(bucketHit_snd, 1 * global.timeScale);
audio_sound_pitch(bulletHitHeadshot_snd, 1 * global.timeScale);
audio_sound_pitch(bucketBroken_snd, 1 * global.timeScale);
audio_sound_pitch(chaingunLocked_snd, 1 * global.timeScale);
audio_sound_pitch(deathCross_snd, 1 * global.timeScale);

audio_sound_pitch(infectedVoice_snd, 1 * global.timeScale);
audio_sound_pitch(plagueInfectionVoice_snd, 1 * global.timeScale);

audio_sound_pitch(walk1_snd, 1 * global.timeScale);
audio_sound_pitch(walk2_snd, 1 * global.timeScale);
audio_sound_pitch(jump_snd, 1 * global.timeScale);
audio_sound_pitch(land_snd, 1 * global.timeScale);
audio_sound_pitch(moan1_snd, 1 * global.timeScale);
audio_sound_pitch(moan2_snd, 1 * global.timeScale);


