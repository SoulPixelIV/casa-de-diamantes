if (teleportTimer > 5) {
	draw_self();

	draw_set_font(gothicPixel_fnt);
	draw_set_halign(fa_center);

	draw_set_color(c_black);
	draw_text(global.xScreenSize / 2 - 1, global.yScreenSize - 14 + 1, "Travelling...");
	draw_set_color(make_color_rgb(255, 215, 0));
	draw_text(global.xScreenSize / 2, global.yScreenSize - 14, "Travelling...");
}
