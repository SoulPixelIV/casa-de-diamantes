/// @description Player UI

//Ammo Counter
if (global.currentWeapon = pickedWeapon.pistol)
{
	if (global.pistolAmmo < 5)
	{
		draw_sprite_ext(ammoCounter_spr, global.pistolAmmo, player_obj.x - 22, player_obj.y - 20, 1, 1, 0, -1, 1 / (global.pistolAmmo + 1) * 1.5);
	}
}
if (global.currentWeapon = pickedWeapon.dualBarettas)
{
	if (global.dualBarettasAmmo < 5)
	{
		draw_sprite_ext(ammoCounter_spr, global.dualBarettasAmmo, player_obj.x - 22, player_obj.y - 20, 1, 1, 0, -1, 1 / (global.dualBarettasAmmo + 1) * 1.5);
	}
}
if (global.currentWeapon = pickedWeapon.shotgun)
{
	if (global.shotgunAmmo < 3)
	{
		draw_sprite_ext(ammoCounter_spr, global.shotgunAmmo, player_obj.x - 22, player_obj.y - 20, 1, 1, 0, -1, 1 / (global.shotgunAmmo + 1) * 1.5);
	}
}

//Dash Circle
if (player_obj.dashDelay < 150)
{
	var dashCircle = draw_sprite_ext(dashCircle_spr, 0, player_obj.x, player_obj.y, 1 / (player_obj.dashDelay / 60), 1 / (player_obj.dashDelay / 60), 0, -1, 0.2 / (player_obj.dashDelay / 40))	
}
