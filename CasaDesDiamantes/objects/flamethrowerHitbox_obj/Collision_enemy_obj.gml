var enemyTarget = instance_place(x, y, enemy_obj);
if (!dealtDamage && instance_exists(enemyTarget) && other.hitable)
{
	if (variable_instance_exists(enemyTarget, "burnt")) {
		enemyTarget.burnt = true;
	}
	enemyTarget.damageTint = true;
	enemyTarget.hp -= 4 / enemyTarget.damageRes;
	enemyTarget.headshot = false;
	enemyTarget.aggro = true;
	bloodSpread = instance_create_layer(x, y, "Instances", bloodSpread_obj);
	bloodSpread.image_angle = image_angle;
	bloodSpread2 = instance_create_layer(x, y, "Instances", bloodSpread2_obj);
	bloodSpread2.image_angle = image_angle;
	audio_play_sound(bulletHit_snd, 1, false);
	dealtDamage = true;
}


