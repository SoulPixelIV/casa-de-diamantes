if (moveTimer > 0) {
	move_towards_point(goalX, goalY, global.dt);
} else {
	speed = 0;
}

moveTimer -= global.dt;
