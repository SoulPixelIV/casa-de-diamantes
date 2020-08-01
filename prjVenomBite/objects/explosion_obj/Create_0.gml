explosionDamage = 60;
dealtDamage = false;
lightSize = 4.4;
lightStrength = 0.92;
lifeLength = 24.4;

var expSnd = audio_play_sound(explosion_snd, 1, false);
audio_sound_pitch(expSnd, random_range(0.8, 1));