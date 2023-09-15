draw_set_font(gothicPixel_fnt);
draw_set_halign(fa_left);
draw_set_color(make_color_rgb(255, 215, 0));
draw_text(32, optionsY[0], "Tutorial");
draw_text(32, optionsY[1], "[Level 1] Paredia");
draw_text(32, optionsY[2], "[Level 2] Paredia Streets");
draw_text(32, optionsY[3], "[Level 3] Paredia Cave");
draw_text(32, optionsY[4], "[Hub] Casa De Diamantes");
draw_text(32, optionsY[5], "[Level 4] Senzela Forest Fork Road");
draw_text(32, optionsY[6], "[Level 5A] Senzela Forest Explosives");
draw_text(32, optionsY[7], "[Level 5B] Senzela Forest Maze");
draw_text(32, optionsY[8], "[Level 6] Senzela Crossroad");
draw_text(32, optionsY[9], "[Level 7] Open Field");
draw_text(32, optionsY[10], "[Level 8] Blossom Tree");
draw_text(32, optionsY[11], "[Level 9] Cliff Overhang");

draw_set_halign(fa_center);
draw_text(240, 32, "-Level Select-");

//Draw cursor
draw_sprite(chipRed_spr, -1, 20, optionsY[cursorPos] + 4);
