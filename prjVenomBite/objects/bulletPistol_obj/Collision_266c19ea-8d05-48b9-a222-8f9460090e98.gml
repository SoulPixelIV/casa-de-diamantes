var explosiveTarget = instance_place(x, y, explosive_obj);
if (!dealtDamage)
{
	explosiveTarget.hp -= 10;
	fire = instance_create_layer(x, y, "Instances", fireLong_obj);
	fire.image_angle = image_angle;
	audio_play_sound_on(emitter, bulletHit_snd, false, 1);
	dealtDamage = true;
	penetration--;
}

if (penetration < 1)
{
	instance_change(smokecloud_obj, true);
}
else
{
	if (!createdFire)
	{
		fire2 = instance_create_layer(x, y, "Instances", fireLong_obj);
		fire2.image_angle = image_angle + 180;
		createdFire = true;
	}
}
