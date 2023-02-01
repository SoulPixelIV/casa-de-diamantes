if (instance_exists(level2LandTrigger_obj) && !spawnedEnemy) {
	if (level2LandTrigger_obj.spawnEverything) {
		zombie = instance_create_layer(x, y, "Instances", zombieGirl_obj);
		if (dir == -1) {
			zombie.image_xscale = -1;
		}
		spawnedEnemy = true;
	}
}




