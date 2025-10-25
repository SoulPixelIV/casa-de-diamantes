//Escape
if (keyboard_check(vk_escape) || gamepad_button_check_pressed(4, gp_select) || gamepad_button_check_pressed(0, gp_select) || gamepad_button_check_pressed(4, gp_face2) || gamepad_button_check_pressed(0, gp_face2))
{
	global.spawn = 1;
	room_goto(level25);
}

//Check for Controller or Keyboard
if (gamepad_button_check_pressed(4, gp_face1) || gamepad_button_check_pressed(0, gp_face1)
 || gamepad_axis_value(4, gp_axislh) < -0.4 || gamepad_axis_value(0, gp_axislh) < -0.4
  || gamepad_button_check(4, gp_padu) || gamepad_axis_value(4, gp_axislv) < -0.4 || gamepad_button_check(0, gp_padu) || gamepad_axis_value(0, gp_axislv) < -0.4
   || gamepad_button_check(4, gp_padu) || gamepad_axis_value(4, gp_axislv) < -0.4 || gamepad_button_check(0, gp_padu) || gamepad_axis_value(0, gp_axislv) < -0.4
    || gamepad_button_check(4, gp_padd) || gamepad_axis_value(4, gp_axislv) > 0.4 || gamepad_button_check(0, gp_padd) || gamepad_axis_value(0, gp_axislv) > 0.4
	 || gamepad_button_check_pressed(4, gp_shoulderrb) || gamepad_button_check_pressed(0, gp_shoulderrb)
	  || gamepad_button_check_pressed(4, gp_face2) || gamepad_button_check_pressed(0, gp_face2)
	   || gamepad_button_check_pressed(4, gp_face3) || gamepad_button_check_pressed(0, gp_face3)
	    || gamepad_button_check(4, gp_shoulderlb) || gamepad_button_check(0, gp_shoulderlb)
		 || gamepad_button_check_pressed(4, gp_start) || gamepad_button_check_pressed(0, gp_start))
{
	inputMethod = 1;
}
else if (keyboard_check_pressed(vk_anykey))
{
	inputMethod = 0;
}

var pad = -1;
if (gamepad_is_connected(0)) pad = 0;
else if (gamepad_is_connected(4)) pad = 4;

if (inputMethod != 0) {
	if (pad != -1) {
		var inputx = gamepad_axis_value(pad, gp_axislh);
		var inputy = gamepad_axis_value(pad, gp_axislv);
		
		// Deadzone, damit der Cursor nicht zittert:
		if (abs(inputx) < 0.2) inputx = 0;
		if (abs(inputy) < 0.2) inputy = 0;
	
		var cursorx = window_mouse_get_x() + inputx * scrollSpeed;
		var cursory = window_mouse_get_y() + inputy * scrollSpeed;
		
		cursorx = clamp(cursorx, 0, display_get_width());
		cursory = clamp(cursory, 0, display_get_height());
	
		window_mouse_set(cursorx, cursory);
	}
}