/// @description Rotation & Movement

image_angle = player_obj.dirCursor;
y = player_obj.y;

if !(player_obj.key_up && player_obj.key_down && player_obj.key_left && player_obj.key_right)
{
	if (player_obj.dirCursor > 90 && player_obj.dirCursor < 270)
	{
		image_yscale = -1;
		x = player_obj.x + 4;
	}
	else
	{
		image_yscale = 1;
		x = player_obj.x - 4;
	}
}
