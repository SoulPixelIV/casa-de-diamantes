spawnTime -= global.dt;

if (spawnTime < 0) {
	var mine = instance_create_layer(x, y + random_range(-64, 64), "Instances", explosiveBarrel_obj);
	mine.flyToLeft = true;
	mine.image_angle = random_range(0, 359);
	spawnTime = spawnTimeSave + random_range(-(spawnTimeSave / 2), spawnTimeSave / 2);
}
