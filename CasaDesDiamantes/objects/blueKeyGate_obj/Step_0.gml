if (!open)
{
	if (distance_to_object(player_obj) > 64)
	{
		camera_obj.blueDoorMessage = false;
		
		if (!gateDown) {
			sprite_index = blueKeyGateOpening_spr;
			animationSpeed = 2;
			
			if (image_index > image_number - 1) {
				gateDown = true;
			}
		} else {					
			sprite_index = blueKeyGate_spr;
			if (!createdHitbox)
			{
				collider = instance_create_layer(x - 7, y, "TileCollider", colliderAlwaysOn_obj);
				collider.image_yscale = 4;
				collider.image_xscale = 0.5;
				createdHitbox = true;
			}
		}
	} else {
		if (!global.keyBlue) {
			camera_obj.blueDoorMessage = true;
		}
	}
}
else
{
	sprite_index = blueKeyGateOpen_spr;
	gateDown = false;
	if (createdHitbox)
	{
		if (instance_exists(collider))
		{
			instance_destroy(collider);
			createdHitbox = false;
		}
		
		if (instance_exists(bulletCol)) {
			instance_destroy(bulletCol);
		}
	}
	
	if (image_index > image_number - 1) {
		animationSpeed = 0;
	}
}

if (instance_exists(player_obj)) {
	if (distance_to_object(player_obj) < 64 && global.keyBlue) {
		open = true;
	}
}

//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;