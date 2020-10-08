//Movement
horspeed = 0;
verspeed = 0;
gravityStrength = -0.05;

movSpeed = 0.85;
movSpeedGrad = 0;
aggro = false;
dir = 0;
checkedWaypoint = true;

animationSpeed = 0.5;

if (instance_exists(waypoint))
{
	checkedWaypoint = false;
}
