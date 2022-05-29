liveTimer -= global.dt;

if (liveTimer < 0) {
	instance_destroy();
}