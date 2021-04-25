/// @description Vars

//Movement
horspeed = 0;
verspeed = 0;

//Stats
hp = 50;
colliding = true;
level = 1;
moneyDropMin = 1;
moneyDropMax = 2;
damage = 0;
knockback = 0;
playerSightMax = 128;
playerSightMin = 32;

animationSpeed = 0.5;
savePosX = x;
savePosY = y;
attackCooldown = 300;
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
movSpeed = 0.1;
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
gravityStrengthSave = gravityStrength;

headshotHitbox = instance_create_layer(x, y - 16, "Instances", headshotHitbox_obj);
with (headshotHitbox)
{
	body = instance_nearest(x, y, zombieGirlWounded_obj);
}

checkPlayerTimer = 50;
checkPlayerTimerSave = checkPlayerTimer;
checkPlayerTimer = 0;
gravityStrength = 0;
