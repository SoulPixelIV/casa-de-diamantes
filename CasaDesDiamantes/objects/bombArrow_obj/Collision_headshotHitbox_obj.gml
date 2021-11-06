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
			enemyTarget.damageTintHeadshot = true;
			enemyTarget.hp -= damage * 1.5;
			enemyTarget.headshot = true;
		}
		instance_create_layer(x, y, "Instances", bloodSpread_obj);
		bloodSpread2 = instance_create_layer(x, y, "Instances", bloodSpread2_obj);
		bloodSpread2.image_angle = image_angle;
		audio_play_sound(bulletHitHeadshot_snd, 1, false);
		penetration--;
		dealtDamage = true;
		damage = damage / 1.5;
		horspeed = horspeed / 1.25;
		verspeed = verspeed / 1.25;
	
		if ((horspeed < 4 && horspeed > -4) && (verspeed < 4 && verspeed > -4)) {
			penetration = 0;
		}
	}

	if (penetration < 1)
	{
		if (!stuckInEnemy) {
			instance_create_layer(x, y, "Instances", bloodSpread_obj);
			bloodSpread2 = instance_create_layer(x, y, "Instances", bloodSpread2_obj);
			bloodSpread2.image_angle = image_angle;
			nearestEnemy = instance_place(x, y, enemy_obj);
		}
		stuckInEnemy = true;
		if (instance_exists(nearestEnemy)) {
			distXToEnemy = x - nearestEnemy.x;
			distYToEnemy = y - nearestEnemy.y;
		}
	}
}
