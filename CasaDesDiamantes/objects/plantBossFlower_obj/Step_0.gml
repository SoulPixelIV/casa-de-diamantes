if (moveTimer > 0) {
	move_towards_point(goalX, goalY, global.dt);
} else {
	speed = 0;
}

moveTimer -= global.dt;

if (despawnTimer < 0) {
	image_alpha -= global.dt / 70;
}

if (image_alpha < 0.05) {
	instance_destroy();
}
