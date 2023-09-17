//Escape
if (keyboard_check(vk_escape) || gamepad_button_check_pressed(4, gp_select) || gamepad_button_check_pressed(0, gp_select) || gamepad_button_check_pressed(4, gp_face2) || gamepad_button_check_pressed(0, gp_face2))
{
	global.spawn = 6;
	room_goto(level_Casino);
}
