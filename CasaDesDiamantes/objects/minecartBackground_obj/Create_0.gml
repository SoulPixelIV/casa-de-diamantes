mainObj = instance_nearest(x, y, minecart_obj);

if (mainObj.image_xscale == -1) {
	offsetX = x + mainObj.x;
} else {
	offsetX = x - mainObj.x;
}
offsetY = y - mainObj.y;
