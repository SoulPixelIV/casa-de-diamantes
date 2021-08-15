/// @description Variables

dir = 0;
dirChange = false;
movSpeed = 1.35;
createdFire = false;
invincibilityTimer = 5;

dealtDamage = false;
penetrationTime = 3;

//move_towards_point(instance_nearest(x, y, chaingunTurret_obj).targetX, instance_nearest(x, y, chaingunTurret_obj).targetY, movSpeed * global.dt);
if (instance_exists(player_obj))
{
	image_angle = clamp(point_direction(x, y, player_obj.x, player_obj.y), dir - 30, dir + 30);
}