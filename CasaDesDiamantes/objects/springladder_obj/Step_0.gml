if (moving) {
	y -= global.dt * 1.7;
} else {
	if (y < startPos) {
		y += global.dt * 2;
	}
}

if (instance_exists(player_obj)) {
	if (!player_obj.onSpringLadder) {
		moving = false;
	}
}




