var hitbox = instance_place(x, y, headshotHitbox_obj);
var enemyTarget;
with (hitbox)
{
	enemyTarget = instance_place(x, y, enemy_obj);
}
if (!dealtDamage)
{
	enemyTarget.hp -= 120;
	penetration--;
	instance_create_layer(x, y, "Instances", bloodSpread_obj);
	dealtDamage = true;
}

if (penetration < 1)
{
	instance_change(bloodSpread_obj, true);
}