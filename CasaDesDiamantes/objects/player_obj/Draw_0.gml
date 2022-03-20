/// @description Draw Guns

changePos = 1;
pistolSprite = playerPistol_spr;
dualBarettasSprite = playerDualBarettas_spr;
shotgunSprite = playerShotgun_spr;
sniperSprite = playerSniper_spr;
bowSprite = playerBow_spr;
silencedMPSprite = playerSilencedMP_spr;

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
drawSpriteArm2 = playerArmEmpty2_spr;
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

if (sprite_index == playerWalkingEquipped_spr || sprite_index == playerWalkingEquippedNude_spr || sprite_index == playerWalkingEquippedReverse_spr)
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
draw_text(x + 30, y, string(dashroll));
if ((flip && !onLadder && !huggingWall && !deathActivated))
{
	playerRotation += (global.dt * 16) * -image_xscale;
}
if (isDashing && grounded && crouchRollTimer > 0) {
	playerRotation += (global.dt * 8) * -image_xscale;
}

if (flip && !onLadder && !huggingWall && !deathActivated) {
	if (global.top1 == noone)
	{
		draw_sprite_ext(playerFlip_spr, 0, x, y, image_xscale, 1, playerRotation, -1, 1);
	}
	else
	{
		draw_sprite_ext(playerFlipNude_spr, 0, x, y, image_xscale, 1, playerRotation, -1, 1);
	}
}

if (isDashing && grounded && crouchRollTimer > 0) {
	if (crouchRollTimer > 0) {
		draw_sprite_ext(playerCrouchRoll_spr, 0, x, y, image_xscale, 1, playerRotation, -1, 1);
	} else {
		draw_sprite_ext(playerCrouch_spr, 0, x, y, image_xscale, 1, 0, -1, 1);
	}
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

//CLEAN UP
shotgunX = x + ((2) * currDir) * changePos
shotgunY = y - 8;

//ARM POSITIONS
if (crouchslide) {
	armPosX = x + ((-4) * currDir) * changePos;
	armPosY = y - 10;

	armDBPosX = x + ((-10) * currDir) * changePos;
	armDBPosY = y - 12;

	shotgunArmX = x + ((-4) * currDir) * changePos;
	shotgunArmY = y - 10;
	shotgunArmCurvedX = x + ((4) * currDir) * changePos;
	shotgunArmCurvedY = y - 8;

	armMPPosX = x + ((4) * currDir) * changePos;
	armMPPosY = y - 8;

	armBowPosX = x + ((-2) * currDir) * changePos;
	armBowPosY = y - 8;
	
	armMainPosX = x + ((4) * currDir) * changePos;
	armMainPosY = y - 8;
} else {
	armPosX = x + ((-4) * currDir) * changePos;
	armPosY = y - 10;

	armDBPosX = x + ((4) * currDir) * changePos;
	armDBPosY = y - 8;

	shotgunArmX = x + ((-4) * currDir) * changePos;
	shotgunArmY = y - 10;
	shotgunArmCurvedX = x + ((4) * currDir) * changePos;
	shotgunArmCurvedY = y - 8;

	armMPPosX = x + ((4) * currDir) * changePos;
	armMPPosY = y - 8;

	armBowPosX = x + ((-2) * currDir) * changePos;
	armBowPosY = y - 8;
	
	armMainPosX = x + ((4) * currDir) * changePos;
	armMainPosY = y - 8;
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
		if (sprite_index != playerShotgunStance_spr && sprite_index != playerDualBarettasStance_spr && sprite_index != playerPistolStance_spr && !flip && !dashroll) {
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
				if (sprite_index == playerWalkingEquipped_spr || sprite_index == playerWalkingEquippedNude_spr || sprite_index == playerWalkingEquippedReverse_spr) {
					draw_sprite_ext(playerDualBarettasWalking_spr, -1, armPosX, armPosY, 1, -currDir, dirCursor, -1, image_alpha);
					draw_sprite_ext(playerArmEmptyWalking_spr, -1, armPosX, armPosY, 1, -currDir, dirCursor - 14 * -currDir, -1, image_alpha);
				} else {
					draw_sprite_ext(playerDualBarettas_spr, -1, armPosX, armPosY, 1, -currDir, dirCursor, -1, image_alpha);
					draw_sprite_ext(drawSpriteArm, -1, armPosX, armPosY, 1, -currDir, dirCursor - 14 * -currDir, -1, image_alpha);
				}
			}
		
			//SHOTGUN
			if (global.currentWeapon == gameManager_obj.pickedWeapon.shotgun)
			{
				if (sprite_index == playerWalkingEquipped_spr || sprite_index == playerWalkingEquippedNude_spr || sprite_index == playerWalkingEquippedReverse_spr) {
					armSpriteShotgun = playerArmEmptyWalking_spr;
				} else {
					armSpriteShotgun = playerArmEmpty_spr;
				}
			
				if (dirCursor > 90 && dirCursor < 270) {
					//First arm
					if (dirCursor > 0 && dirCursor < 90) {
						draw_sprite_ext(armSpriteShotgun, -1, shotgunArmX, shotgunArmY, 1, -currDir, clamp((dirCursor - 16 * -currDir) + 29 * (clamp(dirCursor, 0, 90) / 90), 90, 250), -1, image_alpha);
					}
			
					if (dirCursor > 90 && dirCursor < 180) {
						draw_sprite_ext(armSpriteShotgun, -1, shotgunArmX, shotgunArmY, 1, -currDir, clamp((dirCursor - 16 * -currDir) - 29 * (90 - (clamp(dirCursor, 90, 180) - 90)) / 90, 90, 250), -1, image_alpha);
					}
			
					if (dirCursor > 180 && dirCursor < 270) {
						draw_sprite_ext(armSpriteShotgun, -1, shotgunArmX, shotgunArmY, 1, -currDir, clamp((dirCursor - 16 * -currDir) + 29 * ((clamp(dirCursor, 180, 270) - 180) / 90), 90, 250), -1, image_alpha);
					}
			
					if (dirCursor > 270 && dirCursor < 360) {
						draw_sprite_ext(armSpriteShotgun, -1, shotgunArmX, shotgunArmY, 1, -currDir, clamp((dirCursor - 16 * -currDir) - 29 * (90 - (clamp(dirCursor, 270, 360) - 270)) / 90, 90, 250), -1, image_alpha);
					}
				}
				if (dirCursor > 270 && dirCursor < 360) {
					//First arm
					if (dirCursor > 0 && dirCursor < 90) {
						draw_sprite_ext(armSpriteShotgun, -1, shotgunArmX, shotgunArmY, 1, -currDir, clamp((dirCursor - 16 * -currDir) + 29 * (clamp(dirCursor, 0, 90) / 90), 290, 360), -1, image_alpha);
					}
			
					if (dirCursor > 90 && dirCursor < 180) {
						draw_sprite_ext(armSpriteShotgun, -1, shotgunArmX, shotgunArmY, 1, -currDir, clamp((dirCursor - 16 * -currDir) - 29 * (90 - (clamp(dirCursor, 90, 180) - 90)) / 90, 290, 360), -1, image_alpha);
					}
			
					if (dirCursor > 180 && dirCursor < 270) {
						draw_sprite_ext(armSpriteShotgun, -1, shotgunArmX, shotgunArmY, 1, -currDir, clamp((dirCursor - 16 * -currDir) + 29 * ((clamp(dirCursor, 180, 270) - 180) / 90), 290, 360), -1, image_alpha);
					}
			
					if (dirCursor > 270 && dirCursor < 360) {
						draw_sprite_ext(armSpriteShotgun, -1, shotgunArmX, shotgunArmY, 1, -currDir, clamp((dirCursor - 16 * -currDir) - 29 * (90 - (clamp(dirCursor, 270, 360) - 270)) / 90, 290, 360), -1, image_alpha);
					}
				}
				if (dirCursor > 0 && dirCursor < 14) {
					//First arm
					if (dirCursor > 0 && dirCursor < 90) {
						draw_sprite_ext(armSpriteShotgun, -1, shotgunArmX, shotgunArmY, 1, -currDir, (dirCursor - 16 * -currDir) + 29 * (clamp(dirCursor, 0, 90) / 90), -1, image_alpha);
					}
			
					if (dirCursor > 90 && dirCursor < 180) {
						draw_sprite_ext(armSpriteShotgun, -1, shotgunArmX, shotgunArmY, 1, -currDir, (dirCursor - 16 * -currDir) - 29 * (90 - (clamp(dirCursor, 90, 180) - 90)) / 90, -1, image_alpha);
					}
			
					if (dirCursor > 180 && dirCursor < 270) {
						draw_sprite_ext(armSpriteShotgun, -1, shotgunArmX, shotgunArmY, 1, -currDir, (dirCursor - 16 * -currDir) + 29 * ((clamp(dirCursor, 180, 270) - 180) / 90), -1, image_alpha);
					}
			
					if (dirCursor > 270 && dirCursor < 360) {
						draw_sprite_ext(armSpriteShotgun, -1, shotgunArmX, shotgunArmY, 1, -currDir, (dirCursor - 16 * -currDir) - 29 * (90 - (clamp(dirCursor, 270, 360) - 270)) / 90, -1, image_alpha);
					}
				}
				if (dirCursor > 14 && dirCursor < 90) {
					//First arm
					if (dirCursor > 0 && dirCursor < 90) {
						draw_sprite_ext(armSpriteShotgun, -1, shotgunArmX, shotgunArmY, 1, -currDir, clamp((dirCursor - 16 * -currDir) + 29 * (clamp(dirCursor, 0, 90) / 90), 0, 90), -1, image_alpha);
					}
			
					if (dirCursor > 90 && dirCursor < 180) {
						draw_sprite_ext(armSpriteShotgun, -1, shotgunArmX, shotgunArmY, 1, -currDir, clamp((dirCursor - 16 * -currDir) - 29 * (90 - (clamp(dirCursor, 90, 180) - 90)) / 90, 0, 90), -1, image_alpha);
					}
			
					if (dirCursor > 180 && dirCursor < 270) {
						draw_sprite_ext(armSpriteShotgun, -1, shotgunArmX, shotgunArmY, 1, -currDir, clamp((dirCursor - 16 * -currDir) + 29 * ((clamp(dirCursor, 180, 270) - 180) / 90), 0, 90), -1, image_alpha);
					}
			
					if (dirCursor > 270 && dirCursor < 360) {
						draw_sprite_ext(armSpriteShotgun, -1, shotgunArmX, shotgunArmY, 1, -currDir, clamp((dirCursor - 16 * -currDir) - 29 * (90 - (clamp(dirCursor, 270, 360) - 270)) / 90, 0, 90), -1, image_alpha);
					}
				}
			}
		
			//SILENCED MP
			if (global.currentWeapon == gameManager_obj.pickedWeapon.silencedMP)
			{
				if (dirCursor > 90 && dirCursor < 270) {
					//First arm
					if (dirCursor > 0 && dirCursor < 90) {
						draw_sprite_ext(drawSpriteArm, -1, armPosX, armPosY, 1, -currDir, clamp((dirCursor - 21 * -currDir) + 20 * (clamp(dirCursor, 0, 90) / 90), 90, 250), -1, image_alpha);
					}
			
					if (dirCursor > 90 && dirCursor < 180) {
						draw_sprite_ext(drawSpriteArm, -1, armPosX, armPosY, 1, -currDir, clamp((dirCursor - 21 * -currDir) - 20 * (90 - (clamp(dirCursor, 90, 180) - 90)) / 90, 90, 250), -1, image_alpha);
					}
			
					if (dirCursor > 180 && dirCursor < 270) {
						draw_sprite_ext(drawSpriteArm, -1, armPosX, armPosY, 1, -currDir, clamp((dirCursor - 21 * -currDir) + 20 * ((clamp(dirCursor, 180, 270) - 180) / 90), 90, 250), -1, image_alpha);
					}
			
					if (dirCursor > 270 && dirCursor < 360) {
						draw_sprite_ext(drawSpriteArm, -1, armPosX, armPosY, 1, -currDir, clamp((dirCursor - 21 * -currDir) - 20 * (90 - (clamp(dirCursor, 270, 360) - 270)) / 90, 90, 250), -1, image_alpha);
					}
				}
				if (dirCursor > 270 && dirCursor < 360) {
					//First arm
					if (dirCursor > 0 && dirCursor < 90) {
						draw_sprite_ext(drawSpriteArm, -1, armPosX, armPosY, 1, -currDir, clamp((dirCursor - 21 * -currDir) + 20 * (clamp(dirCursor, 0, 90) / 90), 290, 360), -1, image_alpha);
					}
			
					if (dirCursor > 90 && dirCursor < 180) {
						draw_sprite_ext(drawSpriteArm, -1, armPosX, armPosY, 1, -currDir, clamp((dirCursor - 21 * -currDir) - 20 * (90 - (clamp(dirCursor, 90, 180) - 90)) / 90, 290, 360), -1, image_alpha);
					}
			
					if (dirCursor > 180 && dirCursor < 270) {
						draw_sprite_ext(drawSpriteArm, -1, armPosX, armPosY, 1, -currDir, clamp((dirCursor - 21 * -currDir) + 20 * ((clamp(dirCursor, 180, 270) - 180) / 90), 290, 360), -1, image_alpha);
					}
			
					if (dirCursor > 270 && dirCursor < 360) {
						draw_sprite_ext(drawSpriteArm, -1, armPosX, armPosY, 1, -currDir, clamp((dirCursor - 21 * -currDir) - 20 * (90 - (clamp(dirCursor, 270, 360) - 270)) / 90, 290, 360), -1, image_alpha);
					}
				}
				if (dirCursor > 0 && dirCursor < 14) {
					//First arm
					if (dirCursor > 0 && dirCursor < 90) {
						draw_sprite_ext(drawSpriteArm, -1, armPosX, armPosY, 1, -currDir, (dirCursor - 21 * -currDir) + 20 * (clamp(dirCursor, 0, 90) / 90), -1, image_alpha);
					}
			
					if (dirCursor > 90 && dirCursor < 180) {
						draw_sprite_ext(drawSpriteArm, -1, armPosX, armPosY, 1, -currDir, (dirCursor - 21 * -currDir) - 20 * (90 - (clamp(dirCursor, 90, 180) - 90)) / 90, -1, image_alpha);
					}
			
					if (dirCursor > 180 && dirCursor < 270) {
						draw_sprite_ext(drawSpriteArm, -1, armPosX, armPosY, 1, -currDir, (dirCursor - 21 * -currDir) + 20 * ((clamp(dirCursor, 180, 270) - 180) / 90), -1, image_alpha);
					}
			
					if (dirCursor > 270 && dirCursor < 360) {
						draw_sprite_ext(drawSpriteArm, -1, armPosX, armPosY, 1, -currDir, (dirCursor - 21 * -currDir) - 20 * (90 - (clamp(dirCursor, 270, 360) - 270)) / 90, -1, image_alpha);
					}
				}
				if (dirCursor > 14 && dirCursor < 90) {
					//First arm
					if (dirCursor > 0 && dirCursor < 90) {
						draw_sprite_ext(drawSpriteArm, -1, armPosX, armPosY, 1, -currDir, clamp((dirCursor - 21 * -currDir) + 20 * (clamp(dirCursor, 0, 90) / 90), 0, 90), -1, image_alpha);
					}
			
					if (dirCursor > 90 && dirCursor < 180) {
						draw_sprite_ext(drawSpriteArm, -1, armPosX, armPosY, 1, -currDir, clamp((dirCursor - 21 * -currDir) - 20 * (90 - (clamp(dirCursor, 90, 180) - 90)) / 90, 0, 90), -1, image_alpha);
					}
			
					if (dirCursor > 180 && dirCursor < 270) {
						draw_sprite_ext(drawSpriteArm, -1, armPosX, armPosY, 1, -currDir, clamp((dirCursor - 21 * -currDir) + 20 * ((clamp(dirCursor, 180, 270) - 180) / 90), 0, 90), -1, image_alpha);
					}
			
					if (dirCursor > 270 && dirCursor < 360) {
						draw_sprite_ext(drawSpriteArm, -1, armPosX, armPosY, 1, -currDir, clamp((dirCursor - 21 * -currDir) - 20 * (90 - (clamp(dirCursor, 270, 360) - 270)) / 90, 0, 90), -1, image_alpha);
					}
				}
			}
		
			//BOW
			if (global.currentWeapon == gameManager_obj.pickedWeapon.bow)
			{
				//First arm
				draw_sprite_ext(drawSpriteArm, 0, armBowPosX, armBowPosY, 1, -currDir, dirCursor, -1, image_alpha);
			}
		}
		
		//Draw Steph
		if (!flip && !dashroll)
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
		
		if (sprite_index != playerShotgunStance_spr && sprite_index != playerDualBarettasStance_spr && sprite_index != playerPistolStance_spr && !flip && !dashroll) {
			//PISTOL
			if (global.currentWeapon == gameManager_obj.pickedWeapon.pistol)
			{
				if (sprite_index == playerWalkingEquipped_spr || sprite_index == playerWalkingEquippedNude_spr || sprite_index == playerWalkingEquippedReverse_spr) {
					draw_sprite_ext(playerPistolWalking_spr, -1, x + ((2) * currDir) * changePos, y - 8, 1, -currDir, dirCursor, -1, image_alpha);
				} else {
					draw_sprite_ext(playerPistol_spr, -1, x + ((2) * currDir) * changePos, y - 8, 1, -currDir, dirCursor, -1, image_alpha);
				}
			}
		
			//DUAL BARETTAS
			if (global.currentWeapon == gameManager_obj.pickedWeapon.dualBarettas)
			{
				//Second arm
				if (sprite_index == playerWalkingEquipped_spr || sprite_index == playerWalkingEquippedNude_spr || sprite_index == playerWalkingEquippedReverse_spr) {
					draw_sprite_ext(playerDualBarettasWalking_spr, -1, x + ((2) * currDir) * changePos, y - 8, 1, -currDir, dirCursor, -1, image_alpha);
					draw_sprite_ext(playerArmEmptyWalking_spr, -1, armDBPosX, armDBPosY, 1, -currDir, dirCursor - 14 * -currDir, -1, image_alpha);
				} else {
					draw_sprite_ext(playerDualBarettas_spr, -1, x + ((2) * currDir) * changePos, y - 8, 1, -currDir, dirCursor, -1, image_alpha);
					draw_sprite_ext(drawSpriteArm, -1, armDBPosX, armDBPosY, 1, -currDir, dirCursor - 14 * -currDir, -1, image_alpha);
				}
			}

			//SHOTGUN
			if (global.currentWeapon == gameManager_obj.pickedWeapon.shotgun)
			{
				if (sprite_index == playerWalkingEquipped_spr || sprite_index == playerWalkingEquippedNude_spr || sprite_index == playerWalkingEquippedReverse_spr) {
					armSpriteCurvedShotgun = playerArmCurvedWalking_spr;
					spriteShotgun = playerShotgunWalking_spr;
				} else {
					armSpriteCurvedShotgun = playerArmCurved_spr;
					spriteShotgun = playerShotgun_spr;
				}
			
				//Second arm
				if (dirCursor > 90 && dirCursor < 270) {
					draw_sprite_ext(spriteShotgun, -1, shotgunX, shotgunY, 1, -currDir, clamp(dirCursor, 90, 245), -1, image_alpha);
					draw_sprite_ext(armSpriteCurvedShotgun, -1, shotgunArmCurvedX, shotgunArmCurvedY, 1, -currDir, clamp(dirCursor, 90, 245), -1, image_alpha);
				} 
				if (dirCursor > 270 && dirCursor < 360) {
					draw_sprite_ext(spriteShotgun, -1, shotgunX, shotgunY, 1, -currDir, clamp(dirCursor, 295, 360), -1, image_alpha);
					draw_sprite_ext(armSpriteCurvedShotgun, -1, shotgunArmCurvedX, shotgunArmCurvedY, 1, -currDir, clamp(dirCursor, 295, 360), -1, image_alpha);
				}
				if (dirCursor > 0 && dirCursor < 14) {
					draw_sprite_ext(spriteShotgun, -1, shotgunX, shotgunY, 1, -currDir, dirCursor, -1, image_alpha);
					draw_sprite_ext(armSpriteCurvedShotgun, -1, shotgunArmCurvedX, shotgunArmCurvedY, 1, -currDir, dirCursor, -1, image_alpha);
				}
				if (dirCursor > 14 && dirCursor < 90) {
					draw_sprite_ext(spriteShotgun, -1, shotgunX, shotgunY, 1, -currDir, clamp(dirCursor, 0, 90), -1, image_alpha);
					draw_sprite_ext(armSpriteCurvedShotgun, -1, shotgunArmCurvedX, shotgunArmCurvedY, 1, -currDir, clamp(dirCursor, 0, 90), -1, image_alpha);
				}
			}
		
			//SILENCED MP
			if (global.currentWeapon == gameManager_obj.pickedWeapon.silencedMP)
			{
				//Second arm
				if (dirCursor > 90 && dirCursor < 270) {
					draw_sprite_ext(playerSilencedMP_spr, -1, x + ((2) * currDir) * changePos, y - 8, 1, -currDir, clamp(dirCursor - 11 * -currDir, 90, 245), -1, image_alpha);
					draw_sprite_ext(playerArmCurved_spr, -1, armMPPosX, armMPPosY, 1, -currDir, clamp(dirCursor - 11 * -currDir, 90, 245), -1, image_alpha);
				} 
				if (dirCursor > 270 && dirCursor < 360) {
					draw_sprite_ext(playerSilencedMP_spr, -1, x + ((2) * currDir) * changePos, y - 8, 1, -currDir, clamp(dirCursor - 11 * -currDir, 295, 360), -1, image_alpha);
					draw_sprite_ext(playerArmCurved_spr, -1, armMPPosX, armMPPosY, 1, -currDir, clamp(dirCursor - 11 * -currDir, 295, 360), -1, image_alpha);
				}
				if (dirCursor > 0 && dirCursor < 14) {
					draw_sprite_ext(playerSilencedMP_spr, -1, x + ((2) * currDir) * changePos, y - 8, 1, -currDir, dirCursor - 11 * -currDir, -1, image_alpha);
					draw_sprite_ext(playerArmCurved_spr, -1, armMPPosX, armMPPosY, 1, -currDir, dirCursor - 11 * -currDir, -1, image_alpha);
				}
				if (dirCursor > 14 && dirCursor < 90) {
					draw_sprite_ext(playerSilencedMP_spr, -1, x + ((2) * currDir) * changePos, y - 8, 1, -currDir, clamp(dirCursor - 11 * -currDir, 0, 90), -1, image_alpha);
					draw_sprite_ext(playerArmCurved_spr, -1, armMPPosX, armMPPosY, 1, -currDir, clamp(dirCursor - 11 * -currDir, 0, 90), -1, image_alpha);
				}
			}
		
			//SNIPER
			//#########LEGACY##########
			if (global.currentWeapon == gameManager_obj.pickedWeapon.sniper)
			{
				draw_sprite_ext(playerSniper_spr, -1, x + ((2) * currDir) * changePos, y - 4, 1, -currDir, dirCursor, -1, image_alpha);
			}
		
			//BOW
			if (global.currentWeapon == gameManager_obj.pickedWeapon.bow)
			{
				draw_text(player_obj.x + 100, player_obj.y + 50, string(bowReadyingImage));
				//Second arm
				if (!bowReadying) {
					draw_sprite_ext(playerBow_spr, -1, x + ((2) * currDir) * changePos, y - 4, 1, -currDir, dirCursor, -1, image_alpha);
					draw_sprite_ext(bombArrow_spr, 0, x + ((2) * currDir) * changePos, y - 4, 1, -currDir, dirCursor, -1, image_alpha);
				} else {
					draw_sprite_ext(playerBowReady_spr, bowReadyingImage, x + ((2) * currDir) * changePos, y - 4, 1, -currDir, dirCursor, -1, image_alpha);
					draw_sprite_ext(bombArrowReadying_spr, bowReadyingImage, (x + ((2) * currDir) * changePos), y - 4, 1, -currDir, dirCursor, -1, image_alpha);
				}
			}
		
			//MAIN ARM
			if (global.currentWeapon != gameManager_obj.pickedWeapon.dualBarettas && global.currentWeapon != gameManager_obj.pickedWeapon.shotgun && global.currentWeapon != gameManager_obj.pickedWeapon.silencedMP)
			{
				draw_sprite_ext(playerArmEmpty_spr, -1, armMainPosX, armMainPosY, 1, -currDir, dirCursor - 14 * -currDir, -1, image_alpha);
			}
		}
	}
}
else
{
	draw_self();
	sprite_index = playerDeath_spr;
}