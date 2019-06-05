/// @description Post Processing

//HUD
draw_text_ext(64, 512, "AMMO: X|Y", 1, 1);
draw_sprite_ext(windowWeapon_spr, 0, viewX * 2 - 112, 112, 1, 1, 0, -1, 1);

//Lens Dirt
draw_sprite_ext(lensDirt_spr, 0, -200, -200, 1, 1, 0, -1, 0.17);
