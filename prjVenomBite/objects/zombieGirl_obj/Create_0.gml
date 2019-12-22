/// @description Vars

//Movement
horspeed = 0;
verspeed = 0;

//Stats
hp = 100;
level = 1;
moneyDropMin = 1;
moneyDropMax = 4;
damage = 15;
playerSightMax = 128;
playerSightMin = 16;

attackCooldown = 100;
delay = false;
isDashing = false;
attackDelay = 25;
boostSpeed = 4.2;
attackInProg = false;
dashed = false;
damageCollision = false;
points = 125;
knockback = 5;
movSpeed = 0.45;
gravityStrength = -0.32;

//Help Vars
attackCooldownSave = attackCooldown;
attackDelaySave = attackDelay;

headshotHitbox = instance_create_layer(x, y - 16, "Instances", headshotHitbox_obj);
with (headshotHitbox)
{
	body = instance_nearest(x, y, zombieGirl_obj);
}
