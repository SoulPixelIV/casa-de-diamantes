draw_self();

if (playerEntered) {
	spawncloudAnim += global.dt / 30;
	draw_sprite(spawnCloud_spr, spawncloudAnim, player_obj.x, player_obj.y);
}
