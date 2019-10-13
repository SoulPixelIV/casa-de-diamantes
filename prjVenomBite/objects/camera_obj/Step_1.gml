/// @description Camera Movement

dt = (delta_time / 1000000) * globalSettings_obj.TARGET_FRAMERATE;

//Set Camera Borders
if (player_obj.x >= viewXSave / 2 + 32 && player_obj.x <= room_width - viewXSave / 2 - 32)
{
    xCoor = player_obj.x - (viewXSave / 2);
}
else
{
	if (player_obj.x <= viewXSave / 2 + 32)
	{
		xCoor = 32;
	}
	if (player_obj.x >= room_width - viewXSave / 2 - 32)
	{
		xCoor = room_width - viewXSave - 32;
	}
}

if (player_obj.y <= room_height - viewYSave / 2 - 32 && player_obj.y >= viewYSave / 2 + 32)
{
    yCoor += (player_obj.y - (viewYSave / 2) - camera_get_view_y(view_camera[0]));
}
else
{
	if (player_obj.y >= room_height - viewYSave / 2 - 32)
	{
		yCoor = room_height - viewYSave - 32;
	}
	if (player_obj.y <= viewYSave / 2 + 32)
	{
		yCoor = 32;
	}
}

//###TODO###
mouseXPos = window_mouse_get_x() / viewXSave;
mouseYPos = window_mouse_get_y() / viewYSave;

camera_set_view_size(view_camera[0], viewXSave, viewYSave);
camera_set_view_pos(view_camera[0], xCoor + mouseXPos, yCoor + mouseYPos);

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
		if (zoomIn)
		{
			viewX = 256;
			viewY = 144;
		}
		
		if (!zoomIn && !zoomOut && !player_obj.slowmo && !player_obj.shotZoom) //Normal View
		{
			viewX = 512;
			viewY = 288;
		}
		if (player_obj.slowmo) //Slowmo
		{
			if (!zoomOut && !zoomIn)
			{
				viewX = 480;
				viewY = 270;
			}
			if (zoomOut)
			{
				viewX = 736;
				viewY = 414;
			}
			if (zoomIn)
			{
				viewX = 224;
				viewY = 126;
			}
		}
		if (player_obj.shotZoom) //Slowmo
		{
			if (!zoomOut && !zoomIn)
			{
				viewX = 496;
				viewY = 279;
			}
			if (zoomOut)
			{
				viewX = 752;
				viewY = 423;
			}
			if (zoomIn)
			{
				viewX = 240;
				viewY = 135;
			}
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



