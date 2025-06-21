//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

target = player_obj;

if (instance_exists(target)) {
	//Image Rotation
	var target_scale = player_obj.image_xscale;
	if (target_scale != image_xscale && !turnMinus && !turnPlus) {
		if (image_xscale == 1) {
			turnMinus = true;
		} else {
			turnPlus = true;
		}
	}
		
	if (turnMinus) {
		if (image_xscale > -1) {
			image_xscale -= global.dt / 10;
		} else {
			image_xscale = -1;
			turnMinus = false;
		}
	}
		
	if (turnPlus) {
		if (image_xscale < 1) {
			image_xscale += global.dt / 10;
		} else {
			image_xscale = 1;
			turnPlus = false;
		}
	}
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