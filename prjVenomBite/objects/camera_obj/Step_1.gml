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

if (!noZoom)
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
		if (viewX < 640 || viewY < 360)
		{
			viewX += (16 * 2) * dt;
			viewY += (9 * 2) * dt;
		}
	}
}



