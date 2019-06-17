/// @description Variables

movSpeed = 12.4

body = instance_nearest(x, y, zombieSoldierGirl_obj);
if (body.image_xscale == -1)
{
	dir = 180;
}
else
{
	dir = 0;
}