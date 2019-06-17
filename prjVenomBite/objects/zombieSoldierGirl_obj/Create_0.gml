/// @description Vars

horspeed = 0;
verspeed = 0;
hp = 85;
attackCooldown = 150;
damage = 5;
points = 125;
knockback = 13;
movSpeed = 0.57;
playedSound = false;

attackCooldownSave = attackCooldown;

headshotHitbox = instance_create_layer(x, y - 16, "Instances", headshotHitbox_obj);
with (headshotHitbox)
{
	body = instance_nearest(x, y, zombieSoldierGirl_obj);
}
