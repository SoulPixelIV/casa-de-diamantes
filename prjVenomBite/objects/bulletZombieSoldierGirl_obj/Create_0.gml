/// @description Variables

movSpeed = 5.2;
createdFire = false;
invincibilityTimer = 5;

body = instance_nearest(x, y, zombieSoldierGirl_obj);
if (body.image_xscale == -1)
{
	dir = 180;
}
else
{
	dir = 0;
}

move_towards_point(body.playerPosX, body.playerPosY, movSpeed * global.dt);
image_angle = point_direction(x, y, body.playerPosX, body.playerPosY);