draw_self();
draw_set_font(gothicPixel_fnt);
draw_set_halign(fa_center);

draw_set_color(c_black);
draw_text(global.xScreenSize / 2 - 1, 16 + 1, "Cindy's Equipment");
draw_set_color(make_color_rgb(255, 215, 0));
draw_text(global.xScreenSize / 2, 16, "Cindy's Equipment");

draw_set_color(c_black);
draw_text(global.xScreenSize / 2 - 1, global.yScreenSize / 5.5 + 1, "- Select an Upgrade -");
draw_set_color(make_color_rgb(255, 215, 0));
draw_text(global.xScreenSize / 2, global.yScreenSize / 5.5, "- Select an Upgrade -");

/*
cursorAnim += global.dtNoSlowmo / 17;
switch (cursorPos)
{
	case 0:
		draw_sprite(chipRed_spr, cursorAnim, global.xScreenSize / 2 - 64, global.yScreenSize / 3 + 64 + 4);
	break;
	case 1:
		draw_sprite(chipRed_spr, cursorAnim, global.xScreenSize / 2 - 64, global.yScreenSize / 3 + 64 + 18 + 4);
	break;
	case 2:
		draw_sprite(chipRed_spr, cursorAnim, global.xScreenSize / 2 - 64, global.yScreenSize / 3 + 64 + 36 + 4);
	break;
}
*/

//Cursor
if (inputMethod == 0) {
	draw_sprite(cursor_spr, 0, 
		(window_mouse_get_x() / ((window_get_width()+1) / global.xScreenSize)) + (0), 
		window_mouse_get_y() / ((window_get_height()+1) / global.yScreenSize) + (0));
}
