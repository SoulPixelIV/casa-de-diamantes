/// @description Camera Movement

dt = (delta_time / 1000000) * globalSettings_obj.TARGET_FRAMERATE;
xCoor = player_obj.x - (viewX / 2);
yCoor = player_obj.y - (viewY / 2);

camera_set_view_size(view_camera[0], viewXSave, viewYSave);
camera_set_view_pos(view_camera[0], player_obj.x - (viewXSave / 2), player_obj.y - (viewYSave / 2));

//Zooming
if (player_obj.horspeed == 0 && player_obj.verspeed == 0)
{
	zoomCooldown -= 1 * dt;
}
else
{
	zoomCooldown = zoomCooldownSave;
}

//Change Camera View
if (viewX > viewXSave)
{
	viewXSave += (16 / 2) * dt;
	viewYSave += (9 / 2) * dt;
}
if (viewX < viewXSave)
{
	viewXSave -= (16 / 2) * dt;
	viewYSave -= (9 / 2) * dt;
}

//Normal Camera
if (!noZoom && !player_obj.isZombie)
{
	//Zoom
	if (zoomCooldown < 0)
	{
		viewX = 160;
		viewY = 90;
	}
	else //Zoom Out
	{
		if (zoomOut)
		{
			viewX = 768;
			viewY = 432;
		}
		else //Normal View
		{
			viewX = 512;
			viewY = 288;
		}
	}
}

//Zombie Camera
if (!noZoom && player_obj.isZombie)
{
	zombieShakeTime -= zombieShakeSpeed * dt;
	if (zombieShakeTime < 0)
	{
		if (zombieShakeDir == 0)
		{
			zombieShakeDir = 1;
		}
		else
		{
			zombieShakeDir = 0;
		}
		zombieShakeTime = 30;
	}
	
	if (zombieShakeDir == 0)
	{
		viewX = 464;
		viewY = 261;
	}
	else
	{
		zombieShakeDir = 1;
	}
	if (zombieShakeDir == 1)
	{
		viewX = 400;
		viewY = 225;
	}
	else
	{
		zombieShakeDir = 0;
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



