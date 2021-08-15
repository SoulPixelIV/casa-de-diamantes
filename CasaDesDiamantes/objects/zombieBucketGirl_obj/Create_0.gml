/// @description Vars

horspeed = 0;
verspeed = 0;
attackCooldown = 465;
attackDelay = 50;
colliding = true;
hitable = true;
level = 2;
damage = 0;
moneyDropMin = 5;
moneyDropMax = 13;
knockback = 0;
randAttack = 1;
gotSpawned = false;

lastBullet = bulletPistol_obj;
ammoSpawnCount = 7;
animationSpeed = 0.5;
bucketRemoved = false;
delay = false;
damageCollision = false;
attackInProg1 = false;
attackInProg2 = false;
points = 125;
movSpeed = 0.24;
playedSound = false;
gravityStrength = -0.05;
movement = true;
savePosX = x;
savePosY = y;
damageTint = false;
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
damageTintTimerSave = damageTintTimer;
gravityStrengthSave = gravityStrength;

bucketHitbox = instance_create_layer(x, y - 16, "Instances", bucketHitbox_obj);
with (bucketHitbox)
{
	body = instance_nearest(x, y, zombieBucketGirl_obj);
}

checkPlayerTimer = 50;
checkPlayerTimerSave = checkPlayerTimer;
checkPlayerTimer = 0;
gravityStrength = 0;
