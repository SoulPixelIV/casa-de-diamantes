//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

if (distance_to_point(target.x - 27 * target.image_xscale, target.y - 33) > 16) {
	move_towards_point(target.x - 27 * target.image_xscale, target.y - 33, movspeed);
	if (player_obj.image_xscale == 1) {
		image_xscale = 1;
	} else {
		image_xscale = -1;
	}
} else {
	speed = 0;
}

if (distance_to_object(enemy_obj) < 156) {
	//Laser Shot
	if (global.cupyUpgrade2) {
		laserAttackTimer -= global.dt;
		if (laserAttackTimer < 0) {
			laser = instance_create_layer(x, y, "Instances", laserCuPy_obj);
			nearEnemy = instance_nearest(x, y, enemy_obj);
			laser.dir = point_direction(x, y, nearEnemy.x, nearEnemy.y);
			laserAttackTimer = 100 + random_range(-10, 10);
		}
	}
}