/// @description Vars

horspeed = 0;
verspeed = 0;
hp = 225;
level = 2;
hpBucket = 75;
damage = 35;
damageCollision = true;
points = 125;
knockback = 2.25;
movSpeed = 0.12;
playedSound = false;
gravityStrength = -0.05;
savePosX = x;
savePosY = y;

bucketHitbox = instance_create_layer(x, y - 16, "Instances", bucketHitbox_obj);
with (bucketHitbox)
{
	body = instance_nearest(x, y, zombieBucketGirl_obj);
}
