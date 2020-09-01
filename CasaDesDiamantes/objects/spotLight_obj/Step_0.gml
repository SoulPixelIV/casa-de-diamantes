/// @description Stick to Player

with (player_obj)
{
	if (image_xscale = -1)
	{
		with (spotLight_obj)
		{
			x = player_obj.x - 10;
			image_xscale = -1;
		}
	}
	if (image_xscale = 1)
	{
		with (spotLight_obj)
		{
			x = player_obj.x + 10;
			image_xscale = 1;
		}
	}
}
y = player_obj.y;
