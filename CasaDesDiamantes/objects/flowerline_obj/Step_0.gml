spawnTimer -= global.dt;
liveTimer -= global.dt;

xPos += (global.dt / 1.3) * dir;

if (instance_exists(hitboxFlowerAttack)) {
	hitboxFlowerAttack.image_xscale += global.dt / 25;
	hitboxFlowerAttack.x += (global.dt / 4) * dir;
}

if (spawnTimer < 0) {
	flower = instance_create_layer(x + xPos, y, "Instances", flower_obj);
	flower.dir = dir;
	spawnTimer = random_range(15,25);
}

if (liveTimer < 0) {
	instance_destroy();
}