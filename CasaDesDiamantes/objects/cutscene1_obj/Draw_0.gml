draw_set_font(gothicPixel_fnt);
draw_set_halign(fa_center);
draw_set_color(make_color_rgb(255, 215, 0));

if (flickerTimer > 0) {
	draw_text(global.xScreenSize / 2, global.yScreenSize / 2.5, "Now let us see if she remembers her training..");
	flickerTimer -= global.dt;
} else {
	flickerDelay -= global.dt;
	if (flickerDelay < 0) {
		flickerTimer = flickerTimerSave + random_range(-12, 12);
		flickerDelay = flickerDelaySave + random_range(-2, 2);
	}
}
