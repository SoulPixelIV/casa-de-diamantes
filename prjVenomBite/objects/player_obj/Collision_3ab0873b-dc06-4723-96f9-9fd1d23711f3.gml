/// @description Damage Detection

if (!damageRecieved && !isZombie)
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