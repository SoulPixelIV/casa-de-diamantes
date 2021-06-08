/// @description Draw Guns

animated = 0;
changePos = 1;
pistolSprite = playerPistol_spr;
dualBarettasSprite = playerDualBarettas_spr;
shotgunSprite = playerShotgun_spr;
sniperSprite = playerSniper_spr;

if (flip)
{
	playerRotation += (global.dt * 2.25) * -image_xscale;
	draw_sprite_ext(playerFlip_spr, 0, x, y, image_xscale, 1, playerRotation, -1, 1);
}
else
{
	playerRotation = 0;
}

//Controller Line
if (inputMethod == 1)
{
	draw_sprite_ext(playerControllerLine_spr, -1, x - 6 * currDir, y - 6, 2, 1, dirCursor, -1, 1);
}

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

if (spin && sprite_index != playerWall_spr && !flip && !onLadder)
{
	animated = -1;
	pistolSprite = playerPistolJumpSpin_spr;
	dualBarettasSprite = playerDualBarettasJumpSpin_spr;
	shotgunSprite = playerShotgunJumpSpin_spr
	sniperSprite = playerSniperJumpSpin_spr
}
else
{
	animated = -1;
	pistolSprite = playerPistol_spr;
	dualBarettasSprite = playerDualBarettas_spr;
	shotgunSprite = playerShotgun_spr
	sniperSprite = playerSniper_spr
}
	
if (!isZombie && !deathActivated)
{
	if (!onLadder || (onLadder && verspeed == 0))
	{
		if (global.currentWeapon == gameManager_obj.pickedWeapon.unarmed)
		{
			if (!flip)
			{
				draw_self();
			}
		}
		if (global.currentWeapon == gameManager_obj.pickedWeapon.pistol)
		{
			if (!flip)
			{
				draw_self();
			}
			draw_sprite_ext(pistolSprite, animated, x + ((4 + spinWeaponPos) * currDir) * changePos, y - 4.3, 1, -currDir, dirCursor, -1, 1);
		}
		if (global.currentWeapon == gameManager_obj.pickedWeapon.dualBarettas)
		{
			//First arm
			draw_sprite_ext(dualBarettasSprite, animated, x - ((4 + spinWeaponPos * changePos) * currDir), y - 4.3, 1, -currDir, dirCursor, -1, 1);
			if (!flip)
			{
				draw_self();
			}
			//Second arm
			draw_sprite_ext(dualBarettasSprite, animated, x + ((4 + spinWeaponPos * changePos) * currDir) * changePos, y - 3.3, 1, -currDir, dirCursor, -1, 1);		
		}
		if (global.currentWeapon == gameManager_obj.pickedWeapon.shotgun)
		{
			if (!flip)
			{
				draw_self();
			}
			draw_sprite_ext(shotgunSprite, animated, x + ((4 + spinWeaponPos) * currDir) * changePos, y - 4.3, 1, -currDir, dirCursor, -1, 1);
		}
		if (global.currentWeapon == gameManager_obj.pickedWeapon.sniper)
		{
			if (!flip)
			{
				draw_self();
			}
			draw_sprite_ext(sniperSprite, animated, x + ((4 + spinWeaponPos) * currDir) * changePos, y - 4.3, 1, -currDir, dirCursor, -1, 1);
		}
	}
	else
	{
		if (!flip)
		{
			draw_self();
		}
	}
}
else
{
	if (!flip)
	{
		draw_self();
	}
}

//Draw Accessories
originX = player_obj.x;
originY = player_obj.y;

if (!isDashing)
{
	theta = player_obj.playerRotation + 90;
}
else
{
	theta = 90;
}

if (stillInAir)
{
	theta = 90;
}

drawSprite = global.hat;

if (spin && !flip && !isDashing)
{
	if (global.hat == beret_spr)
	{
		drawSprite = beretSpin_spr;
	}
}

if (isDashing)
{
	if (global.hat == beret_spr)
	{
		drawSprite = beretDash_spr;
	}
}

if (horspeed != 0 && grounded && !isDashing && !spin && !flip)
{
	if (global.hat == beret_spr)
	{
		drawSprite = beretWalking_spr;
	}
}

if (flip)
{
	draw_sprite_ext(drawSprite, -1, originX + lengthdir_x(radius, theta), originY + lengthdir_y(radius, theta), image_xscale, 1, playerRotation, -1, 1);
}
else
{
	draw_sprite_ext(drawSprite, -1, x, y - 20, image_xscale, 1, playerRotation, -1, 1);
}