/// @description Image Speed
image_speed = 0;
image_index = 0;

used = false;
target = 0;
playerSpawned = false;
animationSpeed = 0.2;
elevatorTimer = 300;
blackscreenTimer = 250;
blackscreenTimer2 = 100;
playedSound = false;

blackscreenTimerSave = blackscreenTimer;
blackscreenTimer2Save = blackscreenTimer2;
elevatorTimerSave = elevatorTimer;

if (instance_exists(elevatorSign_obj)) {
	elevSign = instance_nearest(x, y, elevatorSign_obj);
}
