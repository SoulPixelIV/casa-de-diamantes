/// @description Check Player

if ((distance_to_object(player_obj) < 32 && player_obj.key_up_pressed) && !used)
{
	if ((elevatorNumber == 0) || (elevatorNumber == 1 && global.pwlevel2UnlockedElevator) || (elevatorNumber == 2) || (elevatorNumber == 3 && global.pwlevel3UnlockedElevator)) {
		sprite_index = elevatorOpening_spr;
		player_obj.movement = false;
		used = true;
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
	//Path right BACK
	if (elevatorNumber == 0) {
		part_emitter_destroy_all(global.partSystem);
		instance_destroy(player_obj);
		global.spawn = 1;
		global.pwlevel2UnlockedElevator = true;
		room_goto(level1_Powerplant);
	}
	//Path right TO
	if (elevatorNumber == 1 && global.pwlevel2UnlockedElevator) {
		part_emitter_destroy_all(global.partSystem);
		instance_destroy(player_obj);
		global.spawn = 1;
		room_goto(level2_Powerplant);
	}
	//Path left BACK
	if (elevatorNumber == 2) {
		part_emitter_destroy_all(global.partSystem);
		instance_destroy(player_obj);
		global.spawn = 2;
		global.pwlevel3UnlockedElevator = true;
		room_goto(level1_Powerplant);
	}
	//Path left TO
	if (elevatorNumber == 3 && global.pwlevel3UnlockedElevator) {
		part_emitter_destroy_all(global.partSystem);
		instance_destroy(player_obj);
		global.spawn = 1;
		room_goto(level3_Powerplant);
	}
}