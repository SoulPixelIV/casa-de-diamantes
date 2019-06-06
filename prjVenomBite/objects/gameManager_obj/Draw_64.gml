/// @description Draw vars
draw_set_font(neon_fnt);
draw_text_colour(32, 624, "Framerate: " + string(fps_real), c_purple, c_aqua, c_aqua, c_purple, 1);
draw_text_colour(32, 656, "Roomspeed: " + string(fps), c_purple, c_aqua, c_aqua, c_purple, 1);

draw_sprite_ext(windowBackground_spr, 0, 1168, 200, 1, 1, 0, -1, 1);
draw_sprite_ext(healthbarBorder_spr, 0, 32, 48, 1, 1, 0, -1, 1);
draw_sprite_ext(healthbar_spr, 0, 32, 48, player_obj.hp / 100, 1, 0, -1, 1);

//Syringes
for (i = 0; i < player_obj.syringes; i++)
{
	draw_sprite_ext(syringe_spr, 0, 64 + 32 * i, 96, 0.75, 0.75, -10, -1, 1);
}	
	
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
