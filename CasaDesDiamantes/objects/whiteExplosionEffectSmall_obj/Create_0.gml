initialDelay = 230;
animationSpeed = 0.7;
dir = 1;

if (instance_exists(flowerline_obj)) {
	flowerParent = instance_nearest(x, y, flowerline_obj);
	dir = flowerParent.dir;
}

if (instance_exists(flowerline_obj)) {
	flowerParent = instance_nearest(x, y, flowerline_obj);
	checkDir = flowerParent.dir;
}



