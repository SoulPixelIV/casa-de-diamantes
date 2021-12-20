draw_set_font(gothicPixel_fnt);
draw_set_halign(fa_left);
draw_set_color(make_color_rgb(255, 215, 0));
draw_text(32, optionsY[0], "Paredia West");
draw_text(32, optionsY[1], "Casa De Diamantes");
draw_text(32, optionsY[2], "Senzela Forest");
draw_text(32, optionsY[3], "Eden Powerplant");
draw_text(32, optionsY[4], "Infinite Spawn");

draw_set_halign(fa_center);
draw_text(240, 32, "-Level Select-");

//Draw cursor
draw_sprite(chipRed_spr, -1, 20, optionsY[cursorPos] + 4);
