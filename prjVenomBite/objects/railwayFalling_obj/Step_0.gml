if (distance_to_object(player_obj) < 5)
{
	falling = true;
}

if (falling)
{
	fallingTimer -= global.dt;
}

if (fallingTimer < 0)
{
	y += global.dt / 1.5;
	image_alpha -= global.dt / 160;
}

if (image_alpha < 0.02)
{
	instance_destroy();
}