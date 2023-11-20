movSpeed = 3.7;
dir = 0;
invincibilityTimer = 5;
dealtDamage = false;
penetration = 1;

image_angle = dir;

movSpeedX = (lengthdir_x(movSpeed, dir)) * global.dt;
movSpeedY = (lengthdir_y(movSpeed, dir)) * global.dt;
