animationSpeed = 0;
aimDelay = 230;
shootDelay = 5;
throttle = false;
hp = 70;
damage = 0;
moneyDropMin = 3;
moneyDropMax = 7;
colliding = false;
hitable = true;
knockback = 0;
damageCollision = false;
dontRespawn = true;
firstSpinDone = false;

setTarget = false;
damageTint = false;
damageTintTimer = 15;

damageTintTimerSave = damageTintTimer;

if (instance_exists(player_obj))
{
	targetX = player_obj.x;
	targetY = player_obj.y;
}