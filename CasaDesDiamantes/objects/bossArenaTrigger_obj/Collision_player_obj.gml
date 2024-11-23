if (instance_exists(plantBoss_obj)) {
	with (plantBoss_obj) {
		startBattle = true;
	}
	with (lasergate_obj) {
		open = true;
	}
} else {
	with (lasergate_obj) {
		open = false;
	}
}

if (instance_exists(camera_obj)) {
	with (camera_obj) {
		showBossHealthbar = true;
	}
}
