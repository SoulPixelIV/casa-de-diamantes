/// @description Variables

movSpeed = 3.5 + random_range(-0.5, 0.5);
penetration = 2;
deleteTimer = 800;
penetrationTime = 3;
invincibilityTimer = 5;
damageMultiplier = 1;
damageMultiplierColor = make_color_rgb(255, 255, 255);
//dir = point_direction(playerBulletLine_obj.x, playerBulletLine_obj.y, mouse_x + random_range(-12, 12), mouse_y + random_range(-45, 45));
dir = player_obj.dirCursor + random_range(-12, 12);

image_xscale = random_range(0.6, 1.2);
image_yscale = random_range(0.6, 1.2);
image_angle = random_range(0, 359);

dealtDamage = false;
createdFire = false;

movSpeedX = (lengthdir_x(movSpeed, dir)) * global.dt;
movSpeedY = (lengthdir_y(movSpeed, dir)) * global.dt;