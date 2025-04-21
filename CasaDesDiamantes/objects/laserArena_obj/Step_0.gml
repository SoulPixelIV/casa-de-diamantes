if (instance_exists(player_obj)) {
	if (place_meeting(x, y, player_obj)) {
		if (phase1Timer > 0) {
			phase1 = true;
			
			if (instance_exists(clockTimer_obj)) {
				var clock = instance_nearest(x, y, clockTimer_obj);
				clock.startTimer = true;
			}
		}
	}
}

//Phase 1
if (phase1) {
	phase1Timer -= global.dt;
	laserSpawnTimer -= global.dt;
	if (laserSpawnTimer < 0) {
		var laser = instance_create_layer(laserSpawnArea_obj.x, laserSpawnArea_obj.y, "Instances", laser_obj);
		laser.movement = 1;
		laserSpawnTimer = laserSpawnTimerSave;
	}
	
	if (phase1Timer < 0) {
		phase2 = true;
		phase1 = false;
	}
}

//Phase 2
if (phase2) {
	phase2Timer -= global.dt;
	laserSpawnTimer2 -= global.dt;
	if (laserSpawnTimer2 < 0) {
		if (phase2Dir == 1) {
			var laser = instance_create_layer(laserSpawnArea_obj.x, laserSpawnArea_obj.y, "Instances", laser_obj);
			laser.movement = 1;
			phase2Dir = -1;
			laserSpawnTimer2 = laserSpawnTimer2Save;
		}
		else if (phase2Dir == -1) {
			var laser = instance_create_layer(laserSpawnArea2_obj.x, laserSpawnArea2_obj.y, "Instances", laser_obj);
			laser.movement = 2;
			phase2Dir = 1;
			laserSpawnTimer2 = laserSpawnTimer2Save;
		}		
	}
	
	if (phase2Timer < 0) {
		phase3 = true;
		phase2 = false;
	}
}

//Phase 3
if (phase3) {
	phase3Timer -= global.dt;
	laserSpawnTimer3 -= global.dt;
	if (laserSpawnTimer3 < 0) {
		if (phase3Dir == 1) {
			var laser = instance_create_layer(laserSpawnArea_obj.x, laserSpawnArea_obj.y, "Instances", laser_obj);
			var laser2 = instance_create_layer(laserSpawnArea_obj.x + 12, laserSpawnArea_obj.y, "Instances", laser_obj);
			laser.movement = 1;
			laser2.movement = 1;
			phase3Dir = -1;
			laserSpawnTimer3 = laserSpawnTimer3Save;
		}
		else if (phase3Dir == -1) {
			var laser = instance_create_layer(laserSpawnArea2_obj.x, laserSpawnArea2_obj.y, "Instances", laser_obj);
			var laser2 = instance_create_layer(laserSpawnArea2_obj.x - 12, laserSpawnArea2_obj.y, "Instances", laser_obj);
			laser.movement = 2;
			laser2.movement = 2;
			phase3Dir = 1;
			laserSpawnTimer3 = laserSpawnTimer3Save;
		}		
	}
	
	if (phase3Timer < 0) {
		phase4 = true;
		phase3 = false;
	}
}

//Phase 4
if (phase4) {
	phase4Timer -= global.dt;
	laserSpawnTimer4 -= global.dt;
	if (laserSpawnTimer4 < 0) {
		if (phase4Dir == 1) {
			var laser = instance_create_layer(laserSpawnArea_obj.x, laserSpawnArea_obj.y, "Instances", laser_obj);
			var laser2 = instance_create_layer(laserSpawnArea_obj.x + 12, laserSpawnArea_obj.y, "Instances", laser_obj);
			var laser3 = instance_create_layer(laserSpawnArea_obj.x + 24, laserSpawnArea_obj.y, "Instances", laser_obj);
			laser.movement = 1;
			laser2.movement = 1;
			laser3.movement = 1;
			phase4Dir = -1;
			laserSpawnTimer4 = laserSpawnTimer4Save;
		}
		else if (phase4Dir == -1) {
			var laser = instance_create_layer(laserSpawnArea2_obj.x, laserSpawnArea2_obj.y, "Instances", laser_obj);
			var laser2 = instance_create_layer(laserSpawnArea2_obj.x - 12, laserSpawnArea2_obj.y, "Instances", laser_obj);
			var laser3 = instance_create_layer(laserSpawnArea2_obj.x - 24, laserSpawnArea2_obj.y, "Instances", laser_obj);
			laser.movement = 2;
			laser2.movement = 2;
			laser3.movement = 2;
			phase4Dir = 1;
			laserSpawnTimer4 = laserSpawnTimer4Save;
		}		
	}
	
	if (phase4Timer < 0) {
		//phase4 = true;
		//phase4 = false;
	}
}