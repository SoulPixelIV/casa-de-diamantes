if (place_meeting(x, y, player_obj)) {
	if (instance_exists(spawnpoint)) {
		player_obj.x = spawnpoint.x;
		player_obj.y = spawnpoint.y;
	}
}


