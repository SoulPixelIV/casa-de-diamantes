var explosiveTarget = instance_place(x, y, explosive_obj);
if (!dealtDamage)
{
	explosiveTarget.hp -= damage;
	fire = instance_create_layer(other.x, y, "Instances", fireLong_obj);
	fire.image_angle = image_angle;
	fire.image_xscale = 0.75;
	fire.image_yscale = 0.5;
	fire.temporary = true;
	audio_play_sound(bulletHit_snd, 1, false);
	dealtDamage = true;
	penetration--;
	damage = damage / 1.5;
	horspeed = horspeed / 1.25;
	verspeed = verspeed / 1.25;
	
	if ((horspeed < 4 && horspeed > -4) && (verspeed < 4 && verspeed > -4)) {
		penetration = 0;
	}
}

if (penetration < 1)
{
	instance_change(smokecloud_obj, true);
}
else
{
	if (!createdFire)
	{
		fire2 = instance_create_layer(other.x, y, "Instances", fireLong_obj);
		fire2.image_angle = image_angle + 180;
		fire2.image_xscale = 0.75;
		fire2.image_yscale = 0.5;
		fire2.temporary = true;
		createdFire = true;
	}
}
