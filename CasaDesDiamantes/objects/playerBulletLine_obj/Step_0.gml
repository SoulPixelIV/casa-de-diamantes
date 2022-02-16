/// @description Movement
originX = player_obj.x;
originY = player_obj.y;

theta = player_obj.dirCursor;

x = originX + lengthdir_x(radius, theta);
y = originY + lengthdir_y(radius, theta);