/// @description Vars

//Movement
horspeed = 0;
verspeed = 0;

//Stats
hp = 40;
colliding = true;
hitable = true;
moneyDropTimer = 95;
level = 1;
damage = 0;
knockback = 0;
playerSightMax = 128;
playerSightMin = 32;
gotSpawned = false;

lastBullet = bulletPistol_obj;
ammoSpawnCount = 8;
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
points = 500;
movSpeed = 0.3;
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
moneyDropTimerSave = moneyDropTimer;

checkPlayerTimer = 50;
checkPlayerTimerSave = checkPlayerTimer;
checkPlayerTimer = 0;
gravityStrength = 0;

blend = image_blend;
image_xscale = 0.5;
image_yscale = 0.5;

spawnDelay = 54;
alarm[0] = spawnDelay;

alarmLight = instance_create_layer(x, y, "GraphicsLayer", spotlightYellowSmall_obj); 

with (alarmLight)
{
	body = instance_nearest(x, y, zombieGirlWounded_obj);
}
