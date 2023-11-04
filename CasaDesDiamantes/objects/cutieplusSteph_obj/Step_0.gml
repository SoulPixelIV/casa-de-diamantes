//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

x = target.x - 27 * player_obj.image_xscale;
y = target.y - 33;

if (player_obj.image_xscale == 1) {
	image_xscale = 1;
} else {
	image_xscale = -1;
}