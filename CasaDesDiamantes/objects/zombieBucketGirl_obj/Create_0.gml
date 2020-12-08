/// @description Vars

horspeed = 0;
verspeed = 0;
attackCooldown = 550;
attackDelay = 50;
hp = 130;
colliding = true;
level = 2;
hpBucket = 40;
damage = 0;
moneyDropMin = 5;
moneyDropMax = 13;
knockback = 0;
playerSightMax = 196;
playerSightMin = 8;
randAttack = 1;

animationSpeed = 0.5;
bucketRemoved = false;
delay = false;
damageCollision = false;
attackInProg1 = false;
attackInProg2 = false;
points = 125;
movSpeed = 0.178;
playedSound = false;
gravityStrength = -0.05;
movement = true;
savePosX = x;
savePosY = y;
damageTint = false;
damageTintTimer = 15;
headshot = false;

//Help Vars
attackCooldownSave = attackCooldown;
damageTintTimerSave = damageTintTimer;

bucketHitbox = instance_create_layer(x, y - 16, "Instances", bucketHitbox_obj);
with (bucketHitbox)
{
	body = instance_nearest(x, y, zombieBucketGirl_obj);
}
