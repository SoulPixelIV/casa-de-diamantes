draw_self();

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
else if (keyboard_check_pressed(vk_anykey) || mouse_check_button_pressed(mb_left))
{
	inputMethod = 0;
}

if (window_get_fullscreen())
{
	if (window_get_width() != xScreenSize * zoom && window_get_height() != yScreenSize * zoom)
	{
		window_set_size(xWindowSize * zoom, yWindowSize * zoom);
		surface_resize(application_surface, xScreenSize, yScreenSize);
		display_set_gui_size(xScreenSize, yScreenSize);
	}
}
else
{
	window_set_position(display_get_width() / 2 - xScreenSize * zoom, display_get_height() / 2 - yScreenSize * zoom);
}

if (keyboard_check_pressed(ord("P")))
{
	if (zoom == 1)
	{
		zoom = 2;
	}
	else
	{
		zoom = 1;
	}
}

switch (global.currentWorld) {
	case 0:
		worldText = "Paredia"
	break;
	case 1:
		worldText = "Casa De Diamantes"
	break;
	case 2:
		worldText = "Senzela Forest"
	break;
	case 3:
		worldText = "Endless Depths"
	break;
}

draw_set_font(gothicPixel_fnt);
draw_set_halign(fa_center);

draw_set_color(c_black);
draw_text(global.xScreenSize / 2 - 1, global.yScreenSize - 14 + 1, worldText);
draw_set_color(make_color_rgb(255, 215, 0));
draw_text(global.xScreenSize / 2, global.yScreenSize - 14, worldText);

//Cursor
if (inputMethod == 0) {
	draw_sprite(mousecursor_spr, 0, 
		(window_mouse_get_x() / ((window_get_width()+1) / global.xScreenSize)) + (0), 
		window_mouse_get_y() / ((window_get_height()+1) / global.yScreenSize) + (0));
}