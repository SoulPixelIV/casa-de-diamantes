/// @description Movement

if (global.currentWeapon == gameManager_obj.pickedWeapon.pistol) {
	image_angle = player_obj.dirCursor;
	x = player_obj.x + 2 * player_obj.currDir;
	y = player_obj.y - 8;
}
if (global.currentWeapon == gameManager_obj.pickedWeapon.dualBarettas) {
	image_angle = player_obj.dirCursor;
	x = player_obj.x - 4 * player_obj.currDir;
	y = player_obj.y - 6;
}
if (global.currentWeapon == gameManager_obj.pickedWeapon.shotgun || global.currentWeapon == gameManager_obj.pickedWeapon.silencedMP) {
	image_angle = player_obj.dirCursor - 11 * -player_obj.currDir;
}



/*
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
*/