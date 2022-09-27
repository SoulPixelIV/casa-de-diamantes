draw_set_font(gothicPixel_fnt);
draw_set_halign(fa_left);
draw_set_color(make_color_rgb(255, 215, 0));
draw_text(32, optionsY[0], "New Game");
draw_text(32, optionsY[1], "Level Select");
draw_text(32, optionsY[2], "Setting -NOT DONE-");
draw_text(32, optionsY[3], "Exit");

draw_set_halign(fa_right);
draw_text(global.xScreenSize - 24, global.yScreenSize - 16, "v.0.6");
draw_set_halign(fa_left);

//Draw title
draw_sprite(mainmenuTitle_spr, 0, global.xScreenSize / 2, 86);

//Draw cursor
draw_sprite(chipRed_spr, -1, 20, optionsY[cursorPos] + 4);
