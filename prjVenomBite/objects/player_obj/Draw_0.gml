/// @description Draw Guns

draw_self();

if (global.pickedWeapon[0])
{
	if (dirCursor > 90 && dirCursor < 270)
	{
		draw_sprite_ext(playerPistol_spr, 0, x + 1, y - 4, 1, -1, dirCursor, -1, 1);
	}
	else
	{
		draw_sprite_ext(playerPistol_spr, 0, x - 1, y - 4, 1, 1, dirCursor, -1, 1);
	}
}
