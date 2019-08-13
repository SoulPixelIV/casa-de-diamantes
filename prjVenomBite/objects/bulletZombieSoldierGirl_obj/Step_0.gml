/// @description Movement

dt = (delta_time / 1000000) * globalSettings_obj.TARGET_FRAMERATE;
speed = movSpeed * dt;

//Collision
if (!place_free(x, y))
{
	instance_change(bulletHit_obj, true);
}

if (place_meeting(x, y, player_obj) && !player_obj.isZombie)
{
	player_obj.hp -= 20;
	instance_change(bloodSpread_obj, true);
}