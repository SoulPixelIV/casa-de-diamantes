dir = 1;
liveTimer = 50;
if (dir == 1) {
	image_xscale = random_range(0.7, 1);
} else {
	image_xscale = random_range(-0.7, -1);
}
image_yscale = random_range(0.6, 1);

if (instance_exists(flowerline_obj)) {
	flowerParent = instance_nearest(x, y, flowerline_obj);
	checkDir = flowerParent.dir;
}
