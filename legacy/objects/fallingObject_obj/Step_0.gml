/// @description Falling Script

if (falling)
{
	y += global.dt / 2;
}

if (!place_free(x, y))
{
    falling = false;
	instance_destroy();
}