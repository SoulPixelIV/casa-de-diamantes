/// @description Draw Guns

draw_self();

if (!isZombie)
{
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
	if (global.pickedWeapon[1])
	{
		if (dirCursor > 90 && dirCursor < 270)
		{
			draw_sprite_ext(playerDualBarettas_spr, 0, x + 1, y - 4, 1, -1, dirCursor, -1, 1);
		}
		else
		{
			draw_sprite_ext(playerDualBarettas_spr, 0, x - 1, y - 4, 1, 1, dirCursor, -1, 1);
		}
	}
	if (global.pickedWeapon[2])
	{
		if (dirCursor > 90 && dirCursor < 270)
		{
			draw_sprite_ext(playerShotgun_spr, 0, x + 1, y - 4, 1, -1, dirCursor, -1, 1);
		}
		else
		{
			draw_sprite_ext(playerShotgun_spr, 0, x - 1, y - 4, 1, 1, dirCursor, -1, 1);
		}
	}
}
