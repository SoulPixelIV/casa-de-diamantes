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


if (sprite_index == playerClimbing_spr)
{
	//Draw Steph
	draw_self();
		
	if (drawSpriteHat != noone)
	{
		//draw_sprite_ext(drawSpriteHat, 0, originX + lengthdir_x(radius, theta), originY + lengthdir_y(radius, theta), image_xscale, 1, player_obj.playerRotation, make_color_rgb(255, 180, 180), image_alpha);
	}
	if (drawSpriteTop1 != noone)
	{
		//draw_sprite_ext(drawSpriteTop1, 0, originX + lengthdir_x(radiusTop1, theta), originY + lengthdir_y(radiusTop1, theta), image_xscale, 1, player_obj.playerRotation, make_color_rgb(255, 180, 180), image_alpha);
	}
	if (drawSpriteTop2 != noone)
	{
		//draw_sprite_ext(drawSpriteTop2, 0, originX + lengthdir_x(radiusTop1, theta), originY + lengthdir_y(radiusTop1, theta), image_xscale, 1, player_obj.playerRotation, make_color_rgb(255, 180, 180), image_alpha);
	}
	if (drawSpriteBottom != noone)
	{
		//draw_sprite_ext(drawSpriteBottom, 0, originX + lengthdir_x(radiusTop1, theta), originY + lengthdir_y(radiusTop1, theta), image_xscale, 1, player_obj.playerRotation, make_color_rgb(255, 180, 180), image_alpha);
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
		//draw_sprite_ext(playerDualBarettas_spr, 0, x + ((-4 + spinWeaponPos * changePos) * currDir), y - 5, 1, -currDir, dirCursor, make_color_rgb(255, 180, 180), image_alpha);
		if (global.arm != noone) {
			draw_sprite_ext(drawSpriteArm, 0, x + ((-4 + spinWeaponPos) * currDir) * changePos, y - 4, 1, -currDir, dirCursor, make_color_rgb(255, 180, 180), image_alpha);
		}
	}

	//BOW
	if (global.currentWeapon == gameManager_obj.pickedWeapon.bow)
	{
		//First arm
		draw_sprite_ext(drawSpriteArm, 0, x + ((-4 + spinWeaponPos) * currDir) * changePos, y - 4, 1, -currDir, dirCursor, make_color_rgb(255, 180, 180), image_alpha);
	}
		
	//Draw Steph
	if (!player_obj.flip)
	{
		draw_self();
		if (drawSpriteHat != noone)
		{
			//draw_sprite_ext(drawSpriteHat, 0, x, y - 20, image_xscale, 1, player_obj.playerRotation, make_color_rgb(255, 180, 180), image_alpha);
		}
		if (drawSpriteBottom != noone)
		{
			//draw_sprite_ext(drawSpriteBottom, 0, x, y, image_xscale, 1, player_obj.playerRotation, make_color_rgb(255, 180, 180), image_alpha);
		}
		if (drawSpriteTop1 != noone)
		{
			//draw_sprite_ext(drawSpriteTop1, 0, x, y, image_xscale, 1, player_obj.playerRotation, make_color_rgb(255, 180, 180), image_alpha);
		}
		if (drawSpriteTop2 != noone)
		{
			//draw_sprite_ext(drawSpriteTop2, 0, x, y, image_xscale, 1, player_obj.playerRotation, make_color_rgb(255, 180, 180), image_alpha);
		}
	}
	else
	{
		draw_self();
		if (drawSpriteHat != noone)
		{
			//draw_sprite_ext(drawSpriteHat, 0, originX + lengthdir_x(radius, theta), originY + lengthdir_y(radius, theta), image_xscale, 1, player_obj.playerRotation, make_color_rgb(255, 180, 180), image_alpha);
		}
		if (drawSpriteTop1 != noone)
		{
			//draw_sprite_ext(drawSpriteTop1, 0, originX + lengthdir_x(radiusTop1, theta), originY + lengthdir_y(radiusTop1, theta), image_xscale, 1, player_obj.playerRotation, make_color_rgb(255, 180, 180), image_alpha);
		}
		if (drawSpriteTop2 != noone)
		{
			//draw_sprite_ext(drawSpriteTop2, 0, originX + lengthdir_x(radiusTop1, theta), originY + lengthdir_y(radiusTop1, theta), image_xscale, 1, player_obj.playerRotation, make_color_rgb(255, 180, 180), image_alpha);
		}
		if (drawSpriteBottom != noone)
		{
			//draw_sprite_ext(drawSpriteBottom, 0, originX + lengthdir_x(radiusTop1, theta), originY + lengthdir_y(radiusTop1, theta), image_xscale, 1, player_obj.playerRotation, make_color_rgb(255, 180, 180), image_alpha);
		}
	}
		
	//PISTOL
	if (global.currentWeapon == gameManager_obj.pickedWeapon.pistol)
	{
		//draw_sprite_ext(playerPistol_spr, 0, x + ((2 - spinWeaponPos) * currDir) * changePos, y - 4, 1, -currDir, dirCursor, make_color_rgb(255, 180, 180), image_alpha);
	}
		
	//DUAL BARETTAS
	if (global.currentWeapon == gameManager_obj.pickedWeapon.dualBarettas)
	{
		//Second arm
		//draw_sprite_ext(playerDualBarettas_spr, 0, x + ((2 - spinWeaponPos) * currDir) * changePos, y - 4, 1, -currDir, dirCursor, make_color_rgb(255, 180, 180), image_alpha);
		if (global.arm != noone) {
			draw_sprite_ext(drawSpriteArm, 0, x + ((2 - spinWeaponPos) * currDir) * changePos, y - 4, 1, -currDir, dirCursor, make_color_rgb(255, 180, 180), image_alpha);
		}
	}
		
	//SHOTGUN
	if (global.currentWeapon == gameManager_obj.pickedWeapon.shotgun)
	{
		//draw_sprite_ext(playerShotgun_spr, 0, x + ((2 - spinWeaponPos) * currDir) * changePos, y - 4, 1, -currDir, dirCursor, make_color_rgb(255, 180, 180), image_alpha);
	}
		
	//SNIPER
	if (global.currentWeapon == gameManager_obj.pickedWeapon.sniper)
	{
		//draw_sprite_ext(playerSniper_spr, 0, x + ((2 - spinWeaponPos) * currDir) * changePos, y - 4, 1, -currDir, dirCursor, make_color_rgb(255, 180, 180), image_alpha);
	}
		
	//BOW
	if (global.currentWeapon == gameManager_obj.pickedWeapon.bow)
	{
		draw_text(player_obj.x + 100, player_obj.y + 50, string(bowReadyingImage));
		//Second arm
		if (!bowReadying) {
			//draw_sprite_ext(playerBow_spr, 0, x + ((2 - spinWeaponPos) * currDir) * changePos, y - 4, 1, -currDir, dirCursor, make_color_rgb(255, 180, 180), image_alpha);
			//draw_sprite_ext(bombArrow_spr, 0, x + ((2 - spinWeaponPos) * currDir) * changePos, y - 4, 1, -currDir, dirCursor, make_color_rgb(255, 180, 180), image_alpha);
		} else {
			//draw_sprite_ext(playerBowReady_spr, bowReadyingImage, x + ((2 - spinWeaponPos) * currDir) * changePos, y - 4, 1, -currDir, dirCursor, make_color_rgb(255, 180, 180), image_alpha);
			//draw_sprite_ext(bombArrowReadying_spr, bowReadyingImage, (x + ((2 - spinWeaponPos) * currDir) * changePos), y - 4, 1, -currDir, dirCursor, make_color_rgb(255, 180, 180), image_alpha);
		}
	}
		
	//MAIN ARM
	if (global.currentWeapon != gameManager_obj.pickedWeapon.dualBarettas)
	{
		if (drawSpriteArm != noone) {
			draw_sprite_ext(drawSpriteArm, 0, x + ((2 - spinWeaponPos) * currDir) * changePos, y - 4, 1, -currDir, dirCursor, make_color_rgb(255, 180, 180), image_alpha);
		}
	}
}

shader_reset();