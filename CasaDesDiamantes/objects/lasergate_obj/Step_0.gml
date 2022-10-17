if (open)
{
	if (distance_to_object(player_obj) > 64)
	{
		sprite_index = goldenGateOpen_spr;
		if (!createdHitbox)
		{
			collider = instance_create_layer(x - 8, y, "TileCollider", colliderAlwaysOn_obj);
			collider.image_yscale = 2.5;
			collider.image_xscale = 0.5;
			createdHitbox = true;
		}
	}
	
	if (image_index > image_number - 1) {
		instance_destroy();
	}
}
else
{
	sprite_index = goldenGate_spr;
	if (createdHitbox)
	{
		if (instance_exists(collider))
		{
			instance_destroy(collider);
			createdHitbox = false;
		}
	}
}
