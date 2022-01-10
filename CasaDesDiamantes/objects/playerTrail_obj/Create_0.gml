lifetime = 35;

image_xscale = player_obj.image_xscale;

drawSpriteHat = global.hat;
drawSpriteTop1 = global.top1;
drawSpriteTop2 = global.top2;
drawSpriteArm = global.arm;
drawSpriteBottom = global.bottom;

spinWeaponPos = player_obj.spinWeaponPos;
currDir = player_obj.currDir;
dirCursor = player_obj.dirCursor;
changePos = player_obj.changePos;
isDashing = false;
if (player_obj.isDashing) {
	isDashing = true;
}

//Accessories
theta = 0;

originX = player_obj.x;
originY = player_obj.y;

radius = point_distance(originX, originY, x, y - 20);
radiusTop1 = point_distance(originX, originY, x, y);

laserAimImage = 0;
