/// @description Camera Movement

xCoor = player_obj.x - (viewX / 2);
yCoor = player_obj.y - (viewY / 2);

camera_set_view_size(view_camera[0], viewX, viewY);

///Camera View Follow System

//Camera Follow
if (instance_exists(player_obj))
{
    //Set Camera X Borders
    if (player_obj.x >= viewX && player_obj.x <= room_width - viewX)
    {
		camera_set_view_pos(view_camera[0], player_obj.x - (viewX / 2), y);
    }
    else
    {
        if (player_obj.x <= viewX)
        {
            camera_set_view_pos(view_camera[0], 0, y)
        }
        if (player_obj.x >= room_width - viewX)
        {
            view_xview[0] = room_width - (viewX * 2);
			camera_set_view_pos(view_camera[0], room_width - (viewX * 2), y);
        }
    }
    //Set Camera Y Borders
    if (player_obj.y <= (room_height - 180) && player_obj.y >= 180)
    {
		camera_set_view_pos(view_camera[0], x, player_obj.y - (viewY / 2));
    }
    else
    {
        if (player_obj.y >= (room_height - 180))
        {
			camera_set_view_pos(view_camera[0], x, (room_height - 180) - (viewY/2));
        }
        if (player_obj.y <= 180)
        {
			camera_set_view_pos(view_camera[0], x, 180 - (viewY/2));
        }
    }
}
