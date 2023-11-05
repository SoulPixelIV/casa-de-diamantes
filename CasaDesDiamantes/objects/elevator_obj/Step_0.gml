/// @description Check Player

if ((distance_to_object(player_obj) < 32 && player_obj.key_up_pressed) && !used && !global.pause)
{
	if (elevatorNumber == 0 || elevatorNumber == 1) {
		sprite_index = goldElevatorOpening_spr;
		player_obj.movement = false;
		camera_obj.drawBlackborders = true;
		camera_obj.drawElevatorSign = true;
		dialogueSystem_obj.inCutscene = true;
	}
}

if (image_index == image_number - 1) {
	image_index = image_number - 1;
	image_speed = 0;
}

if (used) {
	player_obj.image_alpha = 0;
	elevatorTimer -= global.dt;
	if (elevatorTimer < 200 && elevatorTimer > 0) {
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
		instance_destroy(player_obj);
		instance_create_layer(Spawn4_obj.x, Spawn4_obj.y, "Instances", player_obj);
		player_obj.x = Spawn4_obj.x;
		player_obj.y = Spawn4_obj.y;
		player_obj.movement = true;
		camera_obj.drawBlackborders = false;
		camera_obj.drawElevatorSign = false;
		dialogueSystem_obj.inCutscene = false;
		
		blackscreenTimer -= global.dt;
		
		if (blackscreenTimer < 0) {
			player_obj.image_alpha = 1;
			blackscreen_scr(1);
			blackscreenTimer2 -= global.dt;
		}
		if (blackscreenTimer2 < 0) {
			blackscreenTimer = blackscreenTimerSave;
			blackscreenTimer2 = blackscreenTimer2Save;
			elevatorTimer = elevatorTimerSave;
			
			sprite_index = goldElevator_spr;
		
			used = false;
		}
	}
	if (target == 1) {
		part_emitter_destroy_all(global.partSystem);
		instance_destroy(player_obj);
		global.spawn = 0;
		room_goto(level_CasinoRoof);
	}
	if (target == 2) {
		part_emitter_destroy_all(global.partSystem);
		instance_destroy(player_obj);
		global.spawn = 3;
		global.lastCheckpoint = noone;
		room_goto(level_Casino);
	}
	if (target == 3) {
		part_emitter_destroy_all(global.partSystem);
		global.spawn = 0;
		instance_destroy(player_obj);
		instance_create_layer(Spawn3_obj.x, Spawn3_obj.y, "Instances", player_obj);
		player_obj.x = Spawn3_obj.x;
		player_obj.y = Spawn3_obj.y;
		player_obj.movement = true;
		camera_obj.drawBlackborders = false;
		camera_obj.drawElevatorSign = false;
		dialogueSystem_obj.inCutscene = false;

		blackscreenTimer -= global.dt;
		
		if (blackscreenTimer < 0) {
			player_obj.image_alpha = 1;
			blackscreen_scr(1);
			blackscreenTimer2 -= global.dt;
		}
		if (blackscreenTimer2 < 0) {
			blackscreenTimer = blackscreenTimerSave;
			blackscreenTimer2 = blackscreenTimer2Save;
			elevatorTimer = elevatorTimerSave;
			
			sprite_index = goldElevator_spr;
		
			used = false;
		}
	}
	if (target == 4) {
		part_emitter_destroy_all(global.partSystem);
		instance_destroy(player_obj);
		global.spawn = 2;
		room_goto(level_Casino);
	}
}