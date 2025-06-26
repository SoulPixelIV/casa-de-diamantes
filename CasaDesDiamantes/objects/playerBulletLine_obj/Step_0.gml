/// @description Movement
/*
originX = player_obj.x;
originY = player_obj.y;

theta = player_obj.dirCursor;

if (theta > 90 && theta < 270) {
	theta = clamp(theta, 90, 245);
} 
if (theta > 270 && theta < 360) {
	theta = clamp(theta, 295, 360);
}
if (theta > 0 && theta < 14) {
	theta = player_obj.dirCursor;
}
if (theta > 14 && theta < 90) {
	theta = clamp((theta - 21 * -player_obj.currDir) + 20 * clamp(theta, 0, 90) / 90, 90, 250);
}

x = originX + lengthdir_x(radius, theta);
y = originY + lengthdir_y(radius, theta); */

if (instance_exists(player_obj)) {
	x = player_obj.x;
	y = player_obj.y - 5;
	image_angle = player_obj.dirCursor;
}