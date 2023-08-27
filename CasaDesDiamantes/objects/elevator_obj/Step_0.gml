/// @description Check Player

if ((distance_to_object(player_obj) < 32 && player_obj.key_up_pressed) && !used && !global.pause)
{
	if (elevatorNumber == 0 || elevatorNumber == 1) {
		sprite_index = goldElevatorOpening_spr;
		player_obj.movement = false;
		camera_obj.drawBlackborders = true;
		camera_obj.drawElevatorSign = true;
		dialogueSystem_obj.inCutscene = true;
		//used = true;
	}
}

if (image_index == image_number - 1) {
	image_index = image_number - 1;
	image_speed = 0;
}

if (used) {
	player_obj.image_alpha = 0;
	elevatorTimer -= global.dt;
	if (elevatorTimer < 200) {
		blackscreen_scr(0);
	}
}

//Animation
if (image_index < image_number - 1) {
	image_speed = 0;
	image_index += (global.dt / 15) * animationSpeed;
}

if (elevatorTimer < 0 && used) {
	if (target == 0) {
		part_emitter_destroy_all(global.partSystem);
		global.spawn = 3;
		player_obj.x = Spawn4_obj.x;
		player_obj.y = Spawn4_obj.y;
		used = false;
	}
	if (target == 1) {
		part_emitter_destroy_all(global.partSystem);
		instance_destroy(player_obj);
		global.spawn = 2;
		room_goto(level_Casino);
	}
}