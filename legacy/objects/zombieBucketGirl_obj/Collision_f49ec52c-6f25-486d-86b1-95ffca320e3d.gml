/// @description Crush

with (bucketHitbox)
{
	instance_destroy();
}
global.scorepoints += points * global.multiplier;
global.multiplier += 1;
global.multiplierTimer = 300;
gameManager_obj.multiplierRun = true;
camera_obj.scoreShake = true;
instance_destroy();
