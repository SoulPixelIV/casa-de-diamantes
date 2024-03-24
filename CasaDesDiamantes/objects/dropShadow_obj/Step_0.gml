if (instance_exists(player_obj)) {
	x = player_obj.x;
	if (distToGround < 2) {
		if (player_obj.isDashing || player_obj.dashroll || player_obj.crouchslide) {
			y = player_obj.y + 16;
			lastGroundPos = y;
		} else {
			y = player_obj.y + 28;
			lastGroundPos = y;
		}
	} else {
		y = lastGroundPos;
	}
}

with (player_obj) {
	dropShadow_obj.distToGround = distance_to_object(dropShadow_obj.nearestGround);
	if (instance_exists(instance_position(x, y + 32, collider_obj))) {
		dropShadow_obj.nearestGround = instance_position(x, y + 32, collider_obj);
	}
}

if (instance_exists(nearestGround)) {
	if ((distToGround / 100) < 1 && (distToGround / 100) >= 0) {
		image_xscale = (1 - distToGround / 100) * player_obj.image_xscale;
		image_yscale = 1 - distToGround / 100;
	}
} else {
	image_xscale = 0;
	image_yscale = 0;
}
