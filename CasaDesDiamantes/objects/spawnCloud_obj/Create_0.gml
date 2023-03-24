animationSpeed = 1;
spawnObject = zombieSoldierGirl_obj;
spawnTime = 150 + random_range(-60, 60);

//Create light
light = instance_create_layer(x, y, "GraphicsLayer", spotlightSpawncloud_obj);

image_alpha = 0;