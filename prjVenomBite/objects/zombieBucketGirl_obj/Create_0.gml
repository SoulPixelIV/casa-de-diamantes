/// @description Vars

horspeed = 0;
verspeed = 0;
attackCooldown = 300;
attackDelay = 50;
hp = 225;
level = 2;
hpBucket = 75;
damage = 40;
playerSightMax = 196;
playerSightMin = 0;

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

//Help Vars
attackCooldownSave = attackCooldown;
attackDelaySave = attackDelay;

bucketHitbox = instance_create_layer(x, y - 16, "Instances", bucketHitbox_obj);
with (bucketHitbox)
{
	body = instance_nearest(x, y, zombieBucketGirl_obj);
}
