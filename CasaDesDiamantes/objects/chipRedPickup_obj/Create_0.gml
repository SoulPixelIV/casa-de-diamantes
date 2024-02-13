image_xscale = 0.75;
image_yscale = 0.75;

follow = false;
horspeed = random_range(-0.9, 0.9);
verspeed = random_range(-1, -3.9);
gravityStrength = -0.22;
despawnTimer = 3000;

invTimer = random_range(90, 150);

//Check if Stuck
if (!place_free(x, y)) {
	//Check for free space to teleport to
	if (place_free(x + 8, y)) {
		x += 8;
	} else if (place_free(x - 8, y)) {
		x -= 8;
	} else if (place_free(x, y + 8)) {
		y += 8;
	} else if (place_free(x, y - 8)) {
		y -= 8;
	}
}