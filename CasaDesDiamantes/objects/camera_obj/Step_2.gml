
if (follow != noone)
{
	if (instance_exists(follow))
	{
		xTo = follow.x;
		if ((follow.y - cameraYBorder) < y - 86 || (follow.y - cameraYBorder) > y + 64)
		{
			snapCameraY = false;
			yTo = follow.y - cameraYBorder;
		}
	}
}

//Camera Target
if (cameraTarget)
{
	snapCameraX = false;
	snapCameraY = false;
	cameraTargetTimer -= global.dt;
	follow = instance_nearest(x, y, cameraTarget_obj);
	cameraSpeed = 0.01;
	ycameraSpeed = 0.01;
	player_obj.movement = false;
	player_obj.invincible = true;
}

if (cameraTargetTimer < 0)
{
	snapCameraX = false;
	snapCameraY = false;
	follow = player_obj;
	cameraTargetTimer = cameraTargetTimerSave;
	cameraTarget = false;
	cameraSpeed = originalCameraSpeed;
	ycameraSpeed = originalyCameraSpeed;
	player_obj.movement = true;
	player_obj.invincible = false;
}

if (shake) 
{
	if (!is_undefined(shake_id))
	{
		if (distance_to_object(shake_id) > 300)
		{
			shake = false;
		}
	}
	shake_time -= global.dt; 
	xTo += choose(-shake_magnitude, shake_magnitude); 
	//yTo += choose(-shake_magnitude, shake_magnitude); 

	if (shake_time <= 0) 
	{ 
	    shake_magnitude -= shake_fade * global.dt; 

	    if (shake_magnitude <= 0) 
	    { 
	        shake = false; 
	    } 
	} 
}

//Floating Camera
if (follow == camera_obj && !cameraTarget)
{
	xTo = player_obj.x + (mouse_x - player_obj.x) / 2;
	yTo = (player_obj.y + cameraYBorder) + (mouse_y - (player_obj.y + cameraYBorder)) / 2;
}
if (follow == movingPlatform_obj)
{
	xTo = follow.x;
	yTo = follow.y - 64;
}
if (follow == goldenElevatorDirtyForeground_obj)
{
	xTo = follow.x;
	yTo = follow.y - 32;
}

//Snap camera when close enough
//HORIZONTAL
if (x < xTo + 4 && x > xTo - 4 && !shake)
{
	snapCameraX = true;
}

if (snapCameraX)
{
	x = xTo;
}
else
{
	x += (xTo - x) * (global.dtNoSlowmo * cameraSpeed);
}

//VERTICAL
if (y < (yTo - cameraYBorder) + 1 && y > (yTo - cameraYBorder) - 1 && !shake)
{
	snapCameraY = true;
}

if (snapCameraY)
{
	y = yTo - cameraYBorder;
}
else
{
	y += (yTo - y - cameraYBorder) * (global.dtNoSlowmo * ycameraSpeed);
}

if (follow == camera_obj)
{
	y += (yTo - y - cameraYBorder) * (global.dtNoSlowmo * cameraSpeed);
}

var vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0);
camera_set_view_mat(camera,vm);
var pm = matrix_build_projection_ortho(xScreenSize, yScreenSize,1,10000);
camera_set_proj_mat(camera,pm);

//Aim Zoom
if (keyboard_check_pressed(vk_control))
{
	snapCameraX = false;
	snapCameraY = false;
	follow = camera_obj;
}
if (keyboard_check_released(vk_control))
{
	snapCameraX = false;
	snapCameraY = false;
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
