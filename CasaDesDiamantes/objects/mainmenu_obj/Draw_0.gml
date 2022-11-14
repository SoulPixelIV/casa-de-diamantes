draw_set_font(gothicPixel_fnt);
draw_set_halign(fa_left);
draw_set_color(make_color_rgb(255, 215, 0));
draw_text(32, optionsY[0], "New Game");
draw_text(32, optionsY[1], "Level Select");
draw_text(32, optionsY[2], "Settings [WIP]");
draw_text(32, optionsY[3], "Exit");

draw_set_halign(fa_right);
draw_text(global.xScreenSize - 24, global.yScreenSize - 16, "Alpha v.0.8");
draw_set_halign(fa_left);

//Draw title
draw_sprite_ext(mainmenuTitle_spr, 0, global.xScreenSize / 2, 86, 1, 1, 0, -1, titleAlpha);

//Draw cursor
draw_sprite(chipRed_spr, -1, 20, optionsY[cursorPos] + 4);
