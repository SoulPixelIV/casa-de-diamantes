initialDelay -= global.dt;

if (initialDelay < 0) {
	spawnDelay -= global.dt;
}

if (spawnDelay < 0) {
	instance_create_layer(x, y, "Instances", lightray_obj);
	spawnDelay = spawnDelaySave;
}




