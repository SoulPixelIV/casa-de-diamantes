//Movement
horspeed = 0;
verspeed = 0;
gravityStrength = -0.05;

hp = 35;
colliding = false;
knockback = 0;
movSpeed = 0.85;
movSpeedGrad = 0;
moneyDropMin = 1;
moneyDropMax = 3;
damage = 16;
aggro = false;
damageCollision = false;
dir = 0;
checkedWaypoint = true;
usedLever = false;
useDelayTimer = 200;

attackInProg = false;
attackInProg2 = false;
attackCooldown = 180;
attackDelay = 450;
delay = false;

light = noone;
hitbox = noone;

attackCooldownSave = attackCooldown;
attackDelaySave = attackDelay;

useDelayTimerSave = useDelayTimer;

animationSpeed = 0.5;

if (instance_exists(waypoint))
{
	checkedWaypoint = false;
}
