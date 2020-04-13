/// @description Damage Detection

if (!damageRecieved && !isZombie)
{
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
}

if (!damageRecieved && !isZombie && !invincible)
{
	if (other.damageCollision)
	{
		hp -= other.damage;
	}
	damageCooldown = damageCooldownSave;
	damageRecieved = true;
}