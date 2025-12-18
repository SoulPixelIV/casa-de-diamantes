draw_set_font(gothicPixel_fnt);
draw_set_halign(fa_left);
draw_set_color(make_color_rgb(255, 215, 0));

draw_text(global.xScreenSize / 3, optionsY[0], "Savefile 1");
draw_text(global.xScreenSize / 3, optionsY[1], "Savefile 2");
draw_text(global.xScreenSize / 3, optionsY[2], "Savefile 3");

draw_set_halign(fa_center);
draw_text(240, 18, "-Save File Select-");

//Draw Menu Chip
cursorImage += global.dt / 16;
draw_sprite(chipRed_spr, cursorImage, global.xScreenSize / 3 - 20, optionsY[cursorPos] + 4);

//Cursor
draw_sprite(mousecursor_spr, 0, 
	(window_mouse_get_x() / ((window_get_width()+1) / global.xScreenSize)) + (0), 
	window_mouse_get_y() / ((window_get_height()+1) / global.yScreenSize) + (0));