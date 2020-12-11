image_index += global.dt / 15 * 0.1;

if (distance_to_object(player_obj) < 32)
{
	player_obj.lastCheckpoint = id;
}

if (globalSettings_obj.restartInProg)
{
	audio_emitter_free(emitter);
}