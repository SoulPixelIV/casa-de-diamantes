/// @description Variables

movSpeed = 3.5 + random_range(-0.5, 0.5);
penetration = 2;
penetrationTime = 3;
invincibilityTimer = 5;
dir = point_direction(playerBulletLine_obj.x, playerBulletLine_obj.y, mouse_x + random_range(-12, 12), mouse_y + random_range(-18, 18));

image_xscale = random_range(0.6, 1.2);
image_yscale = random_range(0.6, 1.2);
image_angle = random_range(0, 359);

dealtDamage = false;
createdFire = false;
