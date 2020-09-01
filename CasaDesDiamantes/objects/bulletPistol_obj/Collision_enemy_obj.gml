var enemyTarget = instance_place(x, y, enemy_obj);
if (!dealtDamage)
{
	enemyTarget.damageTint = true;
	enemyTarget.hp -= 10;
	enemyTarget.headshot = false;
	bloodSpread = instance_create_layer(x, y, "Instances", bloodSpread_obj);
	bloodSpread.image_angle = image_angle;
	bloodSpread2 = instance_create_layer(x, y, "Instances", bloodSpread2_obj);
	bloodSpread2.image_angle = image_angle;
	audio_play_sound_on(emitter, bulletHit_snd, false, 1);
	dealtDamage = true;
	penetration--;
}

if (penetration < 1)
{
	instance_change(bloodSpread_obj, true);
	bloodSpread2 = instance_create_layer(x, y, "Instances", bloodSpread2_obj);
	bloodSpread2.image_angle = image_angle;
}

