randNum = choose(1,2);
randNum2 = choose(1,2);
randNum3 = choose(1,2,3,4);

if (randNum == 1) {
	repeat(randNum2) {
		instance_create_layer(x, y, "Instances", ammoPackPistolDrop_obj);
	}
} else {
	repeat(randNum2) {
		instance_create_layer(x, y, "Instances", zombieSpawnEgg_obj);
		if (randNum3 == 1) {
			instance_create_layer(x, y, "Instances", healthpackDrop_obj);
			randNum3 = choose(1,2,3,4);
		}
	}
}
instance_destroy(other);
instance_destroy();
