if (instance_exists(player_obj)) {
	if (place_meeting(x, y, player_obj)) {
		if (!done) {
			if (instance_exists(lasergate_obj)) {
				lasergate_obj.open = true;
			}
			
			if (instance_exists(clockTimer_obj)) {
				var clock = instance_nearest(x, y, clockTimer_obj);
				clock.startTimer = true;
			}
		}
		startGame = true;
	}
}

if (startGame) {
	initialDelay -= global.dt;
}

if (initialDelay < 0) {
	if (instance_exists(timeblock_obj)) {
		for (var i = 0; i < instance_number(timeblock_obj); ++i;) {
		    block[i] = instance_find(timeblock_obj, i);
			block[i].open = true;
		}
	}
}