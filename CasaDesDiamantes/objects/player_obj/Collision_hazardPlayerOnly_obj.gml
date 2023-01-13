/// @description Damage Detection

if (hp > 0 && !inChamber)
{
	if (!damageRecieved && !isZombie)
	{
		nextHazard = instance_nearest(x, y, hazard_obj);
		if (instance_exists(nextHazard))
		{
			if (nextHazard.x > x)
			{
				horspeed -= other.knockback;
			}
			else
			{
				horspeed += other.knockback;
			}
		}
	}

	if (!damageRecieved && !isZombie && !invincible)
	{
		if (other.damageCollision)
		{
			hpOld = hp;
			if (!plagueTransformation)
			{
				hp -= other.damage;
			}
			else
			{
				hp -= other.damage / 2;
			}
			damageCooldown = damageCooldownSave;
			damageRecieved = true;
			if (!audio_is_playing(moan1_snd) && !audio_is_playing(moan2_snd))
			{
				audio_play_sound(choose(moan1_snd, moan2_snd), 1, false);
			}
			camera_obj.hitVignette = true;
		}
	}
	
	if (invincible && invincibleHitCooldown < 0) {
		if (!audio_is_playing(glitter_snd))
		{
			var glittersnd = audio_play_sound(glitter_snd, 1, false);
			audio_sound_pitch(glittersnd, random_range(0.9, 1.1));
		}
		partEmitter = part_emitter_create(global.partSystem);
		part_emitter_region(global.partSystem, partEmitter, player_obj.x - 32, player_obj.x + 32, player_obj.y + 8, player_obj.y + 32, ps_shape_ellipse, ps_distr_linear);
		part_emitter_burst(global.partSystem, partEmitter, global.playerPart, 50);
		part_emitter_destroy(global.partSystem, partEmitter);
		invincibleHitCooldown = invincibleHitCooldownSave;
	}
}