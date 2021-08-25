elevator = noone;

if (instance_exists(goldenElevatorDirtyForeground_obj))
{
	elevator = instance_nearest(x, y, goldenElevatorDirtyForeground_obj);
}
else
{
	elevator = instance_nearest(x, y, goldenElevatorForeground_obj);
}

animationSpeed = 1;
dist = distance_to_object(elevator);
