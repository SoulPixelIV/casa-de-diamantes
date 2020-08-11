if (follow != noone)
{
	if (instance_exists(follow))
	{
		xTo = follow.x;
		if ((follow.y - cameraYBorder) < y - 86 || (follow.y - cameraYBorder) > y + 64)
		{
			yTo = follow.y - cameraYBorder;
		}
	}
}

if (follow == camera_obj)
{
	xTo = player_obj.x + (mouse_x - player_obj.x) / 2;
	yTo = (player_obj.y + cameraYBorder) + (mouse_y - (player_obj.y + cameraYBorder)) / 2;
}

x += (xTo - x) * (global.dtNoSlowmo / 10);
if (follow == camera_obj)
{
	y += (yTo - y - cameraYBorder) * (global.dtNoSlowmo / 10);
}
else
{
	y += (yTo - y - cameraYBorder) * (global.dtNoSlowmo / 50);
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
		changeCamera_scr(480, 270);
		cameraYBorder = 16;
		break;
	case cameraState.zoomIn:
		changeCamera_scr(192, 108);
		break;
	case cameraState.zoomOut:
		changeCamera_scr(768, 432);
		cameraYBorder = 86;
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

//Particles
if (partMovement > 15)
{
	partDir = 1;
}
if (partMovement < -15)
{
	partDir = 0;
}

if (partDir == 0)
{
	partMovement += global.dt / 150;
}
else
{
	partMovement -= global.dt / 150;
}

//Coinbar
if (scoreSpin)
{
	if (!audio_is_playing(coinbarSpin_snd))
	{
		spinsnd = audio_play_sound(coinbarSpin_snd, 1, false);
	}
	playScoreStop = true;
}
else
{
	if (playScoreStop)
	{
		audio_play_sound(coinbarStop_snd, 1, false);
		audio_stop_sound(spinsnd);
		playScoreStop = false;
	}
}