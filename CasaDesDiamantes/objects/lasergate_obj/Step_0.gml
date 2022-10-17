if (open)
{
	if (distance_to_object(player_obj) > 64)
	{
		sprite_index = goldenGate_spr;
		image_speed = 1;
		if (!createdHitbox)
		{
			collider = instance_create_layer(x - 7, y, "TileCollider", colliderAlwaysOn_obj);
			collider.image_yscale = 4;
			collider.image_xscale = 0.5;
			createdHitbox = true;
		}
	}
}
else
{
	sprite_index = goldenGateOpen_spr;
	if (createdHitbox)
	{
		if (instance_exists(collider))
		{
			instance_destroy(collider);
			createdHitbox = false;
		}
	}
	
	if (image_index > image_number - 1) {
		image_speed = 0;
	}
}
