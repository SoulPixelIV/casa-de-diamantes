var enemyTarget = instance_place(x, y, enemy_obj);
if (!dealtDamage)
{
	enemyTarget.hp -= 85;
	penetration--;
	instance_create_layer(x, y, "Instances", bloodSpread_obj);
	dealtDamage = true;
}

if (penetration < 1)
{
	instance_change(bloodSpread_obj, true);
}