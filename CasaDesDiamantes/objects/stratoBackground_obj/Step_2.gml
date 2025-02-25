if (instance_exists(camera_obj))
{
	xTo = floor(camera_obj.x + 250 + movingXOffset);
	yTo = camera_obj.y - 150;

	x = xTo;
	if (movingXOffset <= -600) {
		movingXOffset = -605;
		movingXOffset += 2880;
	} else {
		movingXOffset -= global.dt * 2;
	}
	y = yTo;
}
