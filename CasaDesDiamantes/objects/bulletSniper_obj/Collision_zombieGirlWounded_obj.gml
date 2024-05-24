var enemyTarget = instance_place(x, y, zombieGirlWounded_obj);
if (!dealtDamage && instance_exists(enemyTarget) && other.hitable)
{
	enemyTarget.lastBullet = bulletSniper_obj;
	enemyTarget.damageTint = true;
	enemyTarget.hp -= damage;
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
