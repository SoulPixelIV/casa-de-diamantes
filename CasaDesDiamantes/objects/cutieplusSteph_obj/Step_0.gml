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
//x = target.x - 27 * player_obj.image_xscale;
//y = target.y - 33;