//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

x = player_obj.x - 21;
y = player_obj.y - 21;

//Movement
if (dir == 0)
{
	verspeed = speedVer;
	if (movTimer < 0)
	{
		dir = 1;
		movTimer = movTimerSave;
	}
}
else
{
	verspeed = -speedVer;
	if (movTimer < 0)
	{
		dir = 0;
		movTimer = movTimerSave;
	}
}

movTimer -= global.dt;