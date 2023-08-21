var enemyTarget = instance_place(x, y, enemy_obj);
if (instance_exists(enemyTarget))
{
	if (!dealtDamage && other.hitable)
	{
		enemyTarget.lastBullet = bulletShotgun_obj;
		enemyTarget.damageTint = true;
		enemyTarget.hp -= 6 * damageMultiplier;
		enemyTarget.headshot = false;
		enemyTarget.aggro = true;
		penetration--;
		bloodSpread = instance_create_layer(x, y, "Instances", bloodSpread_obj);
		bloodSpread.image_angle = image_angle;
		bloodSpread2 = instance_create_layer(x, y, "Instances", bloodSpread2_obj);
		bloodSpread2.image_angle = image_angle;
		audio_play_sound(bulletHit_snd, 1, false);
		dealtDamage = true;
		
		if (place_meeting(x, y, zombieGirl_obj))
	{
		var rand = choose(1,1,1,1,1,1,1,1,1,1,1,1,1,2);
		if (rand == 2)
		{
			enemyTarget.lostArm = true;
		}
	}
	}
}

if (penetration < 1)
{
	instance_change(bloodSpread_obj, true);
	bloodSpread2 = instance_create_layer(x, y, "Instances", bloodSpread2_obj);
	bloodSpread2.image_angle = image_angle;
}