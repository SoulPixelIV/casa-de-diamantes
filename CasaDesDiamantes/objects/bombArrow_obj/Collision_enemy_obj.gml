if (!stuckInEnemy) {
	var enemyTarget = instance_place(x, y, enemy_obj);
}

if (!dealtDamage && instance_exists(enemyTarget) && other.hitable)
{
	enemyTarget.lastBullet = bulletPistol_obj;
	enemyTarget.damageTint = true;
	enemyTarget.hp -= damage;
	enemyTarget.headshot = false;
	enemyTarget.aggro = true;
	bloodSpread = instance_create_layer(x, y, "Instances", bloodSpread_obj);
	bloodSpread.image_angle = image_angle;
	bloodSpread2 = instance_create_layer(x, y, "Instances", bloodSpread2_obj);
	bloodSpread2.image_angle = image_angle;
	audio_play_sound(bulletHit_snd, 1, false);
	dealtDamage = true;
	penetration--;
	damage = damage / 1.1;
	horspeed = horspeed / 1.1;
	verspeed = verspeed / 1.1;
	
	if ((horspeed < 4 && horspeed > -4) && (verspeed < 4 && verspeed > -4) && enemyTarget.hp > 0) {
		penetration = 0;
	}
	
	/*
	if (place_meeting(x, y, zombieGirl_obj))
	{
		var rand = choose(1,1,1,1,1,1,1,1,1,1,1,1,1,2);
		if (rand == 2)
		{
			enemyTarget.lostArm = true;
		}
	}*/
}

if (penetration < 1)
{
	if (!stuckInEnemy) {
		instance_create_layer(x, y, "Instances", bloodSpread_obj);
		bloodSpread2 = instance_create_layer(x, y, "Instances", bloodSpread2_obj);
		bloodSpread2.image_angle = image_angle;
		nearestEnemy = instance_place(x, y, enemy_obj);
		if (instance_exists(nearestEnemy)) {
			distXToEnemy = x - nearestEnemy.x;
			distYToEnemy = y - nearestEnemy.y;
		}
		stuckInEnemy = true;
	}
}

