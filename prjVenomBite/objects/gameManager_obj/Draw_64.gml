/// @description Draw vars
draw_set_font(neon_fnt);
draw_text_colour(32, 32, "Framerate: " + string(fps_real), c_purple, c_aqua, c_aqua, c_purple, 1);
draw_text_colour(32, 64, "Roomspeed: " + string(fps), c_purple, c_aqua, c_aqua, c_purple, 1);

draw_sprite_ext(windowBackground_spr, 0, 1168, 200, 1, 1, 0, -1, 1);
if (global.pickedWeapon[0])
{
	draw_text_colour(1104, 191, "AMMO " + string(global.pistolAmmo) + "|" + string(global.pistolMag), c_purple, c_aqua, c_aqua, c_purple, 1);
}
if (global.pickedWeapon[1])
{
	draw_text_colour(1104, 190, "AMMO " + string(global.dualBarettasAmmo) + "|" + string(global.dualBarettasMag), c_purple, c_aqua, c_aqua, c_purple, 1);
}
if (global.pickedWeapon[2])
{
	draw_text_colour(1104, 190, "AMMO " + string(global.shotgunAmmo) + "|" + string(global.shotgunMag), c_purple, c_aqua, c_aqua, c_purple, 1);
}
