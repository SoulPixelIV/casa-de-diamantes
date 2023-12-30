//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

direction += (global.dt / 3) * sign(angle_difference(point_direction(x, y, player_obj.x, player_obj.y), direction));
image_angle = direction + 90;

speed = movSpeed * global.dt;

if (!place_free(x, y) || (place_meeting(x, y, player_obj) && !player_obj.isDashing))
{
	if (!place_meeting(x, y, colliderOneWay_obj)) {
		speed = 0;
		instance_change(explosionTiny_obj, true);
	}
}

if (place_meeting(x, y, bulletDualBarettas_obj) ||place_meeting(x, y, bulletPistol_obj) ||place_meeting(x, y, bulletShotgun_obj) ||place_meeting(x, y, bulletSilencedMP_obj) ||place_meeting(x, y, bulletSniper_obj) ||place_meeting(x, y, bulletZombieSoldierGirl_obj)) {
	speed = 0;
	instance_change(explosionTiny_obj, true);
}