timer -= global.dt;

if (timer < 0) {
	if (instance_number(enemy_obj) < 12) {
		enemy = instance_create_layer(x, y, "Instances", enemyToSpawn);
		enemy.aggro = true;
		timer = timerSave + random_range(-(timerSave / 4), timerSave / 4);
		timerSave -= timerSave / 50;
		enemyValue = choose(0,0,0,0,1);
		switch (enemyValue) {
			case 0:
				enemyToSpawn = zombieSoldierGirl_obj;
				break;
			case 1:
				enemyToSpawn = rainmaker_obj;
				break;
		}
	}
}
