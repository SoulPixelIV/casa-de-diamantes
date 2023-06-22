if (spawnVine) {
	randNum = choose(1,2,3);
	if (randNum == 2) {
		pos = point_direction(x, y, player_obj.x, player_obj.y);
		vine = instance_create_layer(x, y, "BackgroundObjects", vinePlantBoss_obj);
		vine.image_angle = point_direction(x, y, player_obj.x, player_obj.y);
		hitbox = instance_create_layer(x, y, "Instances", damageHitboxMoving_obj);
	}
	despawnTimer = despawnTimerSave;
	despawnTimerStart = true;
	spawnVine = false;
}

if (despawnTimerStart) {
	despawnTimer -= global.dt;
}
