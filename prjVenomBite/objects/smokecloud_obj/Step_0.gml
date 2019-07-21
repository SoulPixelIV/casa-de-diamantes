/// @description Player Follow

xpos = player_obj.x + lengthdir_x(24, player_obj.dirCursor);
ypos = player_obj.y - 8 + lengthdir_y(24, player_obj.dirCursor);

x = xpos;
y = ypos;

dt = (delta_time / 1000000) * globalSettings_obj.TARGET_FRAMERATE;
image_alpha -= dt / 40;
