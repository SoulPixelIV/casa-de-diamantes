spawnTime -= global.dt;

if (spawnTime < 0) {
	if (dir == 1) {
		instance_create_layer(x, y, "Instances", stratoTrainCompleteReverse_obj);
	} else {
		instance_create_layer(x, y, "Instances", stratoTrainComplete_obj);
	}
	
	spawnTime = spawnTimeSave;
}

