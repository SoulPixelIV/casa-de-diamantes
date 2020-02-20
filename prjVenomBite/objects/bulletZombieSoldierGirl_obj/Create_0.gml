/// @description Variables

movSpeed = 5.2;
createdFire = false;

move_towards_point(player_obj.x, player_obj.y, movSpeed * dt);
image_angle = point_direction(x, y, player_obj.x, player_obj.y);

body = instance_nearest(x, y, zombieSoldierGirl_obj);
if (body.image_xscale == -1)
{
	dir = 180;
}
else
{
	dir = 0;
}