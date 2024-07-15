draw_set_font(gothicPixel_fnt);
draw_set_halign(fa_center);
draw_set_color(make_color_rgb(255, 215, 0));
draw_set_alpha(alphaVal / 400);
draw_text(global.xScreenSize / 2, global.yScreenSize / 3, "Nice job Steph but let's call it a day.\nThere are some people you will want to see.\nCome to the VIP floor.");
alphaVal += global.dt;
