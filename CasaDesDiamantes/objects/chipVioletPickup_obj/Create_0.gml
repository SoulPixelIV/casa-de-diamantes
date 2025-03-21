image_xscale = 0.85;
image_yscale = 0.85;

follow = false;
spawnDelay = 156;
alarm[0] = spawnDelay;

horspeed = choose(random_range(-1.3, -1.8), random_range(1.3, 1.8));
verspeed = random_range(-1, -3.9);
gravityStrength = -0.34;
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