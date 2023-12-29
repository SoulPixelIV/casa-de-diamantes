/// @description Vars

//Movement
horspeed = 0;
verspeed = 0;
dir = 0;

//Stats
hp = 1;
damageRes = 1;
colliding = true;
hitable = true;
frozen = false;
freezeRes = 3;
level = 1;
movSpeed = 0.42;
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
gravityStrength = -0.05;
damageTint = false;
damageCollision = false;
damageTintTimer = 15;
headshot = false;
aggro = false;
aggroTimer = 130;
deaggroTimer = 3000;
exclamationmarkTimer = 250;
checkedPlayer = false;
flying = false;
exploding = false;
flyDir = 1;

//Help Vars
aggroTimerSave = aggroTimer;
deaggroTimerSave = deaggroTimer;
exclamationmarkTimerSave = exclamationmarkTimer;
damageTintTimerSave = damageTintTimer;
gravityStrengthSave = gravityStrength;
movSpeedSave = movSpeed;

blend = image_blend;

alarmLight = instance_create_layer(x, y, "GraphicsLayer", spotlightRed_obj); 

with (alarmLight)
{
	body = instance_nearest(x, y, explosiveMerchant_obj);
}

checkPlayerTimer = 50;
checkPlayerTimerSave = checkPlayerTimer;
checkPlayerTimer = 0;
gravityStrength = 0;
