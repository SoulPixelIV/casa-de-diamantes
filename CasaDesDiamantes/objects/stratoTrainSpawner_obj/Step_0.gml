spawnTime -= global.dt;

if (spawnTime < 0) {
	instance_create_layer(x, y, "Instances", stratoTrainComplete_obj);
	spawnTime = spawnTimeSave;
}
