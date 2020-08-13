var hitbox = instance_place(x, y, headshotHitbox_obj);
var enemyTarget;

if (hitbox != noone)
{
	with (hitbox)
	{
		enemyTarget = instance_place(x, y, enemy_obj);
	}

	if (!dealtDamage)
	{
		if (enemyTarget != noone)
		{
			enemyTarget.damageTint = true;
			enemyTarget.hp -= 20;
			enemyTarget.headshot = true;
		}
		instance_create_layer(x, y, "Instances", bloodSpread_obj);
		bloodSpread2 = instance_create_layer(x, y, "Instances", bloodSpread2_obj);
		bloodSpread2.image_angle = image_angle;
		audio_play_sound_on(emitter, bulletHitHeadshot_snd, false, 1);
		penetration--;
		dealtDamage = true;
	}

	if (penetration < 1)
	{
		instance_change(bloodSpread_obj, true);
		bloodSpread2 = instance_create_layer(x, y, "Instances", bloodSpread2_obj);
		bloodSpread2.image_angle = image_angle;
	}
}
