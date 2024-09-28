/// @description Crush

audio_play_sound(bulletHit_snd, 1, false);
instance_create_layer(x, y, "ForegroundObjects", explosion_obj);
if (instance_exists(collider))
{
	instance_destroy(collider);
}
instance_destroy();
