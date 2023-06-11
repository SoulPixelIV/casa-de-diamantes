if (other.startBattle) {
	var enemyTarget = instance_place(x, y, plantBoss_obj);
	if (!dealtDamage && instance_exists(enemyTarget))
	{
		enemyTarget.damageTint = true;
		enemyTarget.hp -= 1;
		bloodSpread = instance_create_layer(x, y, "Instances", bloodSpread_obj);
		bloodSpread.image_angle = image_angle;
		bloodSpread2 = instance_create_layer(x, y, "Instances", bloodSpread2_obj);
		bloodSpread2.image_angle = image_angle;
		audio_play_sound(bulletHit_snd, 1, false);
		dealtDamage = true;
		penetration = 0;
	}

	if (penetration < 1)
	{
		instance_change(bloodSpread_obj, true);
		bloodSpread2 = instance_create_layer(x, y, "Instances", bloodSpread2_obj);
		bloodSpread2.image_angle = image_angle;
	}
}

