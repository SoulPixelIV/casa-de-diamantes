draw_set_font(gothicPixel_fnt);
draw_set_halign(fa_left);
draw_set_color(make_color_rgb(255, 215, 0));
draw_text(256, optionsY[0], "Head: " + string(global.hatlist[currSelectionHat]));
draw_text(256, optionsY[1], "Top1: " + string(global.top1list[currSelectionTop1]));
draw_text(256, optionsY[2], "Top2: " + string(global.top2list[currSelectionTop2]));
draw_text(256, optionsY[3], "Legs: " + string(global.bottomlist[currSelectionBottom]));
draw_text(256, optionsY[4], "DONE");

draw_set_halign(fa_center);
draw_text(240, 32, "-Choose your Style-");

//Draw cursor
draw_sprite(chipRed_spr, -1, 20, optionsY[cursorPos] + 4);

//Draw gold border
draw_sprite(guiBorder_spr, 0, 0, 0);
