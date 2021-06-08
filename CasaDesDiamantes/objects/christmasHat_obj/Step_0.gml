originX = player_obj.x - 2 * image_xscale;
originY = player_obj.y;

image_angle = player_obj.playerRotation;
image_xscale = player_obj.image_xscale;
if (!player_obj.isDashing)
{
	theta = player_obj.playerRotation + 90;
}
else
{
	theta = 90;
	image_angle = 0;
}

if (player_obj.stillInAir)
{
	theta = 90;
	image_angle = 0;
}

//Animation
image_speed = 0;
image_index = player_obj.image_index;

x = originX + lengthdir_x(radius, theta);
y = originY + lengthdir_y(radius, theta);

sprite_index = christmasHat_spr;

if (player_obj.spin && !player_obj.flip && !player_obj.isDashing)
{
	sprite_index = christmasHatSpin_spr;
}

if (player_obj.isDashing)
{
	sprite_index = christmasHatDash_spr;
}