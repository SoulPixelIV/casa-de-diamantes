//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

if (!switchedPos) {
	if (distance_to_point(target.x - 27 * player_obj.image_xscale, target.y - 33) < 1) {
		x = targetPosX;
		y = targetPosY;
	} else {
		move_towards_point(target.x - 27 * player_obj.image_xscale, target.y - 33, global.dt);
	}
	targetPosX = target.x - 27 * player_obj.image_xscale;
	targetPosY = target.y - 33;
} else {
	if (player_obj.image_xscale == 1) {
		move_towards_point(target.x - 27, target.y - 33, global.dt);
		if (distance_to_point(target.x - 27, target.y - 33) < 1) {
			oldPos = player_obj.image_xscale;
			switchedPos = false;
		}
	} else {
		move_towards_point(target.x + 27, target.y - 33, global.dt);
		if (distance_to_point(target.x + 27, target.y - 33) < 1) {
			oldPos = player_obj.image_xscale;
			switchedPos = false;
		}
	}
}

if (player_obj.image_xscale == 1) {
	image_xscale = 1;
} else {
	image_xscale = -1;
}

if (oldPos != player_obj.image_xscale) {
	switchedPos = true;
}

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