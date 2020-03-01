/// @description Draw Guns

draw_self();
animated = 0;
changePos = 1;
pistolSprite = playerPistol_spr;
dualBarettasSprite = dualBarettas_spr;
shotgunSprite = shotgun_spr

if (!flip)
{
	if (dirCursor > 90 && dirCursor < 270)
	{
		currDir = 1;
	}
	else
	{
		currDir = -1;
	}
}

//Flip Sparkle
if (flipAvail)
{
	draw_sprite(redSparkle_spr, 0, x + 8, y + 6);
}

if (isDashing)
{
	changePos = 0;
}
else
{
	changePos = 1;
}

if (spin)
{
	animated = -1;
	pistolSprite = playerPistolJumpSpin_spr;
	dualBarettasSprite = playerDualBarettasJumpSpin_spr;
	shotgunSprite = playerShotgunJumpSpin_spr
}
else
{
	animated = 0;
	pistolSprite = playerPistol_spr;
	dualBarettasSprite = playerDualBarettas_spr;
	shotgunSprite = playerShotgun_spr
}
	
if (!isZombie)
{
	if (!onLadder || (onLadder && verspeed == 0))
	{
		if (global.currentWeapon == gameManager_obj.pickedWeapon.pistol)
		{
			draw_sprite_ext(pistolSprite, animated, x + ((4 + spinWeaponPos) * currDir) * changePos, y - 4.3, 1, -currDir, dirCursor, -1, 1);
		}
		if (global.currentWeapon == gameManager_obj.pickedWeapon.dualBarettas)
		{
			draw_sprite_ext(dualBarettasSprite, animated, x + ((4 + spinWeaponPos) * currDir) * changePos, y - 4.3, 1, -currDir, dirCursor, -1, 1);
			draw_sprite_ext(dualBarettasSprite, animated, x + ((4 + spinWeaponPos) * currDir) * changePos, y - 3.3, 1, -currDir, dirCursor, -1, 1);
		}
		if (global.currentWeapon == gameManager_obj.pickedWeapon.shotgun)
		{
			draw_sprite_ext(shotgunSprite, animated, x + ((4 + spinWeaponPos) * currDir) * changePos, y - 4.3, 1, -currDir, dirCursor, -1, 1);
			draw_sprite_ext(shotgunSprite, animated, x + ((4 + spinWeaponPos) * currDir) * changePos, y - 3.3, 1, -currDir, dirCursor, -1, 1);
		}
	}
}
