if (follow != noone)
{
	xTo = follow.x;
	if ((follow.y - 16) < y - 86 || (follow.y - 16) > y + 64)
	{
		yTo = follow.y - 16;
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

//Aim Zoom
if (mouse_check_button(mb_right))
{
	follow = camera_obj;
}
if (mouse_check_button_released(mb_right))
{
	follow = player_obj;
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