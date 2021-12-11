if (timer < 0) {
	if (instance_exists(player_obj)) {
		spawncloudAnim += global.dt / 30;
		draw_sprite(spawnCloud_spr, spawncloudAnim, player_obj.x, player_obj.y);
	}
}
