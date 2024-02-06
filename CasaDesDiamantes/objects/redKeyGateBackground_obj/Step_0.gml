if (!open)
{
	if (distance_to_object(player_obj) > 32)
	{
		camera_obj.redDoorMessage = false;
		
		if (!gateDown) {
			sprite_index = redKeyGateBackgroundOpening_spr;
			animationSpeed = 2;
			
			if (image_index > image_number - 1) {
				gateDown = true;
			}
		} else {					
			sprite_index = redKeyGateBackground_spr;
		}
	} else {
		if (!global.keyRed) {
			camera_obj.redDoorMessage = true;
		}
	}
}
else
{
	sprite_index = redKeyGateBackgroundOpening_spr;
	gateDown = false;
	
	if (image_index > image_number - 1) {
		animationSpeed = 0;
	}
}

if (instance_exists(player_obj)) {
	if (distance_to_object(player_obj) < 32 && global.keyRed) {
		open = true;
	}
}

if (global.keyRed) {
	camera_obj.redDoorMessage = false;
}

if (instance_exists(player_obj)) {
	if (distance_to_object(player_obj) < 32) {
		if (player_obj.key_up_pressed && open)
		{
			save_scr();
			part_emitter_destroy_all(global.partSystem);
			instance_destroy(player_obj);
			room_goto(level13);
		}
	}
}

//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;