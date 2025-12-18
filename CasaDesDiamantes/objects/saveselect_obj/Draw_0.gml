draw_set_font(gothicPixel_fnt);
draw_set_halign(fa_center);
draw_set_color(make_color_rgb(255, 215, 0));
draw_text(global.xScreenSize / 4 - 4, 86, "Savefile 1");
draw_text(global.xScreenSize / 2, 86, "Savefile 2");
draw_text(global.xScreenSize / 1.3 + 4, 86, "Savefile 3");

if (file_exists("save1")) {
	ini_open("save1");
	
	var saveMoney = ini_read_real("save1", "money", 0);
	var saveDiamonds = ini_read_real("save1", "diamonds", 0);
	var saveSyringes = ini_read_real("save1", "syringes", 0);
								
	ini_close();
}

draw_set_halign(fa_center);
draw_text(240, 18, "-Save File Select-");

//Cursor
draw_sprite(mousecursor_spr, 0, 
	(window_mouse_get_x() / ((window_get_width()+1) / global.xScreenSize)) + (0), 
	window_mouse_get_y() / ((window_get_height()+1) / global.yScreenSize) + (0));