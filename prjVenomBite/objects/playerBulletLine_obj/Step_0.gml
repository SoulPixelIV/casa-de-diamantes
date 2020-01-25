/// @description Movement

image_angle = player_obj.dirCursor;

if (!player_obj.spin)
{
	if (player_obj.currDir == 1)
	{
		x = player_obj.x + 4 - player_obj.spinWeaponPos;
		y = player_obj.y - 4.3;
	}
	else
	{
		x = player_obj.x - 4 + player_obj.spinWeaponPos;
		y = player_obj.y - 4.3;
	}
}
else
{
	if (player_obj.currDir == 1)
	{
		x = player_obj.x + 4 - player_obj.spinWeaponPos;
		y = player_obj.y - 4.3;
	}
	else
	{
		x = player_obj.x - 4 + player_obj.spinWeaponPos;
		y = player_obj.y - 4.3;
	}
}