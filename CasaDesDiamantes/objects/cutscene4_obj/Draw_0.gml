draw_set_font(gothicPixel_fnt);
draw_set_halign(fa_center);
draw_set_color(make_color_rgb(255, 215, 0));
draw_set_alpha(alphaVal / 400);
draw_text(global.xScreenSize / 2, global.yScreenSize / 3, "Cash Received: $7500");
alphaVal += global.dt;
