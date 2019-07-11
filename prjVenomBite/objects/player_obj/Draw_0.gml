/// @description Draw Guns

draw_self();

if (!flip)
{
	if (dirCursor > 90 && dirCursor < 270)
	{
		currDir = 0;
	}
	else
	{
		currDir = 1;
	}
}
	
if (!isZombie)
{
	if (global.pickedWeapon[0])
	{
		if (currDir == 0)
		{
			draw_sprite_ext(playerPistol_spr, 0, x + 4, y - 4.3, 1, -1, dirCursor, -1, 1);
		}
		else
		{
			draw_sprite_ext(playerPistol_spr, 0, x - 4, y - 4.3, 1, 1, dirCursor, -1, 1);
		}
	}
	if (global.pickedWeapon[1])
	{
		if (currDir == 0)
		{
			draw_sprite_ext(playerDualBarettas_spr, 0, x + 4, y - 4.3, 1, -1, dirCursor, -1, 1);
			draw_sprite_ext(playerDualBarettas_spr, 0, x + 4, y - 3.3, 1, -1, dirCursor, -1, 1);
		}
		else
		{
			draw_sprite_ext(playerDualBarettas_spr, 0, x - 4, y - 4.3, 1, 1, dirCursor, -1, 1);
			draw_sprite_ext(playerDualBarettas_spr, 0, x - 4, y - 3.3, 1, 1, dirCursor, -1, 1);
		}
	}
	if (global.pickedWeapon[2])
	{
		if (currDir == 0)
		{
			draw_sprite_ext(playerShotgun_spr, 0, x + 4, y - 4.3, 1, -1, dirCursor, -1, 1);
			draw_sprite_ext(playerArmEmpty_spr, 0, x + 4, y - 3.3, 1, -1, dirCursor, -1, 1);
		}
		else
		{
			draw_sprite_ext(playerShotgun_spr, 0, x - 4, y - 4.3, 1, 1, dirCursor, -1, 1);
			draw_sprite_ext(playerArmEmpty_spr, 0, x - 4, y - 3.3, 1, 1, dirCursor, -1, 1);
		}
	}
}
