/// @description Damage Detection

if (hp > 0 && !inChamber)
{
	if (!damageRecieved && !isZombie)
	{
		nextHazard = instance_nearest(x, y, hazard_obj);
		if (!isDashing) {
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
	
	if (!place_meeting(x, y, enemyBlockZone_obj)) {
		if (invincible && invincibleHitCooldown < 0) {
			if (invincible && invincibleHitCooldown < 0 && dodgeRewardTimer < 0) {
				audio_play_sound(ding_snd, 1, false);
				repeat(choose(2, 3)) {
					instance_create_layer(x, y, "Instances", chipBluePickup_obj);
				}
				dodgeRewardTimer = dodgeRewardTimerSave;
			}
		}
	}
}