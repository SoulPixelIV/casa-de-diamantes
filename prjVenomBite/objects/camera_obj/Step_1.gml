/// @description Camera Movement

dt = (delta_time / 1000000) * globalSettings_obj.TARGET_FRAMERATE;
cameraBorderXMin = viewXSave / 2 + 32;
cameraBorderXMax = room_width - viewXSave / 2 - 32;
cameraBorderYMin = viewYSave / 2 + 32;
cameraBorderYMax = room_height - viewYSave / 2 - 32;

camera_set_view_pos(view_camera[0], xCoor, yCoor);
camera_set_view_size(view_camera[0], viewXSave, viewYSave);

//Set Camera Borders
//horizontal
if (player_obj.x >= cameraBorderXMin && player_obj.x <= cameraBorderXMax)
{
    xCoor = player_obj.x - (viewXSave / 2);
}
else
{
	if (player_obj.x <= cameraBorderXMin)
	{
		xCoor = 32;
	}
	if (player_obj.x >= cameraBorderXMax)
	{
		xCoor = room_width - viewXSave - 32;
	}
}
//vertical
if (player_obj.y <= cameraBorderYMax && player_obj.y >= cameraBorderYMin)
{
    yCoor += (player_obj.y - (viewYSave / 2) - camera_get_view_y(view_camera[0]));
}
else
{
	if (player_obj.y >= cameraBorderYMax)
	{
		yCoor = room_height - viewYSave - 32;
	}
	if (player_obj.y <= cameraBorderYMin)
	{
		yCoor = 32;
	}
}

//Aim Zoom
if (mouse_check_button(mb_right))
{
	xCoor += window_mouse_get_x() / 15 + (player_obj.x - viewXSave / 1.6);
	yCoor += window_mouse_get_y() / 15 + (player_obj.y - viewYSave / 1.6);
	//camera_set_view_pos(view_camera[0], mouseXPos / 15 + (player_obj.x - viewXSave / 1.6), mouseYPos / 15 + (player_obj.y - viewYSave / 1.6));
}

//Zooming
if (player_obj.horspeed == 0 && player_obj.verspeed == 0)
{
	zoomCooldown -= dt;
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
	if (viewX > viewXSave && viewX < viewXSave + 4)
	{
		viewXSave = viewX;
		viewYSave = viewY;
	}
}
if (viewX < viewXSave)
{
	viewXSave -= (16 / 2) * dt;
	viewYSave -= (9 / 2) * dt;
	if (viewX < viewXSave && viewX > viewXSave - 4)
	{
		viewXSave = viewX;
		viewYSave = viewY;
	}
}

switch (currentCameraState)
{
	case cameraState.normal:
		changeCamera_scr(512 - slowmotionZoomX - recoilZoomX, 288 - slowmotionZoomY - recoilZoomY);
		break;
	case cameraState.zoomIn:
		changeCamera_scr(256 - slowmotionZoomX - recoilZoomX, 144 - slowmotionZoomY - recoilZoomY);
		break;
	case cameraState.zoomOut:
		changeCamera_scr(768 - slowmotionZoomX - recoilZoomX, 432 - slowmotionZoomY - recoilZoomY);
		break;
	case cameraState.zoomAFK:
		changeCamera_scr(160 - slowmotionZoomX - recoilZoomX, 90 - slowmotionZoomY - recoilZoomY);
		break;
}

if (zoomCooldown < 0 && !noZoom && !player_obj.isZombie)
{
	currentCameraState = cameraState.zoomAFK;
}

if (player_obj.slowmo)
{
	slowmotionZoomX = slowmotionZoomStrength / 16;
	slowmotionZoomY = slowmotionZoomStrength / 9;
}
else
{
	slowmotionZoomX = 0;
	slowmotionZoomY = 0;
}

if (player_obj.shotZoom)
{
	if (global.currentWeapon = gameManager_obj.pickedWeapon.pistol)
	{
		recoilZoomX = pistolRecoilZoom / 16;
		recoilZoomY = pistolRecoilZoom / 9;
	}
	if (global.currentWeapon = gameManager_obj.pickedWeapon.dualBarettas)
	{
		recoilZoomX = dualBarettasRecoilZoom / 16;
		recoilZoomY = dualBarettasRecoilZoom / 9;
	}
	if (global.currentWeapon = gameManager_obj.pickedWeapon.shotgun)
	{
		recoilZoomX = shotgunRecoilZoom / 16;
		recoilZoomY = shotgunRecoilZoom / 9;
	}
}

//Zombie Camera
/*
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
*/

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



