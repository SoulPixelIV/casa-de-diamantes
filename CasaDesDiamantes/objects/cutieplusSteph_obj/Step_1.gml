if (instance_exists(target)) {
	var tx = target.x - 27 * target.image_xscale;
	var ty = target.y - 33;
	var dist = point_distance(x, y, tx, ty);

	if (dist > 16) {
		// Bewegungsgeschwindigkeit dynamisch wählen
		if (dist < 16) {
			movspeed = movspeedOriginal;
		} else if (dist < 32) {
			movspeed = movspeedOriginal * 2.3;
		} else if (dist < 128) {
			movspeed = movspeedOriginal * 4;
		} else {
			movspeed = movspeedOriginal * 8;
		}

		var dir = point_direction(x, y, tx, ty);
		var move_dist = movspeed * global.dt;

		if (move_dist > dist) move_dist = dist; // nicht überschießen

		x += lengthdir_x(move_dist, dir);
		y += lengthdir_y(move_dist, dir);
	}
}
