explosionTimer = 250;
playedSound = false;
animationSpeed = 1;
spinTimer = 250;
if (activeLight) {
	boxLight = instance_create_layer(x, y, "GraphicsLayer", spotlightRed_obj);
}

used = false;
spinDone = false;
spawned = false;
playedSound = false;
jumpAnim = false;

//Create Emitter
emitter = audio_emitter_create();
audio_max_distance = 500;
audio_drop_start = 180;

audio_falloff_set_model(audio_falloff_linear_distance);
audio_emitter_position(emitter, x, y, 0);
audio_emitter_falloff(emitter, audio_drop_start, audio_max_distance, 1);
