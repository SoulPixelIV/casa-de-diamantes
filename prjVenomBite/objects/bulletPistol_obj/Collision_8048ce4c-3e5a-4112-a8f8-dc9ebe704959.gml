var enemyTarget;
with (other)
{
	enemyTarget = instance_place(x, y, zombieBucketGirl_obj);
}
if (!dealtDamage)
{
	enemyTarget.hpBucket -= 10;
	dealtDamage = true;
	audio_play_sound_on(emitter, bucketHit_snd, false, 1);
	instance_destroy();
}
