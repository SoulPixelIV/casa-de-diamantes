draw_set_font(gothicPixel_fnt);
draw_set_halign(fa_left);
draw_set_color(make_color_rgb(255, 215, 0));
if (menu == 0) {
	draw_text(32, optionsY[0], "Tutorial");
	draw_text(32, optionsY[1], "Casa De Diamantes");
	draw_text(32, optionsY[2], "Warpzones");
	draw_text(32, optionsY[3], "[Act1] Paredia");
	draw_text(32, optionsY[4], "[Act2] Senzela Forest");
	draw_text(32, optionsY[5], "[Act3] Endless Depths");
	draw_text(32, optionsY[6], "[Act4] EDEN Powerplant");
	draw_text(32, optionsY[7], "[Act5] Strato Train Station");
	draw_text(32, optionsY[8], "[Act6] Mothers Womb");
} else if (menu == 1) {
	draw_text(32, optionsY[0], "[Level 1] Paredia");
	draw_text(32, optionsY[1], "[Level 2] Paredia Streets");
	draw_text(32, optionsY[2], "[Level 3] Paredia Cave");
} else if (menu == 2) {
	draw_text(32, optionsY[0], "[Level 4] Senzela Forest Fork Road");
	draw_text(32, optionsY[1], "[Level 5A] Senzela Forest Explosives");
	draw_text(32, optionsY[2], "[Level 5B] Senzela Forest Maze");
	draw_text(32, optionsY[3], "[Level 6] Senzela Crossroad");
	draw_text(32, optionsY[4], "[Level 7] Open Field");
	draw_text(32, optionsY[5], "[Level 8] Blossom Tree");
	draw_text(32, optionsY[6], "[Level 9] Overlook");
} else if (menu == 3) {
	draw_text(32, optionsY[0], "[Level 10] Sewer Fall");
	draw_text(32, optionsY[1], "[Level 11] Corpse Nest");
	draw_text(32, optionsY[2], "[Level 12] Dark Halls");
	draw_text(32, optionsY[3], "[Level 13] The Hole");
	draw_text(32, optionsY[4], "[Level 14] The Great Escape");
} else if (menu == 4) {
	draw_text(32, optionsY[0], "[Warpzone 1] Slotblock Fever");
	draw_text(32, optionsY[1], "[Warpzone 2] Blind Action");
	draw_text(32, optionsY[2], "[Warpzone 3] Grind Rails");
} else if (menu == 5) {
	draw_text(32, optionsY[0], "[Level 15] Permitted Entrance");
	draw_text(32, optionsY[1], "[Level 16] Control Room");
	draw_text(32, optionsY[2], "[Level 17] Gamma Ray Concert");
	draw_text(32, optionsY[3], "[Level 18] Revelation");
	draw_text(32, optionsY[4], "[Level 19] Final Countdown");
} else if (menu == 6) {
	draw_text(32, optionsY[0], "[Level 20] Explosive Opening");
	draw_text(32, optionsY[1], "[Level 21] Parallel Riding");
	draw_text(32, optionsY[2], "[Level 22] Train Crossing Madness");
	draw_text(32, optionsY[3], "[Level 23] Nightmare Tunnels");
	draw_text(32, optionsY[4], "[Level 24] The Awakening");
} else if (menu == 7) {
	draw_text(32, optionsY[0], "Consumed Casino");
	draw_text(32, optionsY[1], "[Level 25] The First Test");
	draw_text(32, optionsY[2], "[Level 26] The Second Test");
	draw_text(32, optionsY[3], "[Level 27] The Third Test");
	draw_text(32, optionsY[4], "[Level 28] The End");
}

draw_set_halign(fa_center);
draw_text(240, 32, "-Level Select-");

//Draw cursor
cursorImage += global.dt / 16;
draw_sprite(chipRed_spr, cursorImage, 20, optionsY[cursorPos] + 4);