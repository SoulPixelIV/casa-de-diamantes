/// @description Camera Movement

xCoor = player_obj.x - (viewX / 2);
yCoor = player_obj.y - (viewY / 2);

camera_set_view_size(view_camera[0], viewX, viewY);
camera_set_view_pos(view_camera[0], ledSignGithub_obj.x - (viewX / 2), ledSignGithub_obj.y - (viewY / 2));

//Zooming
if (player_obj.hspeed == 0 && player_obj.vspeed == 0)
{
	zoomCooldown -= 1;
}
else
{
	zoomCooldown = zoomCooldownSave;
}

if (zoomCooldown < 0)
{
	if (viewX > 160 || viewY > 90)
	{
		viewX -= 16 / 12;
		viewY -= 9 / 12;
	}
}
else
{
	if (viewX < 640 || viewY < 360)
	{
		viewX += 16 * 2;
		viewY += 9 * 2;
	}
}



