/// @description Draw Guns
if (!inChamber) {
	changePos = 1;
	pistolSprite = playerPistol_spr;
	dualBarettasSprite = playerDualBarettas_spr;
	shotgunSprite = playerShotgun_spr;
	sniperSprite = playerSniper_spr;
	antiMaterialRifleSprite = antiMaterialRifle_spr;
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
	
	//Radiation
	if (radiation >= 80) {
		draw_sprite(radiated_spr, 0, x, y - 35);
	}

	drawSpriteHat = global.hat;
	drawSpriteTop1 = global.top1;
	drawSpriteTop2 = global.top2;
	drawSpriteArm = global.arm;
	drawSpriteArm2 = playerArmEmpty2Sprite;
	drawSpriteBottom = global.bottom;

	if (drawSpriteArm == noone)
	{
		drawSpriteArm = playerArmEmptySprite;
	}

	if ((flip && !onLadder && !huggingWall && !deathActivated))
	{
		playerRotation += (global.dt * 16) * -image_xscale;
	}
	if (isDashing && grounded && crouchRollTimer > 0) {
		playerRotation += (global.dt * 8) * -image_xscale;
	}

	if (flip && !onLadder && !huggingWall && !deathActivated) {
		draw_sprite_ext(playerFlipSprite, 0, x, y, image_xscale, 1, playerRotation, -1, 1);
	}

	if (isDashing && grounded && crouchRollTimer > 0) {
		if (crouchRollTimer > 0) {
			draw_sprite_ext(playerCrouchRollSprite, 0, x, y, image_xscale, 1, playerRotation, -1, 1);
		} else {
			draw_sprite_ext(playerCrouchSprite, 0, x, y, image_xscale, 1, 0, -1, 1);
		}
	}

	//Controller Line
	if (room != level28) {
		if (inputMethod == 1 && !global.pause)
		{
			draw_sprite_ext(playerControllerLine_spr, -1, x - 6 * currDir, y - 6, 2, 1, dirCursor, -1, 1);
		}
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

	if (spin && sprite_index != playerWallSprite && !flip && !onLadder && !huggingWall)
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

	//ARM POSITIONS
	if (crouchslide) {
		armPosX = x + ((-4) * currDir) * changePos;
		armPosY = y - 10;
	
		armPistolPosX = x + 4 * currDir;
		armPistolPosY = y - 13;

		//Background
		armDBPosX = x - 4 * currDir;
		armDBPosY = y - 15;
		//Foreground
		armDB2PosX = x + 4 * currDir;
		armDB2PosY = y - 13;

		shotgunX = x + 2 * currDir;
		shotgunY = y - 14;
		//Background
		shotgunArmX = x - 2 * currDir;
		shotgunArmY = y - 16;
		//Foreground
		shotgunArmCurvedX = x + 6 * currDir;
		shotgunArmCurvedY = y - 14;

		armMPPosX = x + ((7) * currDir) * changePos;
		armMPPosY = y - 14;
		
		armCurvedMPPosX = x + 5 * currDir;
		armCurvedMPPosY = y - 14;
		
		silencedMPX = x + (6) * currDir;
		silencedMPY = y - 11;

		armBowPosX = x + ((-2) * currDir) * changePos;
		armBowPosY = y - 8;
	
		armMainPosX = x + 4 * currDir;
		armMainPosY = y - 13;
	} else {
		armPosX = x + ((-4) * currDir) * changePos;
		armPosY = y - 10;
	
		armPistolPosX = x + ((2) * currDir) * changePos;
		armPistolPosY = y - 8;

		armDBPosX = x - ((4) * currDir) * changePos;
		armDBPosY = y - 10;
		armDB2PosX = x + ((4) * currDir) * changePos;
		armDB2PosY = y - 8;

		shotgunX = x + ((2) * currDir) * changePos;
		shotgunY = y - 8;
		shotgunArmX = x + ((-4) * currDir) * changePos;
		shotgunArmY = y - 10;
		shotgunArmCurvedX = x + ((4) * currDir) * changePos;
		shotgunArmCurvedY = y - 8;

		armMPPosX = x + currDir * changePos;
		armMPPosY = y - 10;
		
		armCurvedMPPosX = x + ((4) * currDir) * changePos;
		armCurvedMPPosY = y - 8;
		
		silencedMPX = x + ((6) * currDir) * changePos;
		silencedMPY = y - 7;

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
			if (sprite_index != playerShotgunStanceSprite && sprite_index != playerDualBarettasStanceSprite && sprite_index != playerSilencedMPStanceSprite && sprite_index != playerPistolStanceSprite && !flip && sprite_index != playerCrouchRollSprite && sprite_index != playerAntiMaterialRifleStanceSprite) {
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
					if (sprite_index == playerWalkingEquippedReverse_spr) {
						draw_sprite_ext(playerDualBarettasWalking_spr, -1, armDBPosX, armDBPosY, 1, -currDir, dirCursor, -1, image_alpha);
						draw_sprite_ext(playerArmEmptyWalkingSprite, -1, armDBPosX, armDBPosY, 1, -currDir, dirCursor - 14 * -currDir, -1, image_alpha);
					} else if (sprite_index == playerWalkingEquipped_spr || sprite_index == playerWalkingEquippedNude_spr) {
						draw_sprite_ext(playerDualBarettasWalkingReverse_spr, -1, armDBPosX, armDBPosY, 1, -currDir, dirCursor, -1, image_alpha);
						draw_sprite_ext(playerArmEmptyWalkingSpriteReverse, -1, armDBPosX, armDBPosY, 1, -currDir, dirCursor - 14 * -currDir, -1, image_alpha);
					} else {
						draw_sprite_ext(playerDualBarettas_spr, -1, armDBPosX, armDBPosY, 1, -currDir, dirCursor, -1, image_alpha);
						draw_sprite_ext(drawSpriteArm, -1, armDBPosX, armDBPosY, 1, -currDir, dirCursor - 14 * -currDir, -1, image_alpha);
					}
				}
		
				//SHOTGUN
				if (global.currentWeapon == gameManager_obj.pickedWeapon.shotgun)
				{
					if (sprite_index == playerWalkingEquippedReverse_spr) {
						armSpriteShotgun = playerArmEmptyWalkingSprite;
					} else if (sprite_index == playerWalkingEquipped_spr || sprite_index == playerWalkingEquippedNude_spr) {
						armSpriteShotgun = playerArmEmptyWalkingSpriteReverse;
					} else {
						armSpriteShotgun = playerArmEmptySprite;
					}
			
					if (dirCursor > 90 && dirCursor <= 270) {
						//First arm
						if (dirCursor > 0 && dirCursor <= 90) {
							draw_sprite_ext(armSpriteShotgun, -1, shotgunArmX, shotgunArmY, 1, -currDir, clamp((dirCursor - 16 * -currDir) + 29 * (clamp(dirCursor, 0, 90) / 90), 90, 250), -1, image_alpha);
						}
			
						if (dirCursor > 90 && dirCursor <= 180) {
							draw_sprite_ext(armSpriteShotgun, -1, shotgunArmX, shotgunArmY, 1, -currDir, clamp((dirCursor - 16 * -currDir) - 29 * (90 - (clamp(dirCursor, 90, 180) - 90)) / 90, 90, 250), -1, image_alpha);
						}
			
						if (dirCursor > 180 && dirCursor <= 270) {
							draw_sprite_ext(armSpriteShotgun, -1, shotgunArmX, shotgunArmY, 1, -currDir, clamp((dirCursor - 16 * -currDir) + 29 * ((clamp(dirCursor, 180, 270) - 180) / 90), 90, 250), -1, image_alpha);
						}
			
						if (dirCursor > 270 && dirCursor <= 360) {
							draw_sprite_ext(armSpriteShotgun, -1, shotgunArmX, shotgunArmY, 1, -currDir, clamp((dirCursor - 16 * -currDir) - 29 * (90 - (clamp(dirCursor, 270, 360) - 270)) / 90, 90, 250), -1, image_alpha);
						}
					}
					if (dirCursor > 270 && dirCursor <= 360) {
						//First arm
						if (dirCursor > 0 && dirCursor <= 90) {
							draw_sprite_ext(armSpriteShotgun, -1, shotgunArmX, shotgunArmY, 1, -currDir, clamp((dirCursor - 16 * -currDir) + 29 * (clamp(dirCursor, 0, 90) / 90), 290, 360), -1, image_alpha);
						}
			
						if (dirCursor > 90 && dirCursor <= 180) {
							draw_sprite_ext(armSpriteShotgun, -1, shotgunArmX, shotgunArmY, 1, -currDir, clamp((dirCursor - 16 * -currDir) - 29 * (90 - (clamp(dirCursor, 90, 180) - 90)) / 90, 290, 360), -1, image_alpha);
						}
			
						if (dirCursor > 180 && dirCursor <= 270) {
							draw_sprite_ext(armSpriteShotgun, -1, shotgunArmX, shotgunArmY, 1, -currDir, clamp((dirCursor - 16 * -currDir) + 29 * ((clamp(dirCursor, 180, 270) - 180) / 90), 290, 360), -1, image_alpha);
						}
			
						if (dirCursor > 270 && dirCursor <= 360) {
							draw_sprite_ext(armSpriteShotgun, -1, shotgunArmX, shotgunArmY, 1, -currDir, clamp((dirCursor - 16 * -currDir) - 29 * (90 - (clamp(dirCursor, 270, 360) - 270)) / 90, 290, 360), -1, image_alpha);
						}
					}
					if (dirCursor > 0 && dirCursor <= 14) {
						//First arm
						if (dirCursor > 0 && dirCursor <= 90) {
							draw_sprite_ext(armSpriteShotgun, -1, shotgunArmX, shotgunArmY, 1, -currDir, (dirCursor - 16 * -currDir) + 29 * (clamp(dirCursor, 0, 90) / 90), -1, image_alpha);
						}
			
						if (dirCursor > 90 && dirCursor <= 180) {
							draw_sprite_ext(armSpriteShotgun, -1, shotgunArmX, shotgunArmY, 1, -currDir, (dirCursor - 16 * -currDir) - 29 * (90 - (clamp(dirCursor, 90, 180) - 90)) / 90, -1, image_alpha);
						}
			
						if (dirCursor > 180 && dirCursor <= 270) {
							draw_sprite_ext(armSpriteShotgun, -1, shotgunArmX, shotgunArmY, 1, -currDir, (dirCursor - 16 * -currDir) + 29 * ((clamp(dirCursor, 180, 270) - 180) / 90), -1, image_alpha);
						}
			
						if (dirCursor > 270 && dirCursor <= 360) {
							draw_sprite_ext(armSpriteShotgun, -1, shotgunArmX, shotgunArmY, 1, -currDir, (dirCursor - 16 * -currDir) - 29 * (90 - (clamp(dirCursor, 270, 360) - 270)) / 90, -1, image_alpha);
						}
					}
					if (dirCursor > 14 && dirCursor <= 90) {
						//First arm
						if (dirCursor > 0 && dirCursor <= 90) {
							draw_sprite_ext(armSpriteShotgun, -1, shotgunArmX, shotgunArmY, 1, -currDir, clamp((dirCursor - 16 * -currDir) + 29 * (clamp(dirCursor, 0, 90) / 90), 0, 90), -1, image_alpha);
						}
			
						if (dirCursor > 90 && dirCursor <= 180) {
							draw_sprite_ext(armSpriteShotgun, -1, shotgunArmX, shotgunArmY, 1, -currDir, clamp((dirCursor - 16 * -currDir) - 29 * (90 - (clamp(dirCursor, 90, 180) - 90)) / 90, 0, 90), -1, image_alpha);
						}
			
						if (dirCursor > 180 && dirCursor <= 270) {
							draw_sprite_ext(armSpriteShotgun, -1, shotgunArmX, shotgunArmY, 1, -currDir, clamp((dirCursor - 16 * -currDir) + 29 * ((clamp(dirCursor, 180, 270) - 180) / 90), 0, 90), -1, image_alpha);
						}
			
						if (dirCursor > 270 && dirCursor <= 360) {
							draw_sprite_ext(armSpriteShotgun, -1, shotgunArmX, shotgunArmY, 1, -currDir, clamp((dirCursor - 16 * -currDir) - 29 * (90 - (clamp(dirCursor, 270, 360) - 270)) / 90, 0, 90), -1, image_alpha);
						}
					}
				}
		
				//SILENCED MP
				if (global.currentWeapon == gameManager_obj.pickedWeapon.silencedMP)
				{
					if (sprite_index == playerWalkingEquippedReverse_spr) {
						armSpriteMP = playerArmEmptyWalkingSprite;
					} else if (sprite_index == playerWalkingEquipped_spr || sprite_index == playerWalkingEquippedNude_spr) {
						armSpriteMP = playerArmEmptyWalkingSpriteReverse;
					} else {
						armSpriteMP = playerArmEmptySprite;
					}
					
					if (dirCursor > 90 && dirCursor < 270) {
						//First arm
						if (dirCursor > 0 && dirCursor < 90) {
							draw_sprite_ext(armSpriteMP, -1, armMPPosX, armMPPosY, 1, -currDir, clamp((dirCursor - 21 * -currDir) + 20 * (clamp(dirCursor, 0, 90) / 90), 90, 250), -1, image_alpha);
						}
			
						if (dirCursor > 90 && dirCursor < 180) {
							draw_sprite_ext(armSpriteMP, -1, armMPPosX, armMPPosY, 1, -currDir, clamp((dirCursor - 21 * -currDir) - 20 * (90 - (clamp(dirCursor, 90, 180) - 90)) / 90, 90, 250), -1, image_alpha);
						}
			
						if (dirCursor > 180 && dirCursor < 270) {
							draw_sprite_ext(armSpriteMP, -1, armMPPosX, armMPPosY, 1, -currDir, clamp((dirCursor - 21 * -currDir) + 20 * ((clamp(dirCursor, 180, 270) - 180) / 90), 90, 250), -1, image_alpha);
						}
			
						if (dirCursor > 270 && dirCursor < 360) {
							draw_sprite_ext(armSpriteMP, -1, armMPPosX, armMPPosY, 1, -currDir, clamp((dirCursor - 21 * -currDir) - 20 * (90 - (clamp(dirCursor, 270, 360) - 270)) / 90, 90, 250), -1, image_alpha);
						}
					}
					if (dirCursor > 270 && dirCursor < 360) {
						//First arm
						if (dirCursor > 0 && dirCursor < 90) {
							draw_sprite_ext(armSpriteMP, -1, armMPPosX, armMPPosY, 1, -currDir, clamp((dirCursor - 21 * -currDir) + 20 * (clamp(dirCursor, 0, 90) / 90), 290, 360), -1, image_alpha);
						}
			
						if (dirCursor > 90 && dirCursor < 180) {
							draw_sprite_ext(armSpriteMP, -1, armMPPosX, armMPPosY, 1, -currDir, clamp((dirCursor - 21 * -currDir) - 20 * (90 - (clamp(dirCursor, 90, 180) - 90)) / 90, 290, 360), -1, image_alpha);
						}
			
						if (dirCursor > 180 && dirCursor < 270) {
							draw_sprite_ext(armSpriteMP, -1, armMPPosX, armMPPosY, 1, -currDir, clamp((dirCursor - 21 * -currDir) + 20 * ((clamp(dirCursor, 180, 270) - 180) / 90), 290, 360), -1, image_alpha);
						}
			
						if (dirCursor > 270 && dirCursor < 360) {
							draw_sprite_ext(armSpriteMP, -1, armMPPosX, armMPPosY, 1, -currDir, clamp((dirCursor - 21 * -currDir) - 20 * (90 - (clamp(dirCursor, 270, 360) - 270)) / 90, 290, 360), -1, image_alpha);
						}
					}
					if (dirCursor > 0 && dirCursor < 14) {
						//First arm
						if (dirCursor > 0 && dirCursor < 90) {
							draw_sprite_ext(armSpriteMP, -1, armMPPosX, armMPPosY, 1, -currDir, (dirCursor - 21 * -currDir) + 20 * (clamp(dirCursor, 0, 90) / 90), -1, image_alpha);
						}
			
						if (dirCursor > 90 && dirCursor < 180) {
							draw_sprite_ext(armSpriteMP, -1, armMPPosX, armMPPosY, 1, -currDir, (dirCursor - 21 * -currDir) - 20 * (90 - (clamp(dirCursor, 90, 180) - 90)) / 90, -1, image_alpha);
						}
			
						if (dirCursor > 180 && dirCursor < 270) {
							draw_sprite_ext(armSpriteMP, -1, armMPPosX, armMPPosY, 1, -currDir, (dirCursor - 21 * -currDir) + 20 * ((clamp(dirCursor, 180, 270) - 180) / 90), -1, image_alpha);
						}
			
						if (dirCursor > 270 && dirCursor < 360) {
							draw_sprite_ext(armSpriteMP, -1, armMPPosX, armMPPosY, 1, -currDir, (dirCursor - 21 * -currDir) - 20 * (90 - (clamp(dirCursor, 270, 360) - 270)) / 90, -1, image_alpha);
						}
					}
					if (dirCursor > 14 && dirCursor < 90) {
						//First arm
						if (dirCursor > 0 && dirCursor < 90) {
							draw_sprite_ext(armSpriteMP, -1, armMPPosX, armMPPosY, 1, -currDir, clamp((dirCursor - 21 * -currDir) + 20 * (clamp(dirCursor, 0, 90) / 90), 0, 90), -1, image_alpha);
						}
			
						if (dirCursor > 90 && dirCursor < 180) {
							draw_sprite_ext(armSpriteMP, -1, armMPPosX, armMPPosY, 1, -currDir, clamp((dirCursor - 21 * -currDir) - 20 * (90 - (clamp(dirCursor, 90, 180) - 90)) / 90, 0, 90), -1, image_alpha);
						}
			
						if (dirCursor > 180 && dirCursor < 270) {
							draw_sprite_ext(armSpriteMP, -1, armMPPosX, armMPPosY, 1, -currDir, clamp((dirCursor - 21 * -currDir) + 20 * ((clamp(dirCursor, 180, 270) - 180) / 90), 0, 90), -1, image_alpha);
						}
			
						if (dirCursor > 270 && dirCursor < 360) {
							draw_sprite_ext(armSpriteMP, -1, armMPPosX, armMPPosY, 1, -currDir, clamp((dirCursor - 21 * -currDir) - 20 * (90 - (clamp(dirCursor, 270, 360) - 270)) / 90, 0, 90), -1, image_alpha);
						}
					}
				}
		
				//Anti Material Rifle
				if (global.currentWeapon == gameManager_obj.pickedWeapon.bow)
				{
					//First arm
					draw_sprite_ext(drawSpriteArm, -1, armBowPosX, armBowPosY, 1, -currDir, dirCursor, -1, image_alpha);
				}
			}
		
			//Draw Steph
			if (!flip && sprite_index != playerCrouchRollSprite)
			{
				draw_self();
			}
		
			if (sprite_index != playerShotgunStanceSprite && sprite_index != playerDualBarettasStanceSprite && sprite_index != playerSilencedMPStanceSprite && sprite_index != playerPistolStanceSprite && !flip && sprite_index != playerCrouchRollSprite && sprite_index != playerAntiMaterialRifleStanceSprite) {
				//PISTOL
				if (global.currentWeapon == gameManager_obj.pickedWeapon.pistol)
				{
					if (sprite_index == playerWalkingEquippedReverse_spr) {
						draw_sprite_ext(playerPistolWalking_spr, -1, armPistolPosX, armPistolPosY, 1, -currDir, dirCursor, -1, image_alpha);
					} else if (sprite_index == playerWalkingEquipped_spr || sprite_index == playerWalkingEquippedNude_spr) {
						draw_sprite_ext(playerPistolWalkingReverse_spr, -1, armPistolPosX, armPistolPosY, 1, -currDir, dirCursor, -1, image_alpha);
					} else {
						draw_sprite_ext(playerPistol_spr, -1, armPistolPosX, armPistolPosY, 1, -currDir, dirCursor, -1, image_alpha);
					}
				}
		
				//DUAL BARETTAS
				if (global.currentWeapon == gameManager_obj.pickedWeapon.dualBarettas)
				{
					//Second arm
					if (sprite_index == playerWalkingEquippedReverse_spr) {
						draw_sprite_ext(playerDualBarettasWalking_spr, -1, armDB2PosX, armDB2PosY, 1, -currDir, dirCursor, -1, image_alpha);
						draw_sprite_ext(playerArmEmptyWalkingSprite, -1, armDB2PosX, armDB2PosY, 1, -currDir, dirCursor - 14 * -currDir, -1, image_alpha);
					} else if (sprite_index == playerWalkingEquipped_spr || sprite_index == playerWalkingEquippedNude_spr) {
						draw_sprite_ext(playerDualBarettasWalkingReverse_spr, -1, armDB2PosX, armDB2PosY, 1, -currDir, dirCursor, -1, image_alpha);
						draw_sprite_ext(playerArmEmptyWalkingSpriteReverse, -1, armDB2PosX, armDB2PosY, 1, -currDir, dirCursor - 14 * -currDir, -1, image_alpha);
					} else {
						draw_sprite_ext(playerDualBarettas_spr, -1, armDB2PosX, armDB2PosY, 1, -currDir, dirCursor, -1, image_alpha);
						draw_sprite_ext(drawSpriteArm, -1, armDB2PosX, armDB2PosY, 1, -currDir, dirCursor - 14 * -currDir, -1, image_alpha);
					}
				}

				//SHOTGUN
				if (global.currentWeapon == gameManager_obj.pickedWeapon.shotgun)
				{
					if (sprite_index == playerWalkingEquippedReverse_spr) {
						armSpriteCurvedShotgun = playerArmCurvedWalkingSprite;
						spriteShotgun = playerShotgunWalking_spr;
					} else if (sprite_index == playerWalkingEquipped_spr || sprite_index == playerWalkingEquippedNude_spr) {
						armSpriteCurvedShotgun = playerArmCurvedWalkingSpriteReverse;
						spriteShotgun = playerShotgunWalkingReverse_spr;
					} else {
						armSpriteCurvedShotgun = playerArmCurvedSprite;
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
					if (sprite_index == playerWalkingEquippedReverse_spr) {
						armSpriteCurvedMP = playerArmCurvedWalkingSprite;
						spriteMP = playerSilencedMPWalking_spr;
					} else if (sprite_index == playerWalkingEquipped_spr || sprite_index == playerWalkingEquippedNude_spr) {
						armSpriteCurvedMP = playerArmCurvedWalkingSpriteReverse;
						spriteMP = playerSilencedMPWalkingReverse_spr;
					} else {
						armSpriteCurvedMP = playerArmCurvedSprite;
						spriteMP = playerSilencedMP_spr;
					}
					
					//Second arm
					if (global.silencedMPUpgrade2) {
						if (dirCursor > 90 && dirCursor < 270) {
							draw_sprite_ext(spriteMP, -1, silencedMPX, silencedMPY, 1, -currDir, clamp(dirCursor - 5 * -currDir, 90, 245), make_color_rgb((255 / 100) * (flamethrowerLoad / 4), 255, 255), image_alpha);
							draw_sprite_ext(armSpriteCurvedMP, -1, armCurvedMPPosX, armCurvedMPPosY, 1, -currDir, clamp(dirCursor - 11 * -currDir, 90, 245), -1, image_alpha);
						} 
						if (dirCursor > 270 && dirCursor < 360) {
							draw_sprite_ext(spriteMP, -1, silencedMPX, silencedMPY, 1, -currDir, clamp(dirCursor - 5 * -currDir, 295, 360), make_color_rgb((255 / 100) * (flamethrowerLoad / 4), 255, 255), image_alpha);
							draw_sprite_ext(armSpriteCurvedMP, -1, armCurvedMPPosX, armCurvedMPPosY, 1, -currDir, clamp(dirCursor - 11 * -currDir, 295, 360), -1, image_alpha);
						}
						if (dirCursor > 0 && dirCursor < 14) {
							draw_sprite_ext(spriteMP, -1, silencedMPX, silencedMPY, 1, -currDir, dirCursor - 5 * -currDir, make_color_rgb((255 / 100) * (flamethrowerLoad / 4), 255, 255), image_alpha);
							draw_sprite_ext(armSpriteCurvedMP, -1, armCurvedMPPosX, armCurvedMPPosY, 1, -currDir, dirCursor - 11 * -currDir, -1, image_alpha);
						}
						if (dirCursor > 14 && dirCursor < 90) {
							draw_sprite_ext(spriteMP, -1, silencedMPX, silencedMPY, 1, -currDir, clamp(dirCursor - 5 * -currDir, 0, 90), make_color_rgb((255 / 100) * (flamethrowerLoad / 4), 255, 255), image_alpha);
							draw_sprite_ext(armSpriteCurvedMP, -1, armCurvedMPPosX, armCurvedMPPosY, 1, -currDir, clamp(dirCursor - 11 * -currDir, 0, 90), -1, image_alpha);
						}
					} else {
						if (dirCursor > 90 && dirCursor < 270) {
							draw_sprite_ext(spriteMP, -1, silencedMPX, silencedMPY, 1, -currDir, clamp(dirCursor - 5 * -currDir, 90, 245), -1, image_alpha);
							draw_sprite_ext(armSpriteCurvedMP, -1, armCurvedMPPosX, armCurvedMPPosY, 1, -currDir, clamp(dirCursor - 11 * -currDir, 90, 245), -1, image_alpha);
						} 
						if (dirCursor > 270 && dirCursor < 360) {
							draw_sprite_ext(spriteMP, -1, silencedMPX, silencedMPY, 1, -currDir, clamp(dirCursor - 5 * -currDir, 295, 360), -1, image_alpha);
							draw_sprite_ext(armSpriteCurvedMP, -1, armCurvedMPPosX, armCurvedMPPosY, 1, -currDir, clamp(dirCursor - 11 * -currDir, 295, 360), -1, image_alpha);
						}
						if (dirCursor > 0 && dirCursor < 14) {
							draw_sprite_ext(spriteMP, -1, silencedMPX, silencedMPY, 1, -currDir, dirCursor - 5 * -currDir, -1, image_alpha);
							draw_sprite_ext(armSpriteCurvedMP, -1, armCurvedMPPosX, armCurvedMPPosY, 1, -currDir, dirCursor - 11 * -currDir, -1, image_alpha);
						}
						if (dirCursor > 14 && dirCursor < 90) {
							draw_sprite_ext(spriteMP, -1, silencedMPX, silencedMPY, 1, -currDir, clamp(dirCursor - 5 * -currDir, 0, 90), -1, image_alpha);
							draw_sprite_ext(armSpriteCurvedMP, -1, armCurvedMPPosX, armCurvedMPPosY, 1, -currDir, clamp(dirCursor - 11 * -currDir, 0, 90), -1, image_alpha);
						}
					}
				}
		
				//Anti Material Rifle
				if (global.currentWeapon == gameManager_obj.pickedWeapon.bow)
				{
					if (sprite_index == playerWalkingEquippedReverse_spr) {
						armSpriteCurvedShotgun = playerArmCurvedWalkingSprite;
						spriteAntiMaterialRifle = playerAntiMaterialRifleWalking_spr;
					} else if (sprite_index == playerWalkingEquipped_spr || sprite_index == playerWalkingEquippedNude_spr) {
						armSpriteCurvedShotgun = playerArmCurvedWalkingSpriteReverse;
						spriteAntiMaterialRifle = playerAntiMaterialRifleWalkingReverse_spr;
					} else {
						armSpriteCurvedShotgun = playerArmCurvedSprite;
						spriteAntiMaterialRifle = playerAntiMaterialRifle_spr;
					}
			
					//Second arm
					if (dirCursor > 90 && dirCursor < 270) {
						draw_sprite_ext(spriteAntiMaterialRifle, -1, shotgunX, shotgunY, 1, -currDir, clamp(dirCursor, 90, 245), -1, image_alpha);
						draw_sprite_ext(armSpriteCurvedShotgun, -1, shotgunArmCurvedX, shotgunArmCurvedY, 1, -currDir, clamp(dirCursor, 90, 245), -1, image_alpha);
					} 
					if (dirCursor > 270 && dirCursor < 360) {
						draw_sprite_ext(spriteAntiMaterialRifle, -1, shotgunX, shotgunY, 1, -currDir, clamp(dirCursor, 295, 360), -1, image_alpha);
						draw_sprite_ext(armSpriteCurvedShotgun, -1, shotgunArmCurvedX, shotgunArmCurvedY, 1, -currDir, clamp(dirCursor, 295, 360), -1, image_alpha);
					}
					if (dirCursor > 0 && dirCursor < 14) {
						draw_sprite_ext(spriteAntiMaterialRifle, -1, shotgunX, shotgunY, 1, -currDir, dirCursor, -1, image_alpha);
						draw_sprite_ext(armSpriteCurvedShotgun, -1, shotgunArmCurvedX, shotgunArmCurvedY, 1, -currDir, dirCursor, -1, image_alpha);
					}
					if (dirCursor > 14 && dirCursor < 90) {
						draw_sprite_ext(spriteAntiMaterialRifle, -1, shotgunX, shotgunY, 1, -currDir, clamp(dirCursor, 0, 90), -1, image_alpha);
						draw_sprite_ext(armSpriteCurvedShotgun, -1, shotgunArmCurvedX, shotgunArmCurvedY, 1, -currDir, clamp(dirCursor, 0, 90), -1, image_alpha);
					}
				}
		
				//MAIN ARM
				if (global.currentWeapon != gameManager_obj.pickedWeapon.dualBarettas && global.currentWeapon != gameManager_obj.pickedWeapon.shotgun && global.currentWeapon != gameManager_obj.pickedWeapon.silencedMP && global.currentWeapon != gameManager_obj.pickedWeapon.bow)
				{
					if (sprite_index == playerWalkingEquippedReverse_spr) {
						draw_sprite_ext(playerArmEmptyWalkingSprite, -1, armMainPosX, armMainPosY, 1, -currDir, dirCursor - 14 * -currDir, -1, image_alpha);
					} else if (sprite_index == playerWalkingEquipped_spr || sprite_index == playerWalkingEquippedNude_spr) {
						draw_sprite_ext(playerArmEmptyWalkingSpriteReverse, -1, armMainPosX, armMainPosY, 1, -currDir, dirCursor - 14 * -currDir, -1, image_alpha);
					} else {
						draw_sprite_ext(playerArmEmptySprite, -1, armMainPosX, armMainPosY, 1, -currDir, dirCursor - 14 * -currDir, -1, image_alpha);
					}
				}
			}
		}
	}
	else
	{
		draw_self();
		sprite_index = playerDeath_spr;
	}
}