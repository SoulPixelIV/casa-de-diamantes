/// @description Vars

horspeed = 0;
verspeed = 0;
hp = 85;
level = 1;
moneyDropMin = 3;
moneyDropMax = 7;
attackCooldown = 150;
damage = 5;
damageCollision = true;
points = 125;
knockback = 8;
movSpeed = 0.57;
playedSound = false;
gravityStrength = -0.32;

attackCooldownSave = attackCooldown;

headshotHitbox = instance_create_layer(x, y - 16, "Instances", headshotHitbox_obj);
with (headshotHitbox)
{
	body = instance_nearest(x, y, zombieSoldierGirl_obj);
}
