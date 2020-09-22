//Death
if (hp < 0 || place_meeting(x, y, explosion_obj))
{
	global.scorepoints += points * global.multiplier;
	global.multiplier += 1;
	global.multiplierTimer = 300;
	gameManager_obj.multiplierRun = true;
	camera_obj.scoreShake = true;
	camera_obj.vignetteStrength = 3;
	var colliderTarget = instance_place(x, y, collider_obj);
	instance_destroy(colliderTarget);
	instance_change(explosion_obj, true);
}

if (hp < 50)
{
	hp -= global.dt / 12;
}