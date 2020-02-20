//Death
if (hp < 0)
{
	global.scorepoints += points * global.multiplier;
	global.multiplier += 1;
	global.multiplierTimer = 300;
	gameManager_obj.multiplierRun = true;
	camera_obj.scoreShake = true;
	camera_obj.vignetteStrength = 3;
	instance_change(explosion_obj, true);
}

if (hp < 50)
{
	hp -= global.dt / 12;
}