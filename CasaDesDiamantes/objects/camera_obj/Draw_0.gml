/// @description Player UI

//Ammo Counter
if (!player_obj.reloading)
{
	anim = 0;
	if (global.currentWeapon == pickedWeapon.pistol || global.currentWeapon == pickedWeapon.dualBarettas)
	{
		if (global.pistolAmmo < 5)
		{
			draw_sprite_ext(ammoCounter_spr, global.pistolAmmo, player_obj.x - 22, player_obj.y - 20, 1, 1, 0, -1, 1 / (global.pistolAmmo + 1) * 1.5);
		}
	}
	if (global.currentWeapon == pickedWeapon.shotgun)
	{
		if (global.shotgunAmmo < 3)
		{
			draw_sprite_ext(ammoCounter_spr, global.shotgunAmmo, player_obj.x - 22, player_obj.y - 20, 1, 1, 0, -1, 1 / (global.shotgunAmmo + 1) * 1.5);
		}
	}
}
else
{
	if (anim >= sprite_get_number(ammoCounterReloading_spr))
	{
		anim2 += global.dt / 20;
		draw_sprite_ext(ammoCounterReloadingFailed_spr, anim2, player_obj.x - 22, player_obj.y - 20, 1, 1, 0, -1, 1);
		if (anim2 >= sprite_get_number(ammoCounterReloadingFailed_spr))
		{
			anim2 = 0;
		}
	}
	else
	{
		anim += global.dt / 20;
		draw_sprite_ext(ammoCounterReloading_spr, anim, player_obj.x - 22, player_obj.y - 20, 1, 1, 0, -1, 1);
	}

	//Check Perfect Reload
	if (keyboard_check_pressed(ord("R")) && !reloadFailed && anim > 3)
	{
		if (anim > sprite_get_number(ammoCounterReloading_spr) - 3 && anim <= sprite_get_number(ammoCounterReloading_spr))
		{
			reload_scr();
		}
		else
		{
			reloadFailed = true;
		}
	}
}

//Dash Circle
if (instance_exists(player_obj))
{
	if (player_obj.dashDelay < 150)
	{
		var dashCircle = draw_sprite_ext(dashCircle_spr, 0, player_obj.x, player_obj.y, 1 / (player_obj.dashDelay / 60), 1 / (player_obj.dashDelay / 60), 0, -1, 0.2 / (player_obj.dashDelay / 40))
	}
}
