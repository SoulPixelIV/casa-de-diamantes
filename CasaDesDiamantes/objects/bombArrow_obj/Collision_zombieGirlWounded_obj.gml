var enemyTarget = instance_place(x, y, zombieGirlWounded_obj);
if (!dealtDamage && instance_exists(enemyTarget) && other.hitable)
{
	enemyTarget.lastBullet = bulletDualBarettas_obj;
	enemyTarget.damageTint = true;
	enemyTarget.hp -= damage * 1.5;
	enemyTarget.headshot = false;
	enemyTarget.aggro = true;
	penetration--;
	bloodSpread = instance_create_layer(x, y, "Instances", bloodSpread_obj);
	bloodSpread.image_angle = image_angle;
	bloodSpread2 = instance_create_layer(x, y, "Instances", bloodSpread2_obj);
	bloodSpread2.image_angle = image_angle;
	audio_play_sound(bulletHit_snd, 1, false);
	dealtDamage = true;
	damage = damage / 1.1;
	horspeed = horspeed / 1.1;
	verspeed = verspeed / 1.1;
	
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
