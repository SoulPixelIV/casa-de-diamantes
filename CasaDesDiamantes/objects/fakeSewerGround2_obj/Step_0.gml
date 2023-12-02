/// @description Falling Script

if (falling)
{
	sprite_index = fakeSewerGround2Small_spr;
	destroyTimer -= global.dt;
	if (instance_exists(colliderTemporary_obj)) {
		instance_destroy(colliderTemporary_obj);
	}
}

if (destroyTimer < 0)
{
	instance_destroy();
}

if (distance_to_object(player_obj) < 4)
{
	falling = true;
}