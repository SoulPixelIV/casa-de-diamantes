/// @description Vars

//Movement
horspeed = 0;
verspeed = 0;
if (image_xscale == 1)
{
	dir = 0;
}
else
{
	dir = 1;
}

//Stats
hp = 1;
damageRes = 1;
colliding = true;
hitable = true;
frozen = false;
freezeRes = 1;
level = 1;
movSpeed = 0;
moneyDropMin = 3;
moneyDropMax = 8;
damage = 0;
knockback = 0;
playerSightMax = 128;
playerSightMin = 8;
gotSpawned = false;
points = 250;
icecicleAttackTimer = 200;

lastBullet = bulletPistol_obj;
ammoSpawnCount = 1;
animationSpeed = 0.5;
savePosX = x;
savePosY = y;
movement = true;
damageTint = false;
damageCollision = false;
damageTintTimer = 15;
headshot = false;
open = false;

//Help Vars
damageTintTimerSave = damageTintTimer;
gravityStrengthSave = gravityStrength;
movSpeedSave = movSpeed;

alarmLight = instance_create_layer(x, y, "GraphicsLayer", spotlightRed_obj); 
with (alarmLight)
{
	body = instance_nearest(x, y, explosiveMerchantDead_obj);
}

checkPlayerTimer = 50;
checkPlayerTimerSave = checkPlayerTimer;
checkPlayerTimer = 0;

if (gravityStrength != 0)
{
	firstFall = true;
}
else
{
	firstFall = false;
}