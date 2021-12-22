/// @description Draw Guns

changePos = 1;
pistolSprite = playerPistol_spr;
dualBarettasSprite = playerDualBarettas_spr;
shotgunSprite = playerShotgun_spr;
sniperSprite = playerSniper_spr;
bowSprite = playerBow_spr;

//Draw Accessories
originX = player_obj.x;
originY = player_obj.y;

if (isDashing || huggingWall)
{
	theta = 90;
}
else
{
	theta = player_obj.playerRotation + 90;
}

if (stillInAir)
{
	theta = 90;
}

drawSpriteHat = global.hat;
drawSpriteTop1 = global.top1;
drawSpriteTop2 = global.top2;
drawSpriteArm = global.arm;
drawSpriteBottom = global.bottom;

if (drawSpriteArm == noone)
{
	drawSpriteArm = playerArmEmpty_spr;
}

if (global.currentWeapon == gameManager_obj.pickedWeapon.unarmed)
{
	if (global.top2 == smokingJacketEquipped_spr)
	{
		global.top2 = smokingJacket_spr;
	}
	if (global.top2 == warmJacketEquipped_spr)
	{
		global.top2 = warmJacket_spr;
	}
}

if (sprite_index == playerJumpSpin_spr || sprite_index == playerJumpSpinNude_spr || sprite_index == playerJumpSpinUnequipped_spr || sprite_index == playerJumpSpinUnequippedNude_spr)
{
	if (global.hat == beret_spr)
	{
		drawSpriteHat = beretSpin_spr;
	}
	if (global.hat == marcusHat_spr)
	{
		drawSpriteHat = marcusHatSpin_spr;
	}
	
	if (global.top1 == smokingTop_spr)
	{
		drawSpriteTop1 = smokingTopSpin_spr;
	}
	if (global.top1 == glitterTop_spr)
	{
		drawSpriteTop1 = glitterTopSpin_spr;
	}
	
	if (global.top2 == smokingJacketEquipped_spr)
	{
		drawSpriteTop2 = smokingJacketSpin_spr;
	}
	if (global.top2 == warmJacketEquipped_spr)
	{
		drawSpriteTop2 = warmJacketSpin_spr;
	}
	
	if (global.bottom == smokingBottom_spr)
	{
		drawSpriteBottom = smokingBottomSpin_spr;
	}
	if (global.bottom == glitterBottom_spr)
	{
		drawSpriteBottom = glitterBottomSpin_spr;
	}
}

if (sprite_index == playerFlip_spr || sprite_index == playerFlipNude_spr)
{
	if (global.bottom == smokingBottom_spr)
	{
		drawSpriteBottom = smokingBottomFlip_spr;
	}
	if (global.bottom == glitterBottom_spr)
	{
		drawSpriteBottom = glitterBottomFlip_spr;
	}
}

if (sprite_index == playerDash_spr || sprite_index == playerDashNude_spr || sprite_index = playerDashUnequippedNude_spr)
{
	if (global.hat == beret_spr)
	{
		drawSpriteHat = beretDash_spr;
	}
	if (global.hat == marcusHat_spr)
	{
		drawSpriteHat = marcusHatDash_spr;
	}
	
	if (global.top1 == smokingTop_spr)
	{
		drawSpriteTop1 = smokingTopDash_spr;
	}
	if (global.top1 == glitterTop_spr)
	{
		drawSpriteTop1 = glitterTopDash_spr;
	}
	
	if (global.top2 == smokingJacketEquipped_spr)
	{
		drawSpriteTop2 = smokingJacketDashEquipped_spr;
	}
	if (global.top2 == smokingJacket_spr)
	{
		drawSpriteTop2 = smokingJacketDash_spr;
	}
	if (global.top2 == warmJacketEquipped_spr)
	{
		drawSpriteTop2 = warmJacketDashEquipped_spr;
	}
	if (global.top2 == warmJacket_spr)
	{
		drawSpriteTop2 = warmJacketDash_spr;
	}
	
	if (global.bottom == smokingBottom_spr)
	{
		drawSpriteBottom = smokingBottomDash_spr;
	}
	if (global.bottom == glitterBottom_spr)
	{
		drawSpriteBottom = glitterBottomDash_spr;
	}
}

if (sprite_index = playerDashReverse_spr || sprite_index = playerDashReverseNude_spr)
{
	if (global.hat == beret_spr)
	{
		drawSpriteHat = beretDashReverse_spr;
	}
	if (global.hat == marcusHat_spr)
	{
		drawSpriteHat = marcusHatDashReverse_spr;
	}
	
	if (global.top1 == smokingTop_spr)
	{
		drawSpriteTop1 = smokingTopDashReverse_spr;
	}
	if (global.top1 == glitterTop_spr)
	{
		drawSpriteTop1 = glitterTopDashReverse_spr;
	}
	
	if (global.top2 == smokingJacketEquipped_spr)
	{
		drawSpriteTop2 = smokingJacketDashReverse_spr;
	}	
	if (global.top2 == warmJacketEquipped_spr)
	{
		drawSpriteTop2 = warmJacketDashReverse_spr;
	}	
	
	if (global.bottom == smokingBottom_spr)
	{
		drawSpriteBottom = smokingBottomDashReverse_spr;
	}
	if (global.bottom == glitterBottom_spr)
	{
		drawSpriteBottom = glitterBottomDashReverse_spr;
	}
}

if (sprite_index == playerWalkingEquipped_spr || sprite_index == playerWalkingEquippedNude_spr)
{
	if (global.hat == beret_spr)
	{
		drawSpriteHat = beretWalking_spr;
	}
	if (global.hat == marcusHat_spr)
	{
		drawSpriteHat = marcusHatWalking_spr;
	}
	
	if (global.top1 == smokingTop_spr)
	{
		drawSpriteTop1 = smokingTopWalking_spr;
	}
	if (global.top1 == glitterTop_spr)
	{
		drawSpriteTop1 = glitterTopWalking_spr;
	}
	
	if (global.top2 == smokingJacketEquipped_spr)
	{
		drawSpriteTop2 = smokingJacketWalkingEquipped_spr;
	}
	if (global.top2 == smokingJacket_spr)
	{
		drawSpriteTop2 = smokingJacketWalking_spr;
	}
	if (global.top2 == warmJacketEquipped_spr)
	{
		drawSpriteTop2 = warmJacketWalkingEquipped_spr;
	}
	if (global.top2 == warmJacket_spr)
	{
		drawSpriteTop2 = warmJacketWalking_spr;
	}
	
	if (global.bottom == smokingBottom_spr)
	{
		drawSpriteBottom = smokingBottomWalking_spr;
	}
	if (global.bottom == glitterBottom_spr)
	{
		drawSpriteBottom = glitterBottomWalking_spr;
	}
}

if (flip && !onLadder && !huggingWall && !deathActivated)
{
	playerRotation += (global.dt * 2.25) * -image_xscale;
	if (global.top1 == noone)
	{
		draw_sprite_ext(playerFlip_spr, 0, x, y, image_xscale, 1, playerRotation, -1, 1);
	}
	else
	{
		draw_sprite_ext(playerFlipNude_spr, 0, x, y, image_xscale, 1, playerRotation, -1, 1);
	}
}
else
{
	playerRotation = 0;
}

if (sprite_index == playerWall_spr || sprite_index == playerWallNoArm_spr)
{	
	if (global.bottom = smokingBottom_spr)
	{
		drawSpriteBottom = SmokingBottomWall_spr;
	}
	if (global.bottom = glitterBottom_spr)
	{
		drawSpriteBottom = glitterBottomWall_spr;
	}
}

if (sprite_index == playerClimbing_spr)
{
	if (global.top1 == smokingTop_spr)
	{
		drawSpriteTop1 = smokingTopClimbing_spr;
	}
	if (global.top1 == glitterTop_spr)
	{
		drawSpriteTop1 = glitterTopClimbing_spr;
	}
		
	if (global.top2 == smokingJacketEquipped_spr)
	{
		drawSpriteTop2 = smokingJacketClimbing_spr;
	}
	if (global.top2 == warmJacketEquipped_spr)
	{
		drawSpriteTop2 = warmJacketClimbing_spr;
	}
		
	if (global.bottom == smokingBottom_spr)
	{
		drawSpriteBottom = smokingBottomClimbing_spr;
	}
	if (global.bottom == glitterBottom_spr)
	{
		drawSpriteBottom = glitterBottomClimbing_spr;
	}
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

if (spin && sprite_index != playerWall_spr && !flip && !onLadder && !huggingWall)
{
	if (spinWeaponPos > 6)
	{
		spinWeaponDir = 1;
	}
	if (spinWeaponPos < 0)
	{
		spinWeaponDir = 0;
	}
	
	if (spinWeaponDir == 0)
	{
		spinWeaponPos += global.dt / 3;
	}
	else
	{
		spinWeaponPos -= global.dt / 3;
	}
}
else
{
	spinWeaponDir = 0;
	spinWeaponPos = 0;
}
	
if (!isZombie && !deathActivated)
{
	if (sprite_index == playerClimbing_spr)
	{
		//Draw Steph
		draw_self();
		
		if (drawSpriteHat != noone)
		{
			draw_sprite_ext(drawSpriteHat, -1, originX + lengthdir_x(radius, theta), originY + lengthdir_y(radius, theta), image_xscale, 1, playerRotation, -1, image_alpha);
		}
		if (drawSpriteTop1 != noone)
		{
			draw_sprite_ext(drawSpriteTop1, -1, originX + lengthdir_x(radiusTop1, theta), originY + lengthdir_y(radiusTop1, theta), image_xscale, 1, playerRotation, -1, image_alpha);
		}
		if (drawSpriteTop2 != noone)
		{
			draw_sprite_ext(drawSpriteTop2, -1, originX + lengthdir_x(radiusTop1, theta), originY + lengthdir_y(radiusTop1, theta), image_xscale, 1, playerRotation, -1, image_alpha);
		}
		if (drawSpriteBottom != noone)
		{
			draw_sprite_ext(drawSpriteBottom, -1, originX + lengthdir_x(radiusTop1, theta), originY + lengthdir_y(radiusTop1, theta), image_xscale, 1, playerRotation, -1, image_alpha);
		}
	}
	else
	{
		//Laser Animation
		if (laserAimImage < 6) {
			laserAimImage += global.dt / 20;
		} else {
			laserAimImage = 0;
		}
		
		//DUAL BARETTAS
		if (global.currentWeapon == gameManager_obj.pickedWeapon.dualBarettas)
		{
			//First arm
			draw_sprite_ext(playerDualBarettas_spr, 0, x + ((-4 + spinWeaponPos * changePos) * currDir), y - 5, 1, -currDir, dirCursor, -1, image_alpha);
			draw_sprite_ext(drawSpriteArm, 0, x + ((-4 + spinWeaponPos) * currDir) * changePos, y - 4, 1, -currDir, dirCursor, -1, image_alpha);
		}
		
		//BOW
		if (global.currentWeapon == gameManager_obj.pickedWeapon.bow)
		{
			//First arm
			draw_sprite_ext(drawSpriteArm, 0, x + ((-4 + spinWeaponPos) * currDir) * changePos, y - 4, 1, -currDir, dirCursor, -1, image_alpha);
		}
		
		//Draw Steph
		if (!flip)
		{
			draw_self();
			if (drawSpriteHat != noone)
			{
				draw_sprite_ext(drawSpriteHat, -1, x, y - 20, image_xscale, 1, playerRotation, -1, image_alpha);
			}
			if (drawSpriteBottom != noone)
			{
				draw_sprite_ext(drawSpriteBottom, -1, x, y, image_xscale, 1, playerRotation, -1, image_alpha);
			}
			if (drawSpriteTop1 != noone)
			{
				draw_sprite_ext(drawSpriteTop1, -1, x, y, image_xscale, 1, playerRotation, -1, image_alpha);
			}
			if (drawSpriteTop2 != noone)
			{
				draw_sprite_ext(drawSpriteTop2, -1, x, y, image_xscale, 1, playerRotation, -1, image_alpha);
			}
		}
		else
		{
			if (drawSpriteHat != noone)
			{
				draw_sprite_ext(drawSpriteHat, 0, originX + lengthdir_x(radius, theta), originY + lengthdir_y(radius, theta), image_xscale, 1, playerRotation, -1, image_alpha);
			}
			if (drawSpriteTop1 != noone)
			{
				draw_sprite_ext(drawSpriteTop1, 0, originX + lengthdir_x(radiusTop1, theta), originY + lengthdir_y(radiusTop1, theta), image_xscale, 1, playerRotation, -1, image_alpha);
			}
			if (drawSpriteTop2 != noone)
			{
				draw_sprite_ext(drawSpriteTop2, 0, originX + lengthdir_x(radiusTop1, theta), originY + lengthdir_y(radiusTop1, theta), image_xscale, 1, playerRotation, -1, image_alpha);
			}
			if (drawSpriteBottom != noone)
			{
				draw_sprite_ext(drawSpriteBottom, 0, originX + lengthdir_x(radiusTop1, theta), originY + lengthdir_y(radiusTop1, theta), image_xscale, 1, playerRotation, -1, image_alpha);
			}
		}
		
		//PISTOL
		if (global.currentWeapon == gameManager_obj.pickedWeapon.pistol)
		{
			draw_sprite_ext(playerPistol_spr, 0, x + ((2 - spinWeaponPos) * currDir) * changePos, y - 4, 1, -currDir, dirCursor, -1, image_alpha);
		}
		
		//DUAL BARETTAS
		if (global.currentWeapon == gameManager_obj.pickedWeapon.dualBarettas)
		{
			//Second arm
			draw_sprite_ext(playerDualBarettas_spr, 0, x + ((2 - spinWeaponPos) * currDir) * changePos, y - 4, 1, -currDir, dirCursor, -1, image_alpha);
			draw_sprite_ext(drawSpriteArm, 0, x + ((2 - spinWeaponPos) * currDir) * changePos, y - 4, 1, -currDir, dirCursor, -1, image_alpha);
		}
		
		//SHOTGUN
		if (global.currentWeapon == gameManager_obj.pickedWeapon.shotgun)
		{
			draw_sprite_ext(playerShotgun_spr, 0, x + ((2 - spinWeaponPos) * currDir) * changePos, y - 4, 1, -currDir, dirCursor, -1, image_alpha);
		}
		
		//SNIPER
		if (global.currentWeapon == gameManager_obj.pickedWeapon.sniper)
		{
			draw_sprite_ext(playerSniper_spr, -1, x + ((2 - spinWeaponPos) * currDir) * changePos, y - 4, 1, -currDir, dirCursor, -1, image_alpha);
		}
		
		//BOW
		if (global.currentWeapon == gameManager_obj.pickedWeapon.bow)
		{
			draw_text(player_obj.x + 100, player_obj.y + 50, string(bowReadyingImage));
			//Second arm
			if (!bowReadying) {
				draw_sprite_ext(playerBow_spr, -1, x + ((2 - spinWeaponPos) * currDir) * changePos, y - 4, 1, -currDir, dirCursor, -1, image_alpha);
				draw_sprite_ext(bombArrow_spr, 0, x + ((2 - spinWeaponPos) * currDir) * changePos, y - 4, 1, -currDir, dirCursor, -1, image_alpha);
			} else {
				draw_sprite_ext(playerBowReady_spr, bowReadyingImage, x + ((2 - spinWeaponPos) * currDir) * changePos, y - 4, 1, -currDir, dirCursor, -1, image_alpha);
				draw_sprite_ext(bombArrowReadying_spr, bowReadyingImage, (x + ((2 - spinWeaponPos) * currDir) * changePos), y - 4, 1, -currDir, dirCursor, -1, image_alpha);
			}
		}
		
		//MAIN ARM
		if (global.currentWeapon != gameManager_obj.pickedWeapon.dualBarettas)
		{
			draw_sprite_ext(drawSpriteArm, 0, x + ((2 - spinWeaponPos) * currDir) * changePos, y - 4, 1, -currDir, dirCursor, -1, image_alpha);
		}
	}
}
else
{
	draw_self();
	sprite_index = playerDeath_spr;
}