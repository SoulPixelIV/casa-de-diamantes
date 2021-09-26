/// @description Changing Values

//Audio Pitch
audio_sound_pitch(pistolShot_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(dualBarettasShot_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(shotgunShot_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(shotgunPump_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(sniperShot_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(sniperShotLoad_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(bulletHit_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(bulletHitGround_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(bucketHit_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(bulletHitHeadshot_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(bucketBroken_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(chaingunLocked_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(deathCross_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(explosion_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(coin1_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(coin2_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(coin3_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(coinbarSpin_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(coinbarStop_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(jetpack_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(pickup_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(pickupSingle_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(chaingunLocked_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(drill_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(explosion_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(explosionTiny_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(lever_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(tick_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(beep_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(flamethrowerStart_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(flamethrower_snd, clamp(1 * global.timeScale, 0.5, 1.5));

audio_sound_pitch(infectedVoice_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(plagueInfectionVoice_snd, clamp(1 * global.timeScale, 0.5, 1.5));

audio_sound_pitch(walk1_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(glitter_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(climb1_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(climb2_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(climb3_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(climb4_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(glitterLong_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(walk2_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(jump_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(land_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(slide_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(moan1_snd, clamp(1 * global.timeScale, 0.5, 1.5));
audio_sound_pitch(moan2_snd, clamp(1 * global.timeScale, 0.5, 1.5));

//Timer
if (room == infiniteSpawn)
{
	global.timer += global.dt / 185;
}

