draw_set_font(gothicPixel_fnt);
draw_set_halign(fa_left);
draw_set_color(make_color_rgb(255, 215, 0));
if (menu == 0) {
	draw_text(32, optionsY[0], "[Act1] Arriving at the Casino");
	draw_text(32, optionsY[1], "[Act2] Returning from Senzela Forest");
	draw_text(32, optionsY[2], "[Act3] Escaped from Endless Depths");
	draw_text(32, optionsY[3], "[Act4] Gathered Info from EDEN");
}

draw_set_halign(fa_center);
draw_text(240, 32, "-Story Point Select-");

//Draw cursor
cursorImage += global.dt / 16;
draw_sprite(chipRed_spr, cursorImage, 20, optionsY[cursorPos] + 4);