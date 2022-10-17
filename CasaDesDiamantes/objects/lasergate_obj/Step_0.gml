if (open)
{
	if (distance_to_object(player_obj) > 64)
	{
		if (!gateDown) {
			sprite_index = goldenGateOpening_spr;
			image_speed = 0.5;
			
			if (image_index > image_number - 1) {
				gateDown = true;
			}
		} else {					
			sprite_index = goldenGate_spr;
			if (!createdHitbox)
			{
				collider = instance_create_layer(x - 7, y, "TileCollider", colliderAlwaysOn_obj);
				collider.image_yscale = 4;
				collider.image_xscale = 0.5;
				createdHitbox = true;
			}
		}
	}
}
else
{
	sprite_index = goldenGateOpen_spr;
	gateDown = false;
	if (createdHitbox)
	{
		if (instance_exists(collider))
		{
			instance_destroy(collider);
			createdHitbox = false;
		}
	}
	
	if (image_index > image_number - 1) {
		animationSpeed = 0;
	}
}

//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;