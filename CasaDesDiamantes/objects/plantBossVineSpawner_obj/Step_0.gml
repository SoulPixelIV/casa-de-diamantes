if (spawnVine) {
	if (randNum == 2) {
		pos = point_direction(x, y, player_obj.x, player_obj.y);
		vine = instance_create_layer(x, y, "BackgroundObjects", vinePlantBoss_obj);
		hitbox = instance_create_layer(x, y, "Instances", damageHitboxKnockback_obj);
		vine.image_angle = point_direction(x, y, player_obj.x, player_obj.y);
		instance_create_layer(player_obj.x, player_obj.y + 32, "ForegroundObjects", plantBossWarningCircle_obj);
	}
	spawnVine = false;
}
