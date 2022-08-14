if (open && spawnNum > 0) {
	spawnDelay -= global.dt;
	
	if (spawnDelay < 0) {
		var enemy = instance_create_layer(x + random_range(-8, 8), y, "Instances", spidercorpse_obj);
		enemy.aggro = true;
		spawnNum--;
		spawnDelay = random_range(20,80);
	}
}

if (spawnNum == 0) {
	open = false;
	spawnNum = spawnNumSave;
}


