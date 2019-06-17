var enemyTarget = instance_place(x, y, enemy_obj);
if (!dealtDamage)
{
	enemyTarget.hp -= 10;
	dealtDamage = true;
	instance_change(bloodSpread_obj, true);
}

