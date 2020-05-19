/// @description Vars

horspeed = 0;
verspeed = 0;
attackCooldown = 550;
attackDelay = 50;
hp = 130;
level = 2;
hpBucket = 40;
damage = 40;
playerSightMax = 196;
playerSightMin = 0;

animationSpeed = 0.5;
bucketRemoved = false;
delay = false;
damageCollision = true;
attackInProg = false;
points = 125;
knockback = 2.25;
movSpeed = 0.178;
playedSound = false;
gravityStrength = -0.05;
movement = true;
savePosX = x;
savePosY = y;
damageTint = false;
damageTintTimer = 15;

//Help Vars
attackCooldownSave = attackCooldown;
damageTintTimerSave = damageTintTimer;

bucketHitbox = instance_create_layer(x, y - 16, "Instances", bucketHitbox_obj);
with (bucketHitbox)
{
	body = instance_nearest(x, y, zombieBucketGirl_obj);
}
