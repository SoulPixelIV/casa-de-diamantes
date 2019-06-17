/// @description Vars

horspeed = 0;
verspeed = 0;
hp = 100;
damage = 15;
points = 125;
knockback = 5;
movSpeed = 0.45;
gravityStrength = -0.32;

headshotHitbox = instance_create_layer(x, y - 16, "Instances", headshotHitbox_obj);
with (headshotHitbox)
{
	body = instance_nearest(x, y, zombieGirl_obj);
}
