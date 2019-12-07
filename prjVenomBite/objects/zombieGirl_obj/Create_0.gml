/// @description Vars

horspeed = 0;
verspeed = 0;
hp = 100;
level = 1;
moneyDropMin = 1;
moneyDropMax = 4;
damage = 15;
attackCooldown = 200;
attackRecoilTimer = 50;
attackInProg = false;
attackBoost = false;
damageCollision = true;
points = 125;
knockback = 5;
movSpeed = 0.45;
gravityStrength = -0.32;

attackCooldownSave = attackCooldown;
attackRecoilTimerSave = attackRecoilTimer;

headshotHitbox = instance_create_layer(x, y - 16, "Instances", headshotHitbox_obj);
with (headshotHitbox)
{
	body = instance_nearest(x, y, zombieGirl_obj);
}
