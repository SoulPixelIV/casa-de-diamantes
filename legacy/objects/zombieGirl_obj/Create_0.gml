/// @description Vars

//Movement
horspeed = 0;
verspeed = 0;

//Stats
hp = 100;
level = 1;
moneyDropMin = 1;
moneyDropMax = 4;
damage = 35;
knockback = 2.1;
playerSightMax = 128;
playerSightMin = 8;

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
movSpeed = 0.15;
movement = true;
gravityStrength = -0.05;
damageTint = false;
damageTintTimer = 15;
headshot = false;

//Help Vars
attackCooldownSave = attackCooldown;
attackDelaySave = attackDelay;
damageTintTimerSave = damageTintTimer;

headshotHitbox = instance_create_layer(x, y - 16, "Instances", headshotHitbox_obj);
with (headshotHitbox)
{
	body = instance_nearest(x, y, zombieGirl_obj);
}