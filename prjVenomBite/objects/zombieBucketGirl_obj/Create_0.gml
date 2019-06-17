/// @description Vars

horspeed = 0;
verspeed = 0;
hp = 225;
hpBucket = 75;
damage = 35;
points = 125;
knockback = 7;
movSpeed = 0.33;
playedSound = false;

bucketHitbox = instance_create_layer(x, y - 16, "Instances", bucketHitbox_obj);
with (bucketHitbox)
{
	body = instance_nearest(x, y, zombieBucketGirl_obj);
}
