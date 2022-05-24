/// @description Vars

horspeed = 0;
verspeed = 0;
attackCooldown = 465;
attackDelay = 50;
colliding = true;
hitable = true;
level = 2;
damage = 0;
moneyDropMin = 3;
moneyDropMax = 6;
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
hitboxFlowerAttack = noone;
points = 430;
movSpeed = 0.41;
playedSound = false;
gravityStrength = -0.05;
movement = true;
savePosX = x;
savePosY = y;
damageTint = false;
attackTint = false;
damageTintTimer = 15;
attackTintTimer = 15;
attackTintDelay = 10;
headshot = false;
aggro = false;
aggroTimer = 130;
deaggroTimer = 3000;
exclamationmarkTimer = 250;

attack1PrepareTimer = 300; //Timer before snap attack begins
attack1StopTimer = 200; //Timer after snap attack begins
snapAttack = false; //Snap Attack is happening

attack2PrepareTimer = 250; //Timer before snap attack begins
attack2StopTimer = 150; //Timer after snap attack begins
snapAttack2 = false; //Snap Attack is happening

snapHitboxDelay = 35; //Delay until damage hitbox spawns
snapHitbox2Delay = 45; //Delay until damage hitbox spawns

//Help Vars
aggroTimerSave = aggroTimer;
deaggroTimerSave = deaggroTimer;
exclamationmarkTimerSave = exclamationmarkTimer;
attackCooldownSave = attackCooldown;
attackDelaySave = attackDelay;
damageTintTimerSave = damageTintTimer;
attackTintTimerSave = attackTintTimer;
attackTintDelaySave = attackTintDelay;
attackTintDelay = -1;
gravityStrengthSave = gravityStrength;

attack1PrepareTimerSave = attack1PrepareTimer;
attack1StopTimerSave = attack1StopTimer;
snapHitboxDelaySave = snapHitboxDelay;

attack2PrepareTimerSave = attack2PrepareTimer;
attack2StopTimerSave = attack2StopTimer;
snapHitbox2DelaySave = snapHitbox2Delay;

blend = image_blend;

bucketHitbox = instance_create_layer(x, y - 16, "Instances", bucketHitbox_obj);
with (bucketHitbox)
{
	body = instance_nearest(x, y, zombieBucketGirl_obj);
}

checkPlayerTimer = 50;
checkPlayerTimerSave = checkPlayerTimer;
checkPlayerTimer = 0;
gravityStrength = 0;
