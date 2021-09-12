timer -= global.dt;

if (timer < 0) {
	if (instance_number(enemy_obj) < 25) {
		enemy = instance_create_layer(x, y, "Instances", enemyToSpawn);
		enemy.aggro = true;
		timer = timerSave + random_range(-(timerSave / 4), timerSave / 4);
		timerSave -= timerSave / 50;
		enemyToSpawn = choose(zombieGirlWounded_obj, zombieGirl_obj, zombieBucketGirl_obj, explosiveMerchant_obj, crawler_obj);
	}
}
