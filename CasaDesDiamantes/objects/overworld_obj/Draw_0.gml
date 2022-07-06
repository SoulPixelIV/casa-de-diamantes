draw_set_font(gothicPixel_fnt);
draw_set_halign(fa_left);
draw_set_color(make_color_rgb(255, 215, 0));
draw_text(32, optionsY[0], "Paredia West[WIP] (1)");
draw_text(32, optionsY[1], "Paredia West[WIP] (2)");
draw_text(32, optionsY[2], "Casa De Diamantes");
draw_text(32, optionsY[3], "Senzela Forest (1)");
draw_text(32, optionsY[4], "Senzela Forest (2)");
draw_text(32, optionsY[5], "Senzela Forest (3)");
draw_text(32, optionsY[6], "Senzela Forest (4)");
draw_text(32, optionsY[7], "Eden Powerplant (1)");
draw_text(32, optionsY[8], "Eden Powerplant (2)");
draw_text(32, optionsY[9], "Eden Powerplant (3)");
draw_text(32, optionsY[10], "Eden Powerplant (4)");
draw_text(32, optionsY[11], "Dark Sewers (1)");
draw_text(32, optionsY[12], "Combat Test Rooms");

draw_set_halign(fa_center);
draw_text(240, 32, "-Level Select-");

//Draw cursor
draw_sprite(chipRed_spr, -1, 20, optionsY[cursorPos] + 4);
