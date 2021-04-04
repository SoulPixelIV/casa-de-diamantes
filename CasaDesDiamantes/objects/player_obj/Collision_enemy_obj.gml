/// @description Damage Detection

if (hp > 0)
{
	if (!damageRecieved && !isZombie)
	{
		nextEnemy = instance_nearest(x, y, enemy_obj);
		if (nextEnemy.x > x)
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
			hpOld = hp;
			hp -= other.damage;
			damageCooldown = damageCooldownSave;
			damageRecieved = true;
			if (!audio_is_playing(moan1_snd) && !audio_is_playing(moan2_snd))
			{
				audio_play_sound(choose(moan1_snd, moan2_snd), 1, false);
			}
			camera_obj.hitVignette = true;
		}
	}
}