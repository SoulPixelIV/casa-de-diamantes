if (instance_exists(player_obj)) {
	if (place_meeting(x, y, player_obj)) {
		if (!done) {
			if (instance_exists(lasergate_obj)) {
				lasergate_obj.open = true;
			}
			
			if (instance_exists(spikesMovingUp_obj)) {
				spikesMovingUp_obj.open = true;
			}
		
			openFloor = true;
			
			if (instance_exists(clockTimer_obj)) {
				var clock = instance_nearest(x, y, clockTimer_obj);
				clock.startTimer = true;
			}
		}
	}
}

if (openFloor) {
	initialDelay -= global.dt;
	
	if (initialDelay < 0) {
		if (instance_exists(basementFloor_obj)) {
			if (basementFloor_obj.x > floorStartPos1 - 96) {
				basementFloor_obj.x -= global.dt / 8;
				screenshake(50, 20, 0.6, id);
			}
		}
		if (instance_exists(basementFloor2_obj)) {
			if (basementFloor2_obj.x < floorStartPos2 + 96) {
				basementFloor2_obj.x += global.dt / 8;
			}
		}
	}
}
