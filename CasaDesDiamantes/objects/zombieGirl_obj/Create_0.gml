/// @description Vars

//Movement
horspeed = 0;
verspeed = 0;

//Stats
colliding = true;
level = 1;
moneyDropMin = 1;
moneyDropMax = 4;
damage = 23;
knockback = 0;

animationSpeed = 0.5;
savePosX = x;
savePosY = y;
attackCooldown = 250;
delay = false;
isDashing = false;
attackDelay = 50;
boostSpeed = 2.05;
attackInProg = false;
attackInProg2 = false;
dashed = false;
damageCollision = false;
spawnedHitbox = false;
points = 125;
movSpeed = 0.15;
movement = true;
gravityStrength = -0.05;
damageTint = false;
damageTintHeadshot = false;
damageTintTimer = 15;
headshot = false;
aggro = false;
aggroTimer = 130;
deaggroTimer = 3000;
exclamationmarkTimer = 250;

//Help Vars
aggroTimerSave = aggroTimer;
deaggroTimerSave = deaggroTimer;
exclamationmarkTimerSave = exclamationmarkTimer;
attackCooldownSave = attackCooldown;
attackDelaySave = attackDelay;
damageTintTimerSave = damageTintTimer;

headshotHitbox = instance_create_layer(x, y - 16, "Instances", headshotHitbox_obj);
with (headshotHitbox)
{
	body = instance_nearest(x, y, zombieGirl_obj);
}