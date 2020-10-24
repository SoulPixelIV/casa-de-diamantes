/// @description Damage Detection

if (hp > 0)
{
	if (!damageRecieved && !isZombie)
	{
		if (horspeed > 0)
		{
			horspeed -= other.knockback;
		}
		else
		{
			horspeed += other.knockback;
		}
	}

	if (!damageRecieved && !isZombie && !invincible)
	{
		if (other.damageCollision)
		{
			hp -= other.damage;
			damageCooldown = damageCooldownSave;
			damageRecieved = true;
			if (!audio_is_playing(moan1_snd) && !audio_is_playing(moan2_snd))
			{
				audio_play_sound(choose(moan1_snd, moan2_snd), 1, false);
			}
		}
	}
}