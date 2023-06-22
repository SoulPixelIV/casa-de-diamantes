/// @description Falling Script

if (falling)
{
	sprite_index = fakeForestGround2_spr;
	destroyTimer -= global.dt;
	with (plantBoss_obj) {
		startBattle = false;
		moveToSecondFloor = true;
		hp = 64;
	}
	with (plantBossBackground_obj) {
		moveToSecondFloor = true;
	}
}

if (destroyTimer < 0)
{
	instance_destroy();
}