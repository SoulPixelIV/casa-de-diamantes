/// @description Damage Detection
if (hp > 0)
{
	if (!damageRecieved && !isZombie)
	{
		nextExplosion = instance_nearest(x, y, explosionParent_obj);
		if (nextExplosion.x > x)
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
		if (!other.dealtDamage)
		{
			hpOld = hp;
			hp -= other.damage;
			damageCooldown = damageCooldownSave;
			if (other.damage != 0)
			{
				damageRecieved = true;
				if (!audio_is_playing(moan1_snd) && !audio_is_playing(moan2_snd))
				{
					audio_play_sound(choose(moan1_snd, moan2_snd), 1, false);
				}
				camera_obj.hitVignette = true;
			}
			other.dealtDamage = true;
		}
	}
}
