/// @description Camera Movement
if (live_call()) return live_result;
cameraBorderXMin = viewXSave / 2 + 32;
cameraBorderXMax = room_width - viewXSave / 2 - 32;
cameraBorderYMin = viewYSave / 2 + 32;
cameraBorderYMax = room_height - viewYSave / 2 - 32;

camera_set_view_pos(view_camera[0], xCoorNew, yCoorNew);
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
if (player_obj.y <= cameraBorderYMax || player_obj.y >= cameraBorderYMin)
{
	if ((player_obj.y - 24) < yCoorDelay - 96 || player_obj.y > yCoorDelay - 16)
	{
		yCoor += ((player_obj.y - 24) - (viewYSave / 2) - camera_get_view_y(view_camera[0]));
		//yCoorDelay = yCoor;
	}
	else
	{
		//yCoorDelay Transition
		if (yCoorDelay < yCoor)
		{
			yCoorDelay += global.dt / 16;
		}
		if (yCoorDelay > yCoor)
		{
			yCoorDelay -= global.dt / 16;
		}
	}
}
else
{
	if ((player_obj.y - 24) >= cameraBorderYMax)
	{
		yCoor = room_height - viewYSave - 32;
	}
	if ((player_obj.y - 24) <= cameraBorderYMin)
	{
		yCoor = 32;
	}
}

//Aim Zoom
if (mouse_check_button(mb_right))
{
	xCoorSway = window_mouse_get_x() / 10 + (player_obj.x - viewXSave / 1.6);
	yCoorSway = window_mouse_get_y() / 10 + (player_obj.y - viewYSave / 1.6);
	var swayVector = point_direction(xCoorNew, yCoorNew, xCoorSway, yCoorSway);
	var swayDistance = point_distance(xCoorNew, yCoorNew, xCoorSway, yCoorSway);
	
	if (yCoorSway > yCoorNew - 0.2 && yCoorSway < yCoorNew + 0.2)
	{
		yCoorNew = yCoorSway;
		xCoorNew = xCoorSway;
	}
	else
	{
		xCoorNew += lengthdir_x(global.dt * (swayDistance / 50), swayVector);
		yCoorNew += lengthdir_y(global.dt * (swayDistance / 50), swayVector);
	}
}
else
{
	var swayVector = point_direction(xCoorNew, yCoorNew, xCoor, yCoor);
	var swayDistance = point_distance(xCoorNew, yCoorNew, xCoor, yCoor);
	/*
	if (yCoorNew > yCoor - 0.2 && yCoorNew < yCoor + 0.2)
	{
		yCoorNew = yCoor;
		xCoorNew = xCoor;
	}
	else
	{
		xCoorNew += lengthdir_x(global.dt * (swayDistance / 25), swayVector);
		yCoorNew += lengthdir_y(global.dt * (swayDistance / 25), swayVector);
	}
	*/
	yCoorNew = yCoor;
	xCoorNew = xCoor;
}

//Zooming
if (player_obj.horspeed == 0 && player_obj.verspeed == 0)
{
	zoomCooldown -= global.dt / 3;
}
else
{
	zoomCooldown = zoomCooldownSave;
	zoomAFK = false;
}

//Change Camera View
if (viewX > viewXSave)
{
	viewXSave += (16 / 2) * global.dt / 3;
	viewYSave += (9 / 2) * global.dt / 3;
	if (viewX > viewXSave && viewX < viewXSave + 4)
	{
		viewXSave = viewX;
		viewYSave = viewY;
	}
}
if (viewX < viewXSave)
{
	viewXSave -= (16 / 2) * global.dt / 3;
	viewYSave -= (9 / 2) * global.dt / 3;
	if (viewX < viewXSave && viewX > viewXSave - 4)
	{
		viewXSave = viewX;
		viewYSave = viewY;
	}
}
/*
switch (currentCameraState)
{
	case cameraState.normal:
		changeCamera_scr(464 - slowmotionZoomX - recoilZoomX, 261 - slowmotionZoomY - recoilZoomY);
		break;
	case cameraState.zoomIn:
		changeCamera_scr(208 - slowmotionZoomX - recoilZoomX, 117 - slowmotionZoomY - recoilZoomY);
		break;
	case cameraState.zoomOut:
		changeCamera_scr(672 - slowmotionZoomX - recoilZoomX, 378 - slowmotionZoomY - recoilZoomY);
		break;
	case cameraState.zoomAFK:
		changeCamera_scr(160 - slowmotionZoomX - recoilZoomX, 90 - slowmotionZoomY - recoilZoomY);
		break;
}
*/
if (zoomCooldown < 0 && !noZoom && !player_obj.isZombie)
{
	zoomAFK = true;
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
	zombieShakeTime -= zombieShakeSpeed * global.dt;
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
	scoreShakeLength -= global.dt;
}
if (scoreShakeLength < 0)
{
	scoreShake = false;
	scoreMovementSpeed = 0.2;
	scoreMovementMax = 1;
	scoreShakeLength = 80;
}



