/// @description Variables

movSpeed = 1.65;
createdFire = false;
invincibilityTimer = 5;

//move_towards_point(instance_nearest(x, y, chaingunTurret_obj).targetX, instance_nearest(x, y, chaingunTurret_obj).targetY, movSpeed * global.dt);
image_angle = instance_nearest(x, y, chaingunTurret_obj).image_angle - 90;