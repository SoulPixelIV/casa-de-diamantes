animationSpeed = 1;
verspeed = 0;
horspeed = 0.01;
speedVer = 0.01;
dir = 0;
dest = 0;
movTimer = 500;
movTimerSave = movTimer;

if (instance_exists(camera_obj))
{
	xTo = camera_obj.x + 64;
	yTo = camera_obj.y - 96;
	offsetX = xTo;
	offsetY = yTo;
}

