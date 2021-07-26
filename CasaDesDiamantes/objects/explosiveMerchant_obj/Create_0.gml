/// @description Vars

//Movement
horspeed = 0;
verspeed = 0;
dir = 0;

//Stats
hp = 40;
colliding = true;
hitable = true;
level = 1;
movSpeed = 0.033;
moneyDropMin = 7;
moneyDropMax = 15;
damage = 0;
knockback = 0;
playerSightMax = 128;
playerSightMin = 8;
gotSpawned = false;

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

//Help Vars
aggroTimerSave = aggroTimer;
deaggroTimerSave = deaggroTimer;
exclamationmarkTimerSave = exclamationmarkTimer;
damageTintTimerSave = damageTintTimer;
gravityStrengthSave = gravityStrength;

barrelHitbox = instance_create_layer(x + 9, y, "ForegroundObjects", barrelHitbox_obj);
alarmLight = instance_create_layer(x, y, "GraphicsLayer", spotlightRed_obj); 
with (barrelHitbox)
{
	image_yscale = 2.2;
	image_angle = -24;
	body = instance_nearest(x, y, explosiveMerchant_obj);
}
with (alarmLight)
{
	body = instance_nearest(x, y, explosiveMerchant_obj);
}

if (!gotSpawned)
{
	spawn = instance_create_layer(x, y, "Instances", enemyHiddenSpawnpoint_obj);
	spawn.hp = hp;
	spawn.aggroRange = aggroRange;
	spawn.spawnID = explosiveMerchant_obj;
	spawn.dir = image_xscale;
}

checkPlayerTimer = 50;
checkPlayerTimerSave = checkPlayerTimer;
checkPlayerTimer = 0;
gravityStrength = 0;
