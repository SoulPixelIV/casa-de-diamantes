/// @description Player Follow

xpos = player_obj.x + lengthdir_x(24, player_obj.dirCursor);
ypos = player_obj.y - 8 + lengthdir_y(24, player_obj.dirCursor);

x = xpos;
y = ypos;

image_alpha -= global.dt / 80;

//Animation
image_speed = 0;
image_index += (global.dt / 12);
