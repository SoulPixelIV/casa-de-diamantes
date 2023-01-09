animationSpeed = 0.75;
verspeed = 0;
speedVer = 0.05;
dir = 0;
movTimer = 200;
movTimerSave = movTimer;

spawnDelay = 156;
alarm[0] = spawnDelay;

if (global.hasWarpzoneKey) {
	instance_destroy();
}