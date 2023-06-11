/// @description Falling Script

if (falling)
{
	sprite_index = fakeForestGround2_spr;
	destroyTimer -= global.dt;
}

if (destroyTimer < 0)
{
	instance_destroy();
}