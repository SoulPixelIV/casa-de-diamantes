/// @description Vars

horspeed = 0;
verspeed = 0;
hp = 85;
level = 1;
moneyDropMin = 3;
moneyDropMax = 7;
attackCooldown = 180;
damage = 15;
damageCollision = true;
points = 125;
knockback = 1.25;
movSpeed = 0.08;
playedSound = false;
movement = true;
gravityStrength = -0.05;
savePosX = x;
savePosY = y;
randAttack = 1;
attackInProg1 = false;
attackInProg2 = false;
damageTint = false;
damageTintTimer = 15;

attackCooldownSave = attackCooldown;
damageTintTimerSave = damageTintTimer;

headshotHitbox = instance_create_layer(x, y - 16, "Instances", headshotHitbox_obj);
with (headshotHitbox)
{
	body = instance_nearest(x, y, zombieSoldierGirl_obj);
}
