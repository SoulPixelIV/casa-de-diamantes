if (global.drawWarningMenu || global.drawStartMenu) {
	draw_set_alpha(0.2);
} else {
	draw_set_alpha(1);
}

draw_set_font(gothicPixel_fnt);
draw_set_halign(fa_center);
draw_set_color(make_color_rgb(255, 215, 0));
draw_text(global.xScreenSize / 4 - 8, 108, "Savefile 1");
draw_text(global.xScreenSize / 2, 110, "Savefile 2");
draw_text(global.xScreenSize / 1.3 - 1, 110, "Savefile 3");

if (file_exists("save1")) {
	ini_open("save1");
	
	var rm_name = ini_read_string("save1", "room", "level0");
	
	// erzwinge string
	rm_name = string(rm_name);
	
	// Jetzt den Raum holen
	var rm_index = asset_get_index(rm_name);
	
	// wenn ungültig → fallback
	if (rm_index < 0 || !room_exists(rm_index)) {
		rm_index = asset_get_index("level0");
	}
	
	var currSection = "Paredia West";
	
	if (rm_index == level_Basement || rm_index == level_Casino || rm_index == level_CasinoRoof || rm_index == level_DiningHall || rm_index == level_TristramRoom) {
		currSection = "Casino";
	}
	if (rm_index == level0 || rm_index == level1 || rm_index == level2 || rm_index == level3) {
		currSection = "Paredia West";
	}
	if (rm_index == level4 || rm_index == level5A || rm_index == level5B || rm_index == level6 || rm_index == level7 || rm_index == level8 || rm_index == level9 || rm_index == warpzone1) {
		currSection = "Senzela Forest";
	}
	if (rm_index == level10 || rm_index == level11 || rm_index == level12 || rm_index == level13 || rm_index == level14 || rm_index == warpzone2) {
		currSection = "Endless Depths";
	}
	if (rm_index == level15 || rm_index == level16 || rm_index == level17 || rm_index == level18 || rm_index == level19 || rm_index == warpzone3) {
		currSection = "EDEN Powerplant";
	}
	if (rm_index == level20 || rm_index == level21 || rm_index == level22 || rm_index == level23 || rm_index == level24) {
		currSection = "Strato Terminal";
	}
	if (rm_index == level25 || rm_index == level26 || rm_index == level27 || rm_index == level28 || rm_index == level_ConsumedCasino || rm_index == level_BasementConsumed) {
		currSection = "Mother's Womb";
	}
	
	var saveMoney = ini_read_real("save1", "money", 0);
	var saveSyringes = ini_read_real("save1", "syringes", 0);
	var saveDiamonds = ini_read_real("save1", "diamonds", 0);
	
	var deaths = ini_read_real("save1", "deaths", 0);
	
	draw_text(global.xScreenSize / 4 - 8, 101 + 32, currSection);
	
	draw_text(global.xScreenSize / 4 - 8, 101 + 48 + 16, "Deaths " + string(deaths));	
	draw_text(global.xScreenSize / 4 - 8, 101 + 64 + 16, "Chips " + string(saveMoney));
	draw_text(global.xScreenSize / 4 - 8, 101 + 80 + 16, "Syringes " + string(saveSyringes));
	draw_text(global.xScreenSize / 4 - 8, 101 + 96 + 16, "Diamonds " + string(saveDiamonds));
								
	ini_close();
}

if (file_exists("save2")) {
	ini_open("save2");
	
	var rm_name = ini_read_string("save2", "room", "level0");
	
	// erzwinge string
	rm_name = string(rm_name);
	
	// Jetzt den Raum holen
	var rm_index = asset_get_index(rm_name);
	
	// wenn ungültig → fallback
	if (rm_index < 0 || !room_exists(rm_index)) {
		rm_index = asset_get_index("level0");
	}
	
	var currSection = "Paredia West";
	
	if (rm_index == level_Basement || rm_index == level_Casino || rm_index == level_CasinoRoof || rm_index == level_DiningHall || rm_index == level_TristramRoom) {
		currSection = "Casino";
	}
	if (rm_index == level0 || rm_index == level1 || rm_index == level2 || rm_index == level3) {
		currSection = "Paredia West";
	}
	if (rm_index == level4 || rm_index == level5A || rm_index == level5B || rm_index == level6 || rm_index == level7 || rm_index == level8 || rm_index == level9 || rm_index == warpzone1) {
		currSection = "Senzela Forest";
	}
	if (rm_index == level10 || rm_index == level11 || rm_index == level12 || rm_index == level13 || rm_index == level14 || rm_index == warpzone2) {
		currSection = "Endless Depths";
	}
	if (rm_index == level15 || rm_index == level16 || rm_index == level17 || rm_index == level18 || rm_index == level19 || rm_index == warpzone3) {
		currSection = "EDEN Powerplant";
	}
	if (rm_index == level20 || rm_index == level21 || rm_index == level22 || rm_index == level23 || rm_index == level24) {
		currSection = "Strato Terminal";
	}
	if (rm_index == level25 || rm_index == level26 || rm_index == level27 || rm_index == level28 || rm_index == level_ConsumedCasino || rm_index == level_BasementConsumed) {
		currSection = "Mother's Womb";
	}
	
	var saveMoney = ini_read_real("save2", "money", 0);
	var saveSyringes = ini_read_real("save2", "syringes", 0);
	var saveDiamonds = ini_read_real("save2", "diamonds", 0);
	
	var deaths = ini_read_real("save2", "deaths", 0);
	
	draw_text(global.xScreenSize / 2, 101 + 32, currSection);
	
	draw_text(global.xScreenSize / 2, 101 + 48 + 16, "Deaths " + string(deaths));	
	draw_text(global.xScreenSize / 2, 101 + 64 + 16, "Chips " + string(saveMoney));
	draw_text(global.xScreenSize / 2, 101 + 80 + 16, "Syringes " + string(saveSyringes));
	draw_text(global.xScreenSize / 2, 101 + 96 + 16, "Diamonds " + string(saveDiamonds));
								
	ini_close();
}

if (file_exists("save3")) {
	ini_open("save3");
	
	var rm_name = ini_read_string("save3", "room", "level0");
	
	// erzwinge string
	rm_name = string(rm_name);
	
	// Jetzt den Raum holen
	var rm_index = asset_get_index(rm_name);
	
	// wenn ungültig → fallback
	if (rm_index < 0 || !room_exists(rm_index)) {
		rm_index = asset_get_index("level0");
	}
	
	var currSection = "Paredia West";
	
	if (rm_index == level_Basement || rm_index == level_Casino || rm_index == level_CasinoRoof || rm_index == level_DiningHall || rm_index == level_TristramRoom) {
		currSection = "Casino";
	}
	if (rm_index == level0 || rm_index == level1 || rm_index == level2 || rm_index == level3) {
		currSection = "Paredia West";
	}
	if (rm_index == level4 || rm_index == level5A || rm_index == level5B || rm_index == level6 || rm_index == level7 || rm_index == level8 || rm_index == level9 || rm_index == warpzone1) {
		currSection = "Senzela Forest";
	}
	if (rm_index == level10 || rm_index == level11 || rm_index == level12 || rm_index == level13 || rm_index == level14 || rm_index == warpzone2) {
		currSection = "Endless Depths";
	}
	if (rm_index == level15 || rm_index == level16 || rm_index == level17 || rm_index == level18 || rm_index == level19 || rm_index == warpzone3) {
		currSection = "EDEN Powerplant";
	}
	if (rm_index == level20 || rm_index == level21 || rm_index == level22 || rm_index == level23 || rm_index == level24) {
		currSection = "Strato Terminal";
	}
	if (rm_index == level25 || rm_index == level26 || rm_index == level27 || rm_index == level28 || rm_index == level_ConsumedCasino || rm_index == level_BasementConsumed) {
		currSection = "Mother's Womb";
	}
	
	var saveMoney = ini_read_real("save3", "money", 0);
	var saveSyringes = ini_read_real("save3", "syringes", 0);
	var saveDiamonds = ini_read_real("save3", "diamonds", 0);
	
	var deaths = ini_read_real("save3", "deaths", 0);
	
	draw_text(global.xScreenSize / 1.3 - 1, 101 + 32, currSection);
	
	draw_text(global.xScreenSize / 1.3 - 1, 101 + 48 + 16, "Deaths " + string(deaths));	
	draw_text(global.xScreenSize / 1.3 - 1, 101 + 64 + 16, "Chips " + string(saveMoney));
	draw_text(global.xScreenSize / 1.3 - 1, 101 + 80 + 16, "Syringes " + string(saveSyringes));
	draw_text(global.xScreenSize / 1.3 - 1, 101 + 96 + 16, "Diamonds " + string(saveDiamonds));
								
	ini_close();
}

draw_set_halign(fa_center);
draw_text(240, 18, "-Save File Select-");

draw_set_alpha(1);

//Cursor
draw_sprite(mousecursor_spr, 0, 
	(window_mouse_get_x() / ((window_get_width()+1) / global.xScreenSize)) + (0), 
	window_mouse_get_y() / ((window_get_height()+1) / global.yScreenSize) + (0));