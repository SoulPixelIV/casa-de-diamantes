if (lastWorld == 0) {
	overworldIcon0_obj.draw = true;
	overworldIcon1_obj.draw = false;
	overworldIcon2_obj.draw = false;
	overworldIcon3_obj.draw = false;
}
if (lastWorld == 1) {
	overworldIcon0_obj.draw = false;
	overworldIcon1_obj.draw = true;
	overworldIcon2_obj.draw = false;
	overworldIcon3_obj.draw = false;
}
if (lastWorld == 2) {
	overworldIcon0_obj.draw = false;
	overworldIcon1_obj.draw = false;
	overworldIcon2_obj.draw = true;
	overworldIcon3_obj.draw = false;
}
if (lastWorld == 3) {
	overworldIcon0_obj.draw = false;
	overworldIcon1_obj.draw = false;
	overworldIcon2_obj.draw = false;
	overworldIcon3_obj.draw = true;
}

if (distance_to_point(dest.x, dest.y) > 0) {
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
		if (lastWorld != 0) {
			global.moveToWorld = 0;
			room_goto(blimpAnim);
		}
	}
}
	
if (global.currentWorld == 1 && !startSelectionTimer) {
	if (global.act2Unlocked) {
		if (keyboard_check_pressed(ord("D")) || keyboard_check_pressed(vk_right) || gamepad_button_check_pressed(0, gp_padr) || gamepad_button_check_pressed(4, gp_padr)) {
			global.currentWorld = 2;
			startSelectionTimer = true;
		}
	}
	if (keyboard_check_pressed(ord("A")) || keyboard_check_pressed(vk_left) || gamepad_button_check_pressed(0, gp_padl) || gamepad_button_check_pressed(4, gp_padl)) {
		global.currentWorld = 0;
		startSelectionTimer = true;
	}
	
	if (keyboard_check_pressed(vk_enter) || gamepad_button_check_pressed(0, gp_face1) || gamepad_button_check_pressed(4, gp_face1)) {
		if (!global.reachedCasino) {
			room_goto(level_Casino);
			global.reachedCasino = true;
		} else {
			global.moveToWorld = 1;
			room_goto(blimpAnim);
		}
	}
}

if (global.currentWorld == 2 && !startSelectionTimer) {
	if (global.act3Unlocked) {
		if (keyboard_check_pressed(ord("D")) || keyboard_check_pressed(vk_right) || gamepad_button_check_pressed(0, gp_padr) || gamepad_button_check_pressed(4, gp_padr)) {
			global.currentWorld = 3;
			startSelectionTimer = true;
		}
	}
	if (keyboard_check_pressed(ord("A")) || keyboard_check_pressed(vk_left) || gamepad_button_check_pressed(0, gp_padl) || gamepad_button_check_pressed(4, gp_padl)) {
		global.currentWorld = 1;
		startSelectionTimer = true;
	}
	
	if (keyboard_check_pressed(vk_enter) || gamepad_button_check_pressed(0, gp_face1) || gamepad_button_check_pressed(4, gp_face1)) {
		if (lastWorld != 2) {
			global.moveToWorld = 2;
			room_goto(blimpAnim);
		}
	}
}

if (global.currentWorld == 3 && !startSelectionTimer) {
	if (keyboard_check_pressed(ord("A")) || keyboard_check_pressed(vk_left) || gamepad_button_check_pressed(0, gp_padl) || gamepad_button_check_pressed(4, gp_padl)) {
		global.currentWorld = 2;
		startSelectionTimer = true;
	}
	
	if (keyboard_check_pressed(vk_enter) || gamepad_button_check_pressed(0, gp_face1) || gamepad_button_check_pressed(4, gp_face1)) {
		if (lastWorld != 3) {
			global.moveToWorld = 3;
			room_goto(blimpAnim);
		}
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
if (global.currentWorld == 3) {
	dest = overworldTrigger4_obj
}




