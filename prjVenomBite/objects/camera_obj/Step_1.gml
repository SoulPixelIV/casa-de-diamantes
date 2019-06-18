/// @description Camera Movement

dt = (delta_time / 1000000) * globalSettings_obj.TARGET_FRAMERATE;
xCoor = player_obj.x - (viewX / 2);
yCoor = player_obj.y - (viewY / 2);

camera_set_view_size(view_camera[0], viewX, viewY);
camera_set_view_pos(view_camera[0], player_obj.x - (viewX / 2), player_obj.y - (viewY / 2));

//Zooming
if (player_obj.horspeed == 0 && player_obj.verspeed == 0)
{
	zoomCooldown -= 1 * dt;
}
else
{
	zoomCooldown = zoomCooldownSave;
}

if (!noZoom && !player_obj.isZombie)
{
	if (zoomCooldown < 0)
	{
		if (viewX > 160 || viewY > 90)
		{
			viewX -= (16 / 12) * dt;
			viewY -= (9 / 12) * dt;
		}
	}
	else
	{
		if (viewX < 512 || viewY < 288)
		{
			viewX += (16 * 2) * dt;
			viewY += (9 * 2) * dt;
		}
	}
}
if (!noZoom && player_obj.isZombie)
{
	if (zombieShakeDir == 0)
	{
		if (viewX < 464 || viewY < 261)
		{
			viewX += (16 / 2) * dt;
			viewY += (9 / 2) * dt;
		}
		else
		{
			zombieShakeDir = 1;
		}
	}
	if (zombieShakeDir == 1)
	{
		if (viewX > 400 || viewY > 225)
		{
			viewX -= (16 / 2) * dt;
			viewY -= (9 / 2) * dt;
		}
		else
		{
			zombieShakeDir = 0;
		}
	}
}

//Score Shake
if (scoreShake)
{
	scoreMovementSpeed = 0.8;
	scoreMovementMax = 1.75;
	scoreShakeLength -= dt;
}
if (scoreShakeLength < 0)
{
	scoreShake = false;
	scoreMovementSpeed = 0.2;
	scoreMovementMax = 1;
	scoreShakeLength = 80;
}



