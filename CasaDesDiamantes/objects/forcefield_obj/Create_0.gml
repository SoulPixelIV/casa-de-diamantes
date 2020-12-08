damage = 0;
knockback = 2.8;
dealtDamage = false;
animationSpeed = 1;
lifeLength = 70;

//Create light
light = instance_create_layer(x, y, "GraphicsLayer", spotlightPink_obj);

//Create Emitter
emitter = audio_emitter_create();
audio_max_distance = 300;
audio_drop_start = 100;

screenshake(60, 15, 0.6);