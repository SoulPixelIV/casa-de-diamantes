/// @description Post Processing

//HUD
draw_text_ext(64, 512, "AMMO: X|Y", 1, 1);
draw_sprite_ext(windowWeapon_spr, 0, 1168, 112, 1, 1, 0, -1, 1);

//Pistol
if (global.pickedWeapon[0])
{
	draw_sprite_ext(windowPistol_spr, 0, 1168, 112, 1, 1, 0, -1, 1);
}
//Dual Barettas
if (global.pickedWeapon[1])
{
	draw_sprite_ext(windowDualBarettas_spr, 0, 1168, 112, 1, 1, 0, -1, 1);
}
//Shotgun
if (global.pickedWeapon[2])
{
	draw_sprite_ext(windowShotgun_spr, 0, 1168, 112, 1, 1, 0, -1, 1);
}

//Lens Dirt
draw_sprite_ext(lensDirt_spr, 0, -200, -200, 1, 1, 0, -1, 0.17);
