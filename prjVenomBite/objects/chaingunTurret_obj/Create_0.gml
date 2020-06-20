animationSpeed = 0;
aimDelay = 230;
shootDelay = 5;
throttle = false;

setTarget = false;
if (instance_exists(player_obj))
{
	targetX = player_obj.x;
	targetY = player_obj.y;
}