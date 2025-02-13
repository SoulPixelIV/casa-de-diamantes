if (instance_exists(camera_obj))
{
	xTo = floor(camera_obj.x - 250 + movingXOffset);
	yTo = 1797;
	setOffset = (camera_obj.x - 232) - offset

	x = floor(xTo - (setOffset / 4));
	if (movingXOffset <= -600) {
		movingXOffset = -607;
		movingXOffset += 2880;
	} else {
		movingXOffset -= global.dt * 3;
	}
	y = yTo;
}
