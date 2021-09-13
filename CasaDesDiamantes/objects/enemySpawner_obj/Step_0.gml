timer -= global.dt;

if (timer < 0) {
	if (instance_number(enemy_obj) < 25) {
		enemy = instance_create_layer(x, y, "Instances", enemyToSpawn);
		enemy.aggro = true;
		timer = timerSave + random_range(-(timerSave / 4), timerSave / 4);
		timerSave -= timerSave / 50;
		enemyValue = choose(0,0,0,0,1,1,1,1,2,2,3,3);
		switch (enemyValue) {
			case 0:
				enemyToSpawn = zombieGirlWounded_obj;
				break;
			case 1:
				enemyToSpawn = zombieGirl_obj;
				break;
			case 2:
				enemyToSpawn = zombieBucketGirl_obj;
				break;
			case 3:
				enemyToSpawn = crawler_obj;
				break;
		}
	}
}
