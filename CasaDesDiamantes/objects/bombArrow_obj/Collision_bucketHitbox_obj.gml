var enemyTarget;
with (other)
{
	enemyTarget = instance_place(x, y, zombieBucketGirl_obj);
}
if (!dealtDamage)
{
	if (instance_exists(enemyTarget))
	{
		enemyTarget.hpBucket -= damage * 2;
	}
	dealtDamage = true;
	audio_play_sound(bucketHit_snd, 1, false);
	instance_destroy();
}
