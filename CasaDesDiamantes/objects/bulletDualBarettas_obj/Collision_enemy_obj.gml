var enemyTarget = instance_place(x, y, enemy_obj);
if (!dealtDamage && instance_exists(enemyTarget) && other.hitable)
{
	enemyTarget.lastBullet = bulletDualBarettas_obj;
	enemyTarget.damageTint = true;
	enemyTarget.hp -= 8;
	enemyTarget.headshot = false;
	enemyTarget.aggro = true;
	if (global.dualBarettasUpgrade1) {
		enemyTarget.freezeRes -= 1;
	}
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

if (penetration < 1)
{
	instance_change(bloodSpread_obj, true);
	bloodSpread2 = instance_create_layer(x, y, "Instances", bloodSpread2_obj);
	bloodSpread2.image_angle = image_angle;
}
