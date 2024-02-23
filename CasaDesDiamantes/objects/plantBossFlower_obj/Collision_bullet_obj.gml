randNum = choose(1,2,3);
randNum2 = choose(1,2);
randNum3 = choose(1,2,3,4);

if (randNum == 1) {
	repeat(randNum2) {
		instance_create_layer(x, y, "Instances", ammoPackPistolDrop_obj);
	}
}
if (randNum == 2) {
	repeat(randNum2) {
		instance_create_layer(x, y, "Instances", zombieSpawnEgg_obj);
		if (randNum3 == 1 || randNum3 == 2) {
			instance_create_layer(x, y, "Instances", healthpackDrop_obj);
			randNum3 = choose(1,2,3,4);
		}
	}
}
if (randNum == 3) {
	repeat(randNum2) {
		instance_create_layer(x, y, "Instances", ammoPackShotgunDrop_obj);
	}
}

instance_destroy(other);
instance_destroy();
