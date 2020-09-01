/// @description Draw Guns

animated = 0;
changePos = 1;
pistolSprite = playerPistol_spr;
dualBarettasSprite = playerDualBarettas_spr;
shotgunSprite = playerShotgun_spr

if (!flip || flip && huggingWall)
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

if (isDashing)
{
	changePos = 0;
}
else
{
	changePos = 1;
}

if (spin && sprite_index != playerWall_spr && !flip)
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
		if (global.currentWeapon == gameManager_obj.pickedWeapon.unarmed)
		{
			draw_self();
		}
		if (global.currentWeapon == gameManager_obj.pickedWeapon.pistol)
		{
			draw_self();
			draw_sprite_ext(pistolSprite, animated, x + ((4 + spinWeaponPos) * currDir) * changePos, y - 4.3, 1, -currDir, dirCursor, -1, 1);
		}
		if (global.currentWeapon == gameManager_obj.pickedWeapon.dualBarettas)
		{
			//First arm
			draw_sprite_ext(dualBarettasSprite, animated, x - ((4 + spinWeaponPos * changePos) * currDir), y - 4.3, 1, -currDir, dirCursor, -1, 1);
			draw_self();
			//Second arm
			draw_sprite_ext(dualBarettasSprite, animated, x + ((4 + spinWeaponPos * changePos) * currDir) * changePos, y - 3.3, 1, -currDir, dirCursor, -1, 1);		
		}
		if (global.currentWeapon == gameManager_obj.pickedWeapon.shotgun)
		{
			draw_self();
			draw_sprite_ext(shotgunSprite, animated, x + ((4 + spinWeaponPos) * currDir) * changePos, y - 4.3, 1, -currDir, dirCursor, -1, 1);
		}
	}
	else
	{
		draw_self();
	}
}
else
{
	draw_self();
}