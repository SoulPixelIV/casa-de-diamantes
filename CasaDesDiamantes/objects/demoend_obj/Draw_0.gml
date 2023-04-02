draw_self();
draw_set_font(gothicPixel_fnt);
draw_set_halign(fa_center);
draw_set_color(make_color_rgb(255, 215, 0));
draw_text(global.xScreenSize / 2, global.yScreenSize / 3.5, "END OF DEMO");
draw_text(global.xScreenSize / 2, global.yScreenSize / 3.5 + 24, "THANK YOU FOR PLAYING!");

draw_text(global.xScreenSize / 2, global.yScreenSize / 3 + 64, "Wishlist on Steam");
draw_text(global.xScreenSize / 2, global.yScreenSize / 3 + 64 + 18, "Return to Casino");
draw_text(global.xScreenSize / 2, global.yScreenSize / 3 + 64 + 36, "Quit to Main Menu");

cursorAnim += global.dtNoSlowmo / 17;
switch (cursorPos)
{
	case 0:
		draw_sprite(chipRed_spr, cursorAnim, global.xScreenSize / 2 - 64, global.yScreenSize / 3 + 64 + 4);
	break;
	case 1:
		draw_sprite(chipRed_spr, cursorAnim, global.xScreenSize / 2 - 64, global.yScreenSize / 3 + 64 + 18 + 4);
	break;
	case 2:
		draw_sprite(chipRed_spr, cursorAnim, global.xScreenSize / 2 - 64, global.yScreenSize / 3 + 64 + 36 + 4);
	break;
}
