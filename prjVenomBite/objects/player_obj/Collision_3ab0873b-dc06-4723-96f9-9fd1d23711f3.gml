/// @description Damage Detection

if (!damageRecieved)
{
	hp -= other.damage;

	if (horspeed > 0)
	{
		horspeed = -other.knockback;
	}
	else
	{
		horspeed = other.knockback;
	}
	damageCooldown = damageCooldownSave;
	damageRecieved = true;
}