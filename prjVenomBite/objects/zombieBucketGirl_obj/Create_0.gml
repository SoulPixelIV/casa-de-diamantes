/// @description Vars

horspeed = 0;
verspeed = 0;
hp = 225;
damage = 35;
points = 125;
knockback = 7;
movSpeed = 0.33;

headshotHitbox = instance_create_layer(x, y - 16, "Instances", headshotHitbox_obj);
with (headshotHitbox)
{
	body = instance_nearest(x, y, zombieBucketGirl_obj);
}
