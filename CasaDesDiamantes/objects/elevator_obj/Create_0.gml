/// @description Image Speed
image_speed = 0;
image_index = 0;

used = false;
animationSpeed = 0.2;
elevatorTimer = 600;

if (instance_exists(elevatorSign_obj)) {
	elevSign = instance_nearest(x, y, elevatorSign_obj);
}
