/// @description Camera Movement

xCoor = player_obj.x - (viewX / 2);
yCoor = player_obj.y - (viewY / 2);

camera_set_view_size(view_camera[0], viewX, viewY);
camera_set_view_pos(view_camera[0], player_obj.x - (viewX / 2), player_obj.y - (viewY / 2));


