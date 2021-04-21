/// @description Falling Script

if (falling)
{
	sprite_index = fallingForestGround2_spr;
	destroyTimer -= global.dt;
}

if (destroyTimer < 0)
{
	instance_destroy();
}

if (distance_to_object(player_obj) < 4)
{
	falling = true;
}