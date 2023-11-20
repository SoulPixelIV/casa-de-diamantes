movSpeed = 1.2;
dir = 0;
invincibilityTimer = 5;
dealtDamage = false;
penetration = 4

image_angle = dir;

movSpeedX = (lengthdir_x(movSpeed, dir)) * global.dt;
movSpeedY = (lengthdir_y(movSpeed, dir)) * global.dt;
