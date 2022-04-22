if (slowmo && !slowmoUsed) {
	slowmoUsed = true;
	global.timeScale = 0.05;
}

with (player_obj) {
	if (instance_exists(deathCross_obj) || grounded) {
		global.timeScale = 1;
	}
}