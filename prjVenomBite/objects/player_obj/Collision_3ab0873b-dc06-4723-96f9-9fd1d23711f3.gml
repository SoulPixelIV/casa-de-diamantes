/// @description Damage Detection

if (!damageRecieved && !isZombie)
{
	if (other.damageCollision)
	{
		hp -= other.damage;
	}

	if (horspeed > 0)
	{
		horspeed = -other.knockback;
	}
	else if (horspeed = 0)
	{
		verspeed = -other.knockback;
	}
	else
	{
		horspeed = other.knockback;
	}
	damageCooldown = damageCooldownSave;
	damageRecieved = true;
}