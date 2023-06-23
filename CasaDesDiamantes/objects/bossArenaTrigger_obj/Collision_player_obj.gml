with (plantBoss_obj) {
	startBattle = true;
}
with (camera_obj) {
	showBossHealthbar = true;
}
if (instance_exists(plantBoss_obj)) {
	with (lasergate_obj) {
		open = true;
	}
} else {
	with (lasergate_obj) {
		open = false;
	}
}
