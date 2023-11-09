spawnTimer -= global.dt;
liveTimer -= global.dt;

xPos += (global.dt * 1.5) * dir;

if (instance_exists(hitboxFlowerAttack)) {
	//hitboxFlowerAttack.image_xscale += global.dt / 10;
	hitboxFlowerAttack.x += (global.dt * 1.2) * dir;
}

if (spawnTimer < 0) {
	flower = instance_create_layer(x + xPos, y, "Instances", flower_obj);
	flower.dir = dir;
	
	var randVal = choose(0,1,2);
	if (randVal == 0) {
		roseRoot = instance_create_layer(x + xPos, y, "Instances", roseRoot_obj);
		roseRoot.dir = dir;
	}
	
	spawnTimer = random_range(15,25);
}

if (liveTimer < 0 || stopSpawning) {
	instance_destroy();
}