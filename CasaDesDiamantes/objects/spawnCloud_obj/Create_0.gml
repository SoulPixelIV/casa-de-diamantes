animationSpeed = 1;
spawnObject = zombieSoldierGirl_obj;
spawnTime = 200 + random_range(-30, 30);

//Create light
light = instance_create_layer(x, y, "GraphicsLayer", spotlightSpawncloud_obj);