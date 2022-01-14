lifetime = 4;

image_blend =  make_color_rgb(255, 180, 180);

image_xscale = player_obj.image_xscale;
image_alpha = 0.4;

drawSpriteHat = global.hat;
drawSpriteTop1 = global.top1;
drawSpriteTop2 = global.top2;
drawSpriteArm = global.arm;
drawSpriteBottom = global.bottom;

spinWeaponPos = player_obj.spinWeaponPos;
currDir = player_obj.currDir;
dirCursor = player_obj.dirCursor;
changePos = player_obj.changePos;

//Accessories
theta = 0;

originX = player_obj.x;
originY = player_obj.y;

radius = point_distance(originX, originY, x, y - 20);
radiusTop1 = point_distance(originX, originY, x, y);

laserAimImage = 0;
