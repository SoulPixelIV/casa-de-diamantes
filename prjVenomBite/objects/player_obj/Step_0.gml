/// @description Movement

dt = (delta_time / 1000000) * globalSettings_obj.TARGET_FRAMERATE;
x += horspeed * dt;
y += verspeed * dt;

key_jump = keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(0, gp_face1);
key_jump_hold = keyboard_check(vk_space) || gamepad_button_check(0, gp_face1);
key_jump_release = keyboard_check_released(vk_space) || gamepad_button_check_released(0, gp_face1);
key_shift_hold = keyboard_check(vk_shift) || gamepad_button_check(0, gp_face2);

//Movement
if (movement)
{
	if (keyboard_check(ord("D")) && !keyboard_check(ord("A")))
	{
		if (!isZombie)
		{
			horspeed = movSpeed;
		}
		else
		{
			horspeed = movSpeedZombie;
		}
	}
	if (keyboard_check(ord("A")) && !keyboard_check(ord("D")))
	{
		if (!isZombie)
		{
			horspeed = -movSpeed;
		}
		else
		{
			horspeed = -movSpeedZombie;
		}
	}
}

if (horspeed > 0)
{
	horspeed -= frictionStrength * dt;
	if (horspeed < 0.3)
	{
		horspeed = 0;
	}
}
else
{
	horspeed += frictionStrength * dt;
	if (horspeed > -0.3)
	{
		horspeed = 0;
	}
}

//Gravity
if (verspeed < 14)
{
	verspeed -= gravityStrength * dt;
}

//Jump
if (movement)
{
	if (grounded && (key_jump) || fallJumpSafety > 0 && (key_jump))
	{
	    verspeed = -jumpStrength;
	}
   
	if (key_jump_release && fullJump == false)
	{
	    if (verspeed < 0)
	    {
	        verspeed = verspeed / 2;
	    }
	}
}

//Collision
//horspeed
if (!place_free(x + horspeed, y))
{
    while (place_free(x + sign(horspeed), y))
    {
        x += sign(horspeed * dt);
    }
    horspeed = 0;
} 
//verspeed
if (!place_free(x, y + verspeed))
{
    while (place_free(x, y + sign(verspeed)))
    {
        y += sign(verspeed * dt);
    }
    fullJump = false;
	fallJumpSafety = fallJumpSafetySave;
    verspeed = 0;   
}
else
{
	fallJumpSafety -= 1 * dt;
}

//###Weapon System###
dirCursor = point_direction(x, y, mouse_x, mouse_y);

if (global.pickedWeapon[0] || global.pickedWeapon[1] || global.pickedWeapon[2])
{
	if (!isZombie)
	{
		if (horspeed != 0)
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
		if (horspeed != 0)
		{
			sprite_index = zombieGirl_spr;
		}
		else
		{
			if (crouching)
			{
				sprite_index = zombieGirl_spr;
			}
			else
			{
				sprite_index = zombieGirl_spr;
			}
		}
	}
}
else
{
	if (!isZombie)
	{
		if (horspeed != 0)
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
	else
	{
		if (horspeed != 0)
		{
			sprite_index = zombieGirl_spr;
		}
		else
		{
			if (crouching)
			{
				sprite_index = zombieGirl_spr;
			}
			else
			{
				sprite_index = zombieGirl_spr;
			}
		}
	}
}

if (!isZombie)
{
	//Pistol
	if (mouse_check_button_pressed(mb_left) && global.pickedWeapon[0] && global.pistolCooldown <= 0)
	{
		//Check Ammo
		if (global.pistolAmmo > 0)
		{
			audio_play_sound(pistolShot_snd, 1, false);
		
			instance_create_layer(playerBulletLine_obj.x + 10, playerBulletLine_obj.y, "Instances", bulletPistol_obj);
			instance_create_layer(playerBulletLine_obj.x + 10, playerBulletLine_obj.y, "Instances", shotLight_obj);
		
			if (image_xscale == 1)
			{
				horspeed = -1;
			}
			else
			{
				horspeed = 1;
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
		
			instance_create_layer(playerBulletLine_obj.x + 10, playerBulletLine_obj.y, "Instances", bulletDualBarettas_obj);
			instance_create_layer(playerBulletLine_obj.x + 10, playerBulletLine_obj.y, "Instances", shotLight_obj);
		
			if (image_xscale == 1)
			{
				horspeed = -2;
			}
			else
			{
				horspeed = 2;
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
		
			instance_create_layer(playerBulletLine_obj.x + 10, playerBulletLine_obj.y, "Instances", bulletShotgun_obj);
			instance_create_layer(playerBulletLine_obj.x + 10, playerBulletLine_obj.y, "Instances", shotLight_obj);
		
			if (image_xscale == 1)
			{
				horspeed = -6;
			}
			else
			{
				horspeed = 6;
			}
			global.shotgunAmmo--;
			global.shotgunCooldown = global.shotgunCooldownSave;
		
			if (dirCursor > 225 && dirCursor < 320)
			{
				verspeed = -shotJumpStrength;
			}
		}
	}
}

//Shot Cooldown
if (global.pistolCooldown > 0 || global.dualBarettasCooldown > 0 || global.shotgunCooldown > 0)
{
	global.pistolCooldown -= 0.1 * dt;
	global.dualBarettasCooldown -= 0.1 * dt;
	global.shotgunCooldown -= 0.1 * dt;
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

//Weapon Switching
if (keyboard_check_pressed(ord("1")) && global.unlockedWeapon[0])
{
	pickWeapon_scr(0);
}
if (keyboard_check_pressed(ord("2")) && global.unlockedWeapon[1])
{
	pickWeapon_scr(1);
}
if (keyboard_check_pressed(ord("3")) && global.unlockedWeapon[2])
{
	pickWeapon_scr(2);
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

//Damage Cooldown
if (damageRecieved)
{
	damageCooldown -= 1;
}
if (damageCooldown < 0)
{
	damageRecieved = false;
}

//Death
if (hp < 0)
{
	camera_obj.noZoom = true;
	camera_obj.deathVignette = true;
	camera_obj.noHUD = true;
	camera_obj.drawInfectionText = true;
	movement = false;
	if (camera_obj.viewX > 160 || camera_obj.viewY > 90)
	{
		camera_obj.viewX -= 16;
		camera_obj.viewY -= 9;
	}
	
	//Revive
	if (keyboard_check_pressed(ord("R")))
	{
		camera_obj.noZoom = false;
		camera_obj.deathVignette = false;
		camera_obj.noHUD = false;
		camera_obj.drawInfectionText = false;
		movement = true;
		if (camera_obj.viewX < 640 || camera_obj.viewY < 360)
		{
			camera_obj.viewX += 16 * 2;
			camera_obj.viewY += 9 * 2;
		}
		syringes -= 1;
		syringesLost += 1;
		hp = 100 - 25 * syringesLost;
		maxhp -= 25;
		invincible = true;
		isZombie = true;
	}
}

//Zombie
if (isZombie)
{
	zombieTimer -= dt;
}
if (zombieTimer < 0)
{
	isZombie = false;
	invincible = false;
	zombieTimer = zombieTimerSave;
}

//Slowmotion
if (keyboard_check(vk_shift))
{
	global.timeScale = 0.2;
}
else
{
	global.timeScale = 1;
}
