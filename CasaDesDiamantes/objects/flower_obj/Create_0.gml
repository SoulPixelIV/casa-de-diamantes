dir = 1;
liveTimer = 50;
if (dir == 1) {
	image_xscale = random_range(0.7, 1);
} else {
	image_xscale = random_range(-0.7, -1);
}
image_yscale = random_range(0.6, 1);

if (dir == 1) {
	image_angle = random_range(270, 359) + random_range(0, 90);
} else {
	image_angle = random_range(90, 270);
}
