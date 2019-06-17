var enemyTarget = instance_place(x, y, enemy_obj);
if (!dealtDamage)
{
	enemyTarget.hp -= 20;
	instance_change(bloodSpread_obj, true);
	dealtDamage = true;
}
