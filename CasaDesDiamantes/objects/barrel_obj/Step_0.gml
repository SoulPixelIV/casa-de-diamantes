//Death
with (barrelTrigger)
{
	if (hp < 0 || place_meeting(x, y, explosionParent_obj))
	{
		with (body)
		{
			instance_change(explosion_obj, true);
		}
	}

	if (hp < 50)
	{
		hp -= global.dt / 12;
	}
}