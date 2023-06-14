/// @description Falling Script

if (falling)
{
	sprite_index = fakeForestGround2_spr;
	destroyTimer -= global.dt;
	with (plantBoss_obj) {
		startBattle = false;
	}
}

if (destroyTimer < 0)
{
	instance_destroy();
}