if (instance_exists(camera_obj))
{
	xTo = camera_obj.x + dest;
	yTo = camera_obj.y - 96;
	setOffsetX = (camera_obj.x - 64) - offsetX;
	setOffsetY = (camera_obj.x - 96) - offsetY;

	x = xTo - (setOffsetX / 32);
	y = yTo - (setOffsetY / 32);
}
