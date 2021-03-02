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

attackInProg1 = false;
startFire = false;
attackInProg2 = false;
fireballInstance = noone;
attackCooldown = 180;
attackDelay1 = 450;
attackDelay2 = 700;
delay1 = false;
delay2 = false;
aggro = false;
aggroTimer = 130;
deaggroTimer = 3000;
exclamationmarkTimer = 250;

light = noone;
hitbox = noone;

attackCooldownSave = attackCooldown;
attackDelay1Save = attackDelay1;
attackDelay2Save = attackDelay2;

aggroTimerSave = aggroTimer;
deaggroTimerSave = deaggroTimer;
exclamationmarkTimerSave = exclamationmarkTimer;
useDelayTimerSave = useDelayTimer;

animationSpeed = 0.5;

if (instance_exists(waypoint))
{
	checkedWaypoint = false;
}
