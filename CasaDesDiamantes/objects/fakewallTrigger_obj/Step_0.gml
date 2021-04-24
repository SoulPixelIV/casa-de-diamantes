if (active)
{
	if (instance_exists(fakeTileEnable_obj))
	{
		fakeTileEnable_obj.fakeTileAlpha = lerp(fakeTileEnable_obj.fakeTileAlpha, targetAlpha, 0.1);
	}
}

if (!place_meeting(x, y, player_obj))
{
	targetAlpha = 1;
	if (instance_exists(fakeTileEnable_obj))
	{
		if (fakeTileEnable_obj.fakeTileAlpha == 1)
		{
			active = false;
		}
	}
}
