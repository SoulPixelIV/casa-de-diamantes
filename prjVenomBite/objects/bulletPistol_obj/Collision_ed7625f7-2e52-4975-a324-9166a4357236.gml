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
			enemyTarget.hp -= 40;
		}
		instance_create_layer(x, y, "Instances", bloodSpread_obj);
		bloodSpread2 = instance_create_layer(x, y, "Instances", bloodSpread2_obj);
		bloodSpread2.image_angle = image_angle;
		audio_play_sound(bulletHitHeadshot_snd, 1, false);
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
