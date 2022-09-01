if (slowmo && !slowmoUsed) {
	slowmoUsed = true;
	global.timeScale = 0.05;
}

if (slowmo) {
	with (player_obj) {
		if (instance_exists(deathCross_obj) || grounded) {
			if (instance_exists(whitesquare_obj)) {
				global.timeScale += global.dt / 300;
				whitesquare_obj.image_alpha += global.dt / 130;
			}
		}
	}
}