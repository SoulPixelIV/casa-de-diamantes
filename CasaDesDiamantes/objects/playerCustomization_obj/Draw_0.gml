/// @description Draw Guns

changePos = 1;
pistolSprite = playerPistol_spr;
dualBarettasSprite = playerDualBarettas_spr;
shotgunSprite = playerShotgun_spr;
sniperSprite = playerSniper_spr;
bowSprite = playerBow_spr;

//Draw Accessories
originX = playerCustomization_obj.x;
originY = playerCustomization_obj.y;

if (isDashing || huggingWall)
{
	theta = 90;
}
else
{
	theta = playerCustomization_obj.playerRotation + 90;
}

if (stillInAir)
{
	theta = 90;
}

drawSpriteHat = global.hatName[customization_obj.currSelectionHat];
drawSpriteTop1 = global.top1Name[customization_obj.currSelectionTop1];
drawSpriteTop2 = global.top2Name[customization_obj.currSelectionTop2];
drawSpriteArm = global.armName[customization_obj.currSelectionArm];
drawSpriteBottom = global.bottomName[customization_obj.currSelectionBottom];

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
	if (global.top1 == smokingTop_spr)
	{
		drawSpriteTop1 = smokingTopSpin_spr;
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
}

if (sprite_index == playerFlip_spr || sprite_index == playerFlipNude_spr)
{
	if (global.bottom == smokingBottom_spr)
	{
		drawSpriteBottom = smokingBottomFlip_spr;
	}
}

if (sprite_index == playerDash_spr || sprite_index == playerDashNude_spr || sprite_index = playerDashUnequippedNude_spr)
{
	if (global.hat == beret_spr)
	{
		drawSpriteHat = beretDash_spr;
	}
	if (global.top1 == smokingTop_spr)
	{
		drawSpriteTop1 = smokingTopDash_spr;
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
}

if (sprite_index = playerDashReverse_spr || sprite_index = playerDashReverseNude_spr)
{
	if (global.hat == beret_spr)
	{
		drawSpriteHat = beretDashReverse_spr;
	}
	if (global.top1 == smokingTop_spr)
	{
		drawSpriteTop1 = smokingTopDashReverse_spr;
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
}

if (sprite_index == playerWalkingEquipped_spr || sprite_index == playerWalkingEquippedNude_spr)
{
	if (global.hat == beret_spr)
	{
		drawSpriteHat = beretWalking_spr;
	}
	if (global.top1 == smokingTop_spr)
	{
		drawSpriteTop1 = smokingTopWalking_spr;
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
}

if (sprite_index == playerClimbing_spr)
{
	if (global.top1 == smokingTop_spr)
	{
		drawSpriteTop1 = smokingTopClimbing_spr;
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
}
	
draw_self();
if (drawSpriteHat != noone)
{
	draw_sprite_ext(drawSpriteHat, -1, x, y - 85, image_xscale, image_yscale, playerRotation, -1, image_alpha);
}
if (drawSpriteBottom != noone)
{
	draw_sprite_ext(drawSpriteBottom, -1, x, y, image_xscale, image_yscale, playerRotation, -1, image_alpha);
}
if (drawSpriteTop1 != noone)
{
	draw_sprite_ext(drawSpriteTop1, -1, x, y, image_xscale, image_yscale, playerRotation, -1, image_alpha);
}
if (drawSpriteTop2 != noone)
{
	draw_sprite_ext(drawSpriteTop2, -1, x, y, image_xscale, image_yscale, playerRotation, -1, image_alpha);
}

//Change to Nude
if (drawSpriteTop1 != noone) {
	sprite_index = playerNude_spr;
} else {
	sprite_index = player_spr;
}