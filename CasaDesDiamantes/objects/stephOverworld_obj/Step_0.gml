if (distance_to_object(dest) > 4) {
	move_towards_point(dest.x, dest.y, global.dt);
} else {
	speed = 0;
}

if (global.currentWorld == 0 && !startSelectionTimer) {
	if (keyboard_check_pressed(ord("D")) || keyboard_check_pressed(vk_right) || gamepad_button_check_pressed(0, gp_padr) || gamepad_button_check_pressed(4, gp_padr)) {
		global.currentWorld = 1;
		startSelectionTimer = true;
	}
	
	if (keyboard_check_pressed(vk_enter) || gamepad_button_check_pressed(0, gp_face1) || gamepad_button_check_pressed(4, gp_face1)) {
		room_goto(level1);
	}
}
	
if (global.currentWorld == 1 && !startSelectionTimer) {
	if (keyboard_check_pressed(ord("D")) || keyboard_check_pressed(vk_right) || gamepad_button_check_pressed(0, gp_padr) || gamepad_button_check_pressed(4, gp_padr)) {
		global.currentWorld = 2;
		startSelectionTimer = true;
	}
	if (keyboard_check_pressed(ord("A")) || keyboard_check_pressed(vk_left) || gamepad_button_check_pressed(0, gp_padl) || gamepad_button_check_pressed(4, gp_padl)) {
		global.currentWorld = 0;
		startSelectionTimer = true;
	}
	
	if (keyboard_check_pressed(vk_enter) || gamepad_button_check_pressed(0, gp_face1) || gamepad_button_check_pressed(4, gp_face1)) {
		room_goto(level_Casino);
	}
}

if (global.currentWorld == 2 && !startSelectionTimer) {
	if (keyboard_check_pressed(ord("A")) || keyboard_check_pressed(vk_left) || gamepad_button_check_pressed(0, gp_padl) || gamepad_button_check_pressed(4, gp_padl)) {
		global.currentWorld = 1;
		startSelectionTimer = true;
	}
	
	if (keyboard_check_pressed(vk_enter) || gamepad_button_check_pressed(0, gp_face1) || gamepad_button_check_pressed(4, gp_face1)) {
		room_goto(level4);
	}
}

if (startSelectionTimer) {
	selectionDelay -= global.dt;
}

if (selectionDelay < 0) {
	startSelectionTimer = false;
	selectionDelay = selectionDelaySave;
}



if (global.currentWorld == 0) {
	dest = overworldTrigger1_obj
}
if (global.currentWorld == 1) {
	dest = overworldTrigger2_obj
}
if (global.currentWorld == 2) {
	dest = overworldTrigger3_obj
}




