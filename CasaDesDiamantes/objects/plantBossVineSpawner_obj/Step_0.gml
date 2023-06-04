if (spawnVine) {
	var randNum = choose(1,2);
	if (randNum == 2) {
		vine = instance_create_layer(x, y, "Instances", vinePlantBoss_obj);
		vine.image_angle = point_direction(x, y, player_obj.x, player_obj.y);
	}
	spawnVine = false;
}
