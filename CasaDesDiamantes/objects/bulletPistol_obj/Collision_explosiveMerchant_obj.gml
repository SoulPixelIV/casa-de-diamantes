var enemyTarget = instance_place(x, y, explosiveMerchant_obj);
if (!dealtDamage && instance_exists(enemyTarget) && other.hitable)
{
	enemyTarget.lastBullet = bulletDualBarettas_obj;
	enemyTarget.damageTint = true;
	enemyTarget.hp -= 7;
	enemyTarget.headshot = false;
	enemyTarget.aggro = true;
	penetration--;
	bloodSpread = instance_create_layer(x, y, "Instances", bloodSpread_obj);
	bloodSpread.image_angle = image_angle;
	bloodSpread2 = instance_create_layer(x, y, "Instances", bloodSpread2_obj);
	bloodSpread2.image_angle = image_angle;
	audio_play_sound(bulletHit_snd, 1, false);
	dealtDamage = true;
}

if (penetration < 1)
{
	instance_change(bloodSpread_obj, true);
	bloodSpread2 = instance_create_layer(x, y, "Instances", bloodSpread2_obj);
	bloodSpread2.image_angle = image_angle;
}
