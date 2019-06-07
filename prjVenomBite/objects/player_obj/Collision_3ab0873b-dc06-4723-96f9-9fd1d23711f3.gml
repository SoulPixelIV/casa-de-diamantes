/// @description Damage Detection

if (!damageRecieved)
{
	hp -= other.damage;

	if (hspeed > 0)
	{
		hspeed = -other.knockback;
	}
	else
	{
		hspeed = other.knockback;
	}
	damageCooldown = damageCooldownSave;
	damageRecieved = true;
}