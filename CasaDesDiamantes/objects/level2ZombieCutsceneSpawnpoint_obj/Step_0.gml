if (instance_exists(level2LandTrigger_obj) && !spawnedEnemy) {
	if (level2LandTrigger_obj.spawnEverything) {
		zombie = instance_create_layer(x, y, "Instances", zombieGirlCutscene_obj);
		if (dir == -1) {
			zombie.image_xscale = -1;
		}
		spawnedEnemy = true;
	}
}

if (removeEnemy) {
	if (instance_exists(zombie)) {
		instance_destroy(zombie);
	}
}



