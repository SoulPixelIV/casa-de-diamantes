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
	if (!onLadder || onLadder && verspeed == 0)
	{
		if (global.pickedWeapon[0])
		{
			if (!spin)
			{
				if (currDir == 0)
				{
					draw_sprite_ext(playerPistol_spr, 0, x + 4 - spinWeaponPos, y - 4.3, 1, -1, dirCursor, -1, 1);
				}
				else
				{
					draw_sprite_ext(playerPistol_spr, 0, x - 4 + spinWeaponPos, y - 4.3, 1, 1, dirCursor, -1, 1);
				}
			}
			else
			{
				if (currDir == 0)
				{
					draw_sprite_ext(playerPistolJumpSpin_spr, -1, x + 4 - spinWeaponPos, y - 4.3, 1, -1, dirCursor, -1, 1);
				}
				else
				{
					draw_sprite_ext(playerPistolJumpSpin_spr, -1, x - 4 + spinWeaponPos, y - 4.3, 1, 1, dirCursor, -1, 1);
				}
			}
		}
		if (global.pickedWeapon[1])
		{
			if (!spin)
			{
				if (currDir == 0)
				{
					draw_sprite_ext(playerDualBarettas_spr, 0, x + 4 - spinWeaponPos, y - 4.3, 1, -1, dirCursor, -1, 1);
					draw_sprite_ext(playerDualBarettas_spr, 0, x + 4 - spinWeaponPos, y - 3.3, 1, -1, dirCursor, -1, 1);
				}
				else
				{
					draw_sprite_ext(playerDualBarettas_spr, 0, x - 4 + spinWeaponPos, y - 4.3, 1, 1, dirCursor, -1, 1);
					draw_sprite_ext(playerDualBarettas_spr, 0, x - 4 + spinWeaponPos, y - 3.3, 1, 1, dirCursor, -1, 1);
				}
			}
			else
			{
				if (currDir == 0)
				{
					draw_sprite_ext(playerDualBarettasJumpSpin_spr, -1, x + 4 - spinWeaponPos, y - 4.3, 1, -1, dirCursor, -1, 1);
					draw_sprite_ext(playerDualBarettasJumpSpin_spr, -1, x + 4 - spinWeaponPos, y - 3.3, 1, -1, dirCursor, -1, 1);
				}
				else
				{
					draw_sprite_ext(playerDualBarettasJumpSpin_spr, -1, x - 4 + spinWeaponPos, y - 4.3, 1, 1, dirCursor, -1, 1);
					draw_sprite_ext(playerDualBarettasJumpSpin_spr, -1, x - 4 + spinWeaponPos, y - 3.3, 1, 1, dirCursor, -1, 1);
				}
			}
		}
		if (global.pickedWeapon[2])
		{
			if (!spin)
			{
				if (currDir == 0)
				{
					draw_sprite_ext(playerShotgun_spr, 0, x + 4 - spinWeaponPos, y - 4.3, 1, -1, dirCursor, -1, 1);
					draw_sprite_ext(playerArmEmpty_spr, 0, x + 4 - spinWeaponPos, y - 3.3, 1, -1, dirCursor, -1, 1);
				}
				else
				{
					draw_sprite_ext(playerShotgun_spr, 0, x - 4 + spinWeaponPos, y - 4.3, 1, 1, dirCursor, -1, 1);
					draw_sprite_ext(playerArmEmpty_spr, 0, x - 4 + spinWeaponPos, y - 3.3, 1, 1, dirCursor, -1, 1);
				}
			}
			else
			{
				if (currDir == 0)
				{
					draw_sprite_ext(playerShotgunJumpSpin_spr, -1, x + 4 - spinWeaponPos, y - 4.3, 1, -1, dirCursor, -1, 1);
					draw_sprite_ext(playerArmEmptyJumpSpin_spr, -1, x + 4 - spinWeaponPos, y - 3.3, 1, -1, dirCursor, -1, 1);
				}
				else
				{
					draw_sprite_ext(playerShotgunJumpSpin_spr, -1, x - 4 + spinWeaponPos, y - 4.3, 1, 1, dirCursor, -1, 1);
					draw_sprite_ext(playerArmEmptyJumpSpin_spr, -1, x - 4 + spinWeaponPos, y - 3.3, 1, 1, dirCursor, -1, 1);
				}
			}
		}
	}
}
