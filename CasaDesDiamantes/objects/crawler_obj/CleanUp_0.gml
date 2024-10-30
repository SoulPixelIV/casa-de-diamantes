audio_emitter_free(emitter);
audio_stop_sound(flameSound);
if (instance_exists(light))
{
	instance_destroy(light);
}
if (instance_exists(dmgHitbox))
{
	dmgHitbox.timer = -1;
}
