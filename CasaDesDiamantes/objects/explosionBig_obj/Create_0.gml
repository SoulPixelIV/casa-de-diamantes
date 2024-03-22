damage = 76; // 66
damageToEnemies = true;
knockback = 3.5;
dealtDamage = false;
animationSpeed = 1;
lifeLength = 70;

nearestEnemies = [];

//Create light
light = instance_create_layer(x, y, "GraphicsLayer", spotlightYellowIntense_obj);

//Create Emitter
emitter = audio_emitter_create();
audio_max_distance = 900;
audio_drop_start = 300;

audio_falloff_set_model(audio_falloff_linear_distance);
audio_emitter_position(emitter, x, y, 0);
audio_emitter_falloff(emitter, audio_drop_start, audio_max_distance, 1);

var expSnd = audio_play_sound_on(emitter, explosion_snd, false, 1);
audio_sound_pitch(expSnd, random_range(0.8, 1));

screenshake(60, 25, 0.6, id);

alarm[0] = 1;

//Bigger Explosion Size for Enemies
if (!dealtDamage && damageToEnemies) {
	numEnemies = instance_number(enemy_obj);
	for (i = 0; i < numEnemies; i++) {
		currEnemy = instance_find(enemy_obj, i);
		if (distance_to_object(currEnemy) < 100) {
			currEnemy.hp -= damage * 5;
		}
	}
}