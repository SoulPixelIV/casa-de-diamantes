randNum = choose(1,2);
randNum2 = choose(1,2);

if (randNum == 1) {
	repeat(randNum2) {
		instance_create_layer(x, y, "Instances", ammoPackPistolDrop_obj);
	}
} else {
	repeat(randNum2) {
		instance_create_layer(x, y, "Instances", zombieSpawnEgg_obj);
		instance_create_layer(x, y, "Instances", healthpackDrop_obj);
	}
}
instance_destroy(other);
instance_destroy();
