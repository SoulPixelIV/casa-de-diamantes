/// @description Movement

x += (hspeed / 10000) * (dt - delta_time);
y += (vspeed / 10000) * (dt - delta_time);

key_jump = keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(0, gp_face1);
key_jump_hold = keyboard_check(vk_space) || gamepad_button_check(0, gp_face1);
key_jump_release = keyboard_check_released(vk_space) || gamepad_button_check_released(0, gp_face1);
key_shift_hold = keyboard_check(vk_shift) || gamepad_button_check(0, gp_face2);

//Movement
if (keyboard_check(ord("D")) && !keyboard_check(ord("A")))
{
	hspeed = movSpeed;
}
if (keyboard_check(ord("A")) && !keyboard_check(ord("D")))
{
	hspeed = -movSpeed;
}

if (hspeed > 0)
{
	hspeed -= frictionStrength;
	if (hspeed < 0.3)
	{
		hspeed = 0;
	}
}
else
{
	hspeed += frictionStrength;
	if (hspeed > -0.3)
	{
		hspeed = 0;
	}
}

//Gravity
if (vspeed < 14)
{
	vspeed = vspeed - gravityStrength;
}

//Jump
if (grounded && (key_jump) || fallJumpSafety > 0 && (key_jump))
{
    vspeed = -jumpStrength;
}
   
if (key_jump_release && fullJump == false)
{
    if (vspeed < 0)
    {
        vspeed = vspeed / 2;
    }
}

//Collision
//Hspeed
if (!place_free(x + hspeed, y))
{
    while (place_free(x + sign(hspeed), y))
    {
        x += sign(hspeed);
    }
    hspeed = 0;
} 
//Vspeed
if (!place_free(x, y + vspeed))
{
    while (place_free(x, y + sign(vspeed)))
    {
        y += sign(vspeed);
    }
    fullJump = false;
	fallJumpSafety = fallJumpSafetySave;
    vspeed = 0;   
}
else
{
	fallJumpSafety -= 1;
}

//###Weapon System###
dirCursor = point_direction(x, y, mouse_x, mouse_y);

if (global.pickedWeapon[0] || global.pickedWeapon[1] || global.pickedWeapon[2])
{
	if (hspeed != 0)
	{
		sprite_index = playerWalkingEquipped_spr;
	}
	else
	{
		if (crouching)
		{
			sprite_index = playerKnifeBuildup_spr;
		}
		else
		{
			sprite_index = playerEquipped_spr;
		}
	}
}
else
{
	if (hspeed != 0)
	{
		sprite_index = playerWalking_spr;
	}
	else
	{
		if (crouching)
		{
			sprite_index = playerKnifeBuildup_spr;
		}
		else
		{
			sprite_index = player_spr;
		}
	}
}

//Pistol
if (mouse_check_button_pressed(mb_left) && global.pickedWeapon[0] && global.pistolCooldown <= 0)
{
	//Check Ammo
	if (global.pistolAmmo > 0)
	{
		audio_play_sound(pistolShot_snd, 1, false);
		if (image_xscale == 1)
		{
			instance_create_layer(x + 25, y - 1, "Instances", bulletPistol_obj);
			instance_create_layer(x + 25, y - 1, "Instances", shotLight_obj);
			hspeed -= 1;
		}
		else
		{
			instance_create_layer(x - 25, y - 1, "Instances", bulletPistol_obj);
			instance_create_layer(x - 25, y - 1, "Instances", shotLight_obj);
			hspeed += 1;
		}
		global.pistolAmmo--;
		global.pistolCooldown = global.pistolCooldownSave;
	}
}

//Dual Barettas
if (mouse_check_button_pressed(mb_left) && global.pickedWeapon[1] && global.dualBarettasCooldown <= 0)
{
	//Check Ammo
	if (global.dualBarettasAmmo > 0)
	{
		audio_play_sound(dualBarettasShot_snd, 1, false);
		if (image_xscale == 1)
		{
			instance_create_layer(x + 25, y - 1, "Instances", bulletDualBarettas_obj);
			instance_create_layer(x + 25, y - 1, "Instances", shotLight_obj);
			hspeed -= 2;
		}
		else
		{
			instance_create_layer(x - 25, y - 1, "Instances", bulletDualBarettas_obj);
			instance_create_layer(x - 25, y - 1, "Instances", shotLight_obj);
			hspeed += 2;
		}
		global.dualBarettasAmmo--;
		global.dualBarettasCooldown = global.dualBarettasCooldownSave;
	}
}

//Shotgun
if (mouse_check_button_pressed(mb_left) && global.pickedWeapon[2] && global.shotgunCooldown <= 0)
{
	//Check Ammo
	if (global.shotgunAmmo > 0)
	{
		audio_play_sound(shotgunShot_snd, 1, false);
		if (image_xscale == 1)
		{
			instance_create_layer(x + 25, y - 1, "Instances", bulletShotgun_obj);
			instance_create_layer(x + 25, y - 1, "Instances", shotLight_obj);
			hspeed -= 6;
		}
		else
		{
			instance_create_layer(x - 25, y - 1, "Instances", bulletShotgun_obj);
			instance_create_layer(x - 25, y - 1, "Instances", shotLight_obj);
			hspeed += 6;
		}
		global.shotgunAmmo--;
		global.shotgunCooldown = global.shotgunCooldownSave;
	}
}

//Shot Cooldown
if (global.pistolCooldown > 0 || global.dualBarettasCooldown > 0 || global.shotgunCooldown > 0)
{
	global.pistolCooldown -= 0.1;
	global.dualBarettasCooldown -= 0.1;
	global.shotgunCooldown -= 0.1;
}

//Reload
if (keyboard_check_pressed(ord("R")))
{
	if (global.pickedWeapon[0])
	{
		if (global.pistolMag >= 6 && global.pistolAmmo < 6)
		{
			global.pistolMag -= 6 - global.pistolAmmo;
			global.pistolAmmo += 6 - global.pistolAmmo;
		}
	
		if (global.pistolMag < 6 && global.pistolAmmo < 6)
		{
			global.pistolAmmo += global.pistolMag;
			global.pistolMag = 0;
		}
	}
	if (global.pickedWeapon[1])
	{
		if (global.dualBarettasMag >= 12 && global.dualBarettasAmmo < 12)
		{
			global.dualBarettasMag -= 12 - global.dualBarettasAmmo;
			global.dualBarettasAmmo += 12 - global.dualBarettasAmmo;
		}
	
		if (global.dualBarettasMag < 12 && global.dualBarettasAmmo < 12)
		{
			global.dualBarettasAmmo += global.dualBarettasMag;
			global.dualBarettasMag = 0;
		}
	}
	if (global.pickedWeapon[2])
	{
		if (global.shotgunMag >= 2 && global.shotgunAmmo < 2)
		{
			global.shotgunMag -= 2 - global.shotgunAmmo;
			global.shotgunAmmo += 2 - global.shotgunAmmo;
		}
	
		if (global.shotgunMag < 2 && global.shotgunAmmo < 2)
		{
			global.shotgunAmmo += global.shotgunMag;
			global.shotgunMag = 0;
		}
	}
}

//Animation
if (dirCursor > 90 && dirCursor < 270)
{
	image_xscale = -1;
}
else
{
	image_xscale = 1;
}

if (key_shift_hold)
{
	crouching = true;
}
else
{
	crouching = false;
}
