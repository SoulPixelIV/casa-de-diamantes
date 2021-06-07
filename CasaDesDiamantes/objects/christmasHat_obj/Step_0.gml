originX = player_obj.x - 2 * image_xscale;
originY = player_obj.y;

image_angle = player_obj.playerRotation;
image_xscale = player_obj.image_xscale;
theta = player_obj.playerRotation + 90;

//Animation
image_speed = 0;
image_index = player_obj.image_index;

x = originX + lengthdir_x(radius, theta);
y = originY + lengthdir_y(radius, theta);

if (player_obj.isDashing)
{
	sprite_index = christmasHatDash_spr;
}
else
if (player_obj.spin)
{
	sprite_index = christmasHatSpin_spr;
}
else
{
	sprite_index = christmasHat_spr;
}