var enemyTarget;
with (other)
{
	enemyTarget = instance_place(x, y, zombieBucketGirl_obj);
}
if (!dealtDamage)
{
	if (instance_exists(enemyTarget))
	{
		enemyTarget.hpBucket -= 30;
	}
	dealtDamage = true;
	audio_play_sound(bucketHit_snd, 1, false);
	instance_destroy();
}
