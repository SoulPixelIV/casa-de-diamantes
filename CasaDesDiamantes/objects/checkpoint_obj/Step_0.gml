//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

if (distance_to_object(player_obj) < 32)
{
	player_obj.lastCheckpoint = id;
}

if (globalSettings_obj.restartInProg)
{
	audio_emitter_free(emitter);
}