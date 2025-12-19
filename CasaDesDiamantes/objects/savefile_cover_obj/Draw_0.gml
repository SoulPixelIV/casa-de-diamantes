draw_self();

//Warning Window
if (global.drawWarningMenu && !global.drawStartMenu && !global.drawSkipMenu) {
	draw_sprite_ext(menuWindow_spr, 0, global.xScreenSize / 2, global.yScreenSize / 2.5, 1, 0.79, 0, -1, 1);
	draw_set_font(gothicPixel_fnt);
	draw_set_halign(fa_center);
	draw_set_color(c_black);
	draw_set_alpha(1);
	draw_text(global.xScreenSize / 2 - 1, global.yScreenSize / 2.5 - 45, "Important!\nThe selected save file is corrupted due to an Update.\nEverything except for the level progress is saved!\nPlease use the Level Select in the Main Menu.\nPress any key");
	draw_set_color(make_color_rgb(255, 215, 0));
	draw_text(global.xScreenSize / 2, global.yScreenSize / 2.5 - 45, "Important!\nThe selected save file is corrupted due to an Update.\nEverything except for the level progress is saved!\nPlease use the Level Select in the Main Menu.\nPress any key!");
}

//Go to Background
if (global.drawWarningMenu) {
	image_alpha = 0.2;
} else {
	image_alpha = 1;
}