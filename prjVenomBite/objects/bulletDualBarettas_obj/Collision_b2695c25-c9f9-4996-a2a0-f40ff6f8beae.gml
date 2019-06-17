var hitbox = instance_place(x, y, bucketHitbox_obj);
var enemyTarget;
with (hitbox)
{
	enemyTarget = instance_place(x, y, enemy_obj);
}
if (!dealtDamage)
{
	enemyTarget.hp -= 4;
	if (enemyTarget.hpBucket != noone)
	{
		enemyTarget.hpBucket -= 9;
	}
	audio_play_sound(bucketHit_snd, 1, false);
	dealtDamage = true;
	instance_destroy();
}
