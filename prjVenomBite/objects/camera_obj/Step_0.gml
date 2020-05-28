if (follow != noone)
{
	if (instance_exists(follow))
	{
		xTo = follow.x;
		if ((follow.y - 16) < y - 86 || (follow.y - 16) > y + 64)
		{
			yTo = follow.y - 16;
		}
	}
}

if (follow == camera_obj)
{
	xTo = player_obj.x + (mouse_x - player_obj.x) / 2;
	yTo = (player_obj.y + 16) + (mouse_y - (player_obj.y + 16)) / 2;
}

x += (xTo - x) * (global.dtNoSlowmo / 10);
if (follow == camera_obj)
{
	y += (yTo - y - 16) * (global.dtNoSlowmo / 10);
}
else
{
	y += (yTo - y - 16) * (global.dtNoSlowmo / 50);
}

var vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0);
camera_set_view_mat(camera,vm);
var pm = matrix_build_projection_ortho(xScreenSize, yScreenSize,1,10000);
camera_set_proj_mat(camera,pm);

//Aim Zoom
if (mouse_check_button(mb_right))
{
	follow = camera_obj;
}
if (mouse_check_button_released(mb_right))
{
	follow = player_obj;
}

//Change Camera Size
if (xScreenSizeNew > xScreenSize)
{
	xScreenSize += ((16 / 2) * global.dt / 3) * cameraSpeed;
	yScreenSize += ((9 / 2) * global.dt / 3) * cameraSpeed;
	if (xScreenSizeNew > xScreenSize && xScreenSizeNew < xScreenSize + 4)
	{
		xScreenSize = xScreenSizeNew;
		yScreenSize = yScreenSizeNew;
	}
}
if (xScreenSizeNew < xScreenSize)
{
	xScreenSize -= ((16 / 2) * global.dt / 3) * cameraSpeed;
	yScreenSize -= ((9 / 2) * global.dt / 3) * cameraSpeed;
	if (xScreenSizeNew < xScreenSize && xScreenSizeNew > xScreenSize - 4)
	{
		xScreenSize = xScreenSizeNew;
		yScreenSize = yScreenSizeNew;
	}
}

switch (currentCameraState)
{
	case cameraState.normal:
		changeCamera_scr(464, 261);
		break;
	case cameraState.zoomIn:
		changeCamera_scr(208, 117);
		break;
	case cameraState.zoomOut:
		changeCamera_scr(672, 378);
		break;
	case cameraState.zoomAFK:
		changeCamera_scr(160, 90);
		break;
	case cameraState.death:
		changeCamera_scr(128, 72);
		break;
}

//VignetteStrength
if (vignetteStrength != 1)
{
	vignetteStrengthTimer -= global.dt;
}

if (vignetteStrengthTimer < 0)
{
	vignetteStrength = 1;
	vignetteStrengthTimer = vignetteStrengthTimerSave;
}