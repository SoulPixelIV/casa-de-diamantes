if (lastWorld == 0) {
	overworldIcon0_obj.draw = true;
	overworldIcon1_obj.draw = false;
	overworldIcon2_obj.draw = false;
	overworldIcon3_obj.draw = false;
	overworldIcon4_obj.draw = false;
}
if (lastWorld == 1) {
	overworldIcon0_obj.draw = false;
	overworldIcon1_obj.draw = true;
	overworldIcon2_obj.draw = false;
	overworldIcon3_obj.draw = false;
	overworldIcon4_obj.draw = false;
}
if (lastWorld == 2) {
	overworldIcon0_obj.draw = false;
	overworldIcon1_obj.draw = false;
	overworldIcon2_obj.draw = true;
	overworldIcon3_obj.draw = false;
	overworldIcon4_obj.draw = false;
}
if (lastWorld == 3) {
	overworldIcon0_obj.draw = false;
	overworldIcon1_obj.draw = false;
	overworldIcon2_obj.draw = false;
	overworldIcon3_obj.draw = true;
	overworldIcon4_obj.draw = false;
}
if (lastWorld == 4) {
	overworldIcon0_obj.draw = false;
	overworldIcon1_obj.draw = false;
	overworldIcon2_obj.draw = false;
	overworldIcon3_obj.draw = false;
	overworldIcon4_obj.draw = true;
}

if (distance_to_point(dest.x, dest.y) > 0) {
	move_towards_point(dest.x, dest.y, global.dt);
} else {
	speed = 0;
}

//Mouse Cursor Controls
if (instance_exists(cursorHitbox_obj)) {
	for (var i = 0; i < instance_number(cursorHitbox_obj); ++i;) {
		var hitbox = instance_find(cursorHitbox_obj, i);
		if (instance_exists(hitbox)) {
			if (hitbox.open) {
				
				if (hitbox.index == 2 && global.act2Unlocked) {
					global.currentWorld = 2;
				} else if (hitbox.index == 3 && global.act4Unlocked) {
					global.currentWorld = 3;
				} else if (hitbox.index == 4 && global.act3Unlocked) {
					global.currentWorld = 4;
				} else if (hitbox.index == 1) {
					global.currentWorld = 1;
				} else if (hitbox.index == 0) {
					global.currentWorld = 0;
				}
				
				if (mouse_check_button_pressed(mb_left)) {
					audio_play_sound(typewriterPush_snd, 1, false);
					switch (global.currentWorld)
					{
						case 0:
							if (lastWorld != 0) {
								global.moveToWorld = 0;
								room_goto(blimpAnim);
							}
						break;
						case 1:
							if (!global.reachedCasino) {
								room_goto(level_Casino);
								global.reachedCasino = true;
							} else {
								global.moveToWorld = 1;
								room_goto(blimpAnim);
							}
						break;
						case 2:
							if (lastWorld != 2) {
								global.moveToWorld = 2;
								room_goto(blimpAnim);
							}
						break;
						case 3:
							if (lastWorld != 3) {
								global.moveToWorld = 3;
								room_goto(blimpAnim);
							}
						break;
						case 4:
							if (lastWorld != 4) {
								if (global.act3Unlocked && !global.act4Unlocked) {
									global.moveToWorld = 6;
								}
								if (global.act3Unlocked && global.act4Unlocked) {
									global.moveToWorld = 5;
								}
								room_goto(blimpAnim2);
							}
						break;
					}
				}
			}
		}
	}
}

if (global.currentWorld == 0 && !startSelectionTimer) {
	if (keyboard_check_pressed(ord("D")) || keyboard_check_pressed(vk_right) || gamepad_button_check_pressed(0, gp_padr) || gamepad_button_check_pressed(4, gp_padr)) {
		audio_play_sound(typewriter_snd, 1, false);
		global.currentWorld = 1;
		startSelectionTimer = true;
	}
	
	if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(0, gp_face1) || gamepad_button_check_pressed(4, gp_face1)) {
		audio_play_sound(typewriterPush_snd, 1, false);
		if (lastWorld != 0) {
			global.moveToWorld = 0;
			room_goto(blimpAnim);
		}
	}
}
	
if (global.currentWorld == 1 && !startSelectionTimer) {
	if (global.act2Unlocked) {
		if (keyboard_check_pressed(ord("D")) || keyboard_check_pressed(vk_right) || gamepad_button_check_pressed(0, gp_padr) || gamepad_button_check_pressed(4, gp_padr)) {
			audio_play_sound(typewriter_snd, 1, false);
			global.currentWorld = 2;
			startSelectionTimer = true;
		}
	}
	if (keyboard_check_pressed(ord("A")) || keyboard_check_pressed(vk_left) || gamepad_button_check_pressed(0, gp_padl) || gamepad_button_check_pressed(4, gp_padl)) {
		audio_play_sound(typewriter_snd, 1, false);
		global.currentWorld = 0;
		startSelectionTimer = true;
	}
	
	if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(0, gp_face1) || gamepad_button_check_pressed(4, gp_face1)) {
		audio_play_sound(typewriterPush_snd, 1, false);
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
			audio_play_sound(typewriter_snd, 1, false);
			global.currentWorld = 3;
			startSelectionTimer = true;
		}
	}
	if (keyboard_check_pressed(ord("A")) || keyboard_check_pressed(vk_left) || gamepad_button_check_pressed(0, gp_padl) || gamepad_button_check_pressed(4, gp_padl)) {
		audio_play_sound(typewriter_snd, 1, false);
		global.currentWorld = 1;
		startSelectionTimer = true;
	}
	
	if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(0, gp_face1) || gamepad_button_check_pressed(4, gp_face1)) {
		audio_play_sound(typewriterPush_snd, 1, false);
		if (lastWorld != 2) {
			global.moveToWorld = 2;
			room_goto(blimpAnim);
		}
	}
}

if (global.currentWorld == 3 && !startSelectionTimer) {
	if (global.act4Unlocked) {
		if (keyboard_check_pressed(ord("D")) || keyboard_check_pressed(vk_right) || gamepad_button_check_pressed(0, gp_padr) || gamepad_button_check_pressed(4, gp_padr)) {
			audio_play_sound(typewriter_snd, 1, false);
			global.currentWorld = 4;
			startSelectionTimer = true;
		}
	}
	if (keyboard_check_pressed(ord("A")) || keyboard_check_pressed(vk_left) || gamepad_button_check_pressed(0, gp_padl) || gamepad_button_check_pressed(4, gp_padl)) {
		audio_play_sound(typewriter_snd, 1, false);
		global.currentWorld = 2;
		startSelectionTimer = true;
	}
	
	if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(0, gp_face1) || gamepad_button_check_pressed(4, gp_face1)) {
		audio_play_sound(typewriterPush_snd, 1, false);
		if (lastWorld != 3) {
			global.moveToWorld = 3;
			room_goto(blimpAnim);
		}
	}
}

if (global.currentWorld == 4 && !startSelectionTimer) {
	if (global.act4Unlocked) {
		if (keyboard_check_pressed(ord("D")) || keyboard_check_pressed(vk_right) || gamepad_button_check_pressed(0, gp_padr) || gamepad_button_check_pressed(4, gp_padr)) {
			audio_play_sound(typewriter_snd, 1, false);
			global.currentWorld = 4;
			startSelectionTimer = true;
		}
	}
	if (keyboard_check_pressed(ord("A")) || keyboard_check_pressed(vk_left) || gamepad_button_check_pressed(0, gp_padl) || gamepad_button_check_pressed(4, gp_padl)) {
		audio_play_sound(typewriter_snd, 1, false);
		global.currentWorld = 3;
		startSelectionTimer = true;
	}
	
	if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(0, gp_face1) || gamepad_button_check_pressed(4, gp_face1)) {
		audio_play_sound(typewriterPush_snd, 1, false);
		if (lastWorld != 4) {
			global.moveToWorld = 4;
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
if (global.currentWorld == 4) {
	dest = overworldTrigger5_obj
}




