if (trainPhase == 0) {
	image_speed = 0;
	image_index = 0;
}

if (trainPhase == 1) {
	image_speed = 0;
	image_index += (global.dt / 15) * animationSpeed;
}

if (trainPhase == 2) {
	image_speed = 0;
	image_index = 1;
}

if (instance_exists(stratoTrainComplete_obj)) {
	var train = instance_nearest(x, y, stratoTrainComplete_obj);
	if (distance_to_object(train) < 1400) {
		trainPhase = 1;
	} else {
		trainPhase = 0;
	}
}