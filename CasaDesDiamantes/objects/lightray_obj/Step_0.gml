x -= global.dt * 1.8;

lifeTimer -= global.dt;

if (lifeTimer < 0) {
	instance_destroy();
}




