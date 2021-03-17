/// @description Variables

deleteTimer = 110;
movSpeed = 5.2;
penetration = 3;
penetrationTime = 3;
invincibilityTimer = 5;
//dir = point_direction(playerBulletLine_obj.x, playerBulletLine_obj.y, mouse_x, mouse_y + random_range(-6, 6));
dir = player_obj.dirCursor + random_range(-4, 4);

dealtDamage = false;
createdFire = false;
