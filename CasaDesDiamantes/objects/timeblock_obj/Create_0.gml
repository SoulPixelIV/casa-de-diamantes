col = instance_create_layer(x, y, "TileCollider", colliderBulletFree_obj);
col.image_xscale = 0.6;
col.image_yscale = 0.6;
col.x = x - 8;
col.y = y - 8;

switchOn = false;
countDelay = 500;
startDelay = random_range(1000, 3000);

countDelaySave = countDelay;

image_speed = 0;
image_index = 0;

spinTimer = 250;
if (activeLight) {
	boxLight = instance_create_layer(x, y, "GraphicsLayer", spotlightYellow_obj);
}

used = false;
spinDone = false;
spawned = false;
playedSound = false;
playedStartSound = false;
jumpAnim = false;

//Create Emitter
emitter = audio_emitter_create();
audio_max_distance = 500;
audio_drop_start = 180;

audio_falloff_set_model(audio_falloff_linear_distance);
audio_emitter_position(emitter, x, y, 0);
audio_emitter_falloff(emitter, audio_drop_start, audio_max_distance, 1);
