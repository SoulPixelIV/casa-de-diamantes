var enemyTarget = instance_place(x, y, enemy_obj);
if (!dealtDamage)
{
	enemyTarget.hp -= 10;
	instance_create_layer(x, y, "Instances", bloodSpread_obj);
	bloodSpread2 = instance_create_layer(x, y, "Instances", bloodSpread2_obj);
	bloodSpread2.image_angle = image_angle;
	audio_play_sound(bulletHit_snd, 1, false);
	dealtDamage = true;
	penetration--;
}

if (penetration < 1)
{
	instance_change(bloodSpread_obj, true);
	bloodSpread2 = instance_create_layer(x, y, "Instances", bloodSpread2_obj);
	bloodSpread2.image_angle = image_angle;
}

