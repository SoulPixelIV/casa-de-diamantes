/// @description Movement

dt = (delta_time / 1000000) * globalSettings_obj.TARGET_FRAMERATE;

x += horspeed * dt;
y += verspeed * dt;

key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_shoot = mouse_check_button_pressed(mb_left) || keyboard_check_pressed(vk_control);
key_jump = keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(0, gp_face1);
key_jump_hold = keyboard_check(vk_space) || gamepad_button_check(0, gp_face1);
key_jump_release = keyboard_check_released(vk_space) || gamepad_button_check_released(0, gp_face1);
key_shift_hold = keyboard_check(vk_shift) || gamepad_button_check(0, gp_face2);

//Movement
if (movement && !wallJumping)
{
	if (key_right && !key_left)
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
	if (key_left && !key_right)
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

if (!place_meeting(x, y, colliderSideway_obj))
{
	frictionActive = true;
}

if (frictionActive)
{
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
}
else
{
	if (horspeed > 0)
	{
		horspeed -= dt;
		if (horspeed < 0.3)
		{
			horspeed = 0;
		}
	}
	else
	{
		horspeed += dt;
		if (horspeed > -0.3)
		{
			horspeed = 0;
		}
	}
}

//Gravity
if (verspeed < 14 && !onLadder)
{
	verspeed -= gravityStrength * dt;
}

//Jump
if (movement && !isZombie)
{
	if (grounded && key_jump || fallJumpSafety > 0 && (key_jump))
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

//Walljump
if (movement && !isZombie && wallJumps > 0)
{
	if (huggingWall && key_jump && !grounded)
	{
		wallJumping = true;
		verspeed = -jumpStrength * 1.1;
		
		if (key_right)
		{
			horspeed -= jumpStrength;
		}
		if (key_left)
		{
			horspeed += jumpStrength;
		}
		wallJumps--;
		wallJumpingInAir = true;
		/*
		if (image_xscale == -1)
		{
			image_xscale = 1;
		}
		else
		{
			image_xscale = -1;
		}
		*/
	}
}
if (wallJumping)
{
	wallJumpTimer -= dt;
}
if (wallJumpTimer < 0)
{
	wallJumpTimer = 12;
	wallJumping = false;
}

//Flip
if (!grounded && !isZombie && slowmo && !spin && !unarmed && horspeed != 0)
{
	sprite_index = playerFlip_spr;
	flip = true;
}
if (grounded)
{
	flip = false;
}

//Jump Spin
if (!grounded && !isZombie && !flip && !unarmed && horspeed == 0)
{
	sprite_index = playerJumpSpin_spr;
	spin = true;
}
if (grounded)
{
	spin = false;
}
/*
if (spin)
{
	if (spinWeaponDir == 0)
	{
		spinWeaponPos += dt * 1.7;
	}
	if (spinWeaponDir == 1)
	{
		spinWeaponPos -= dt * 1.7;
	}
	if (spinWeaponPos > 5)
	{
		spinWeaponDir = 1;
	}
	if (spinWeaponPos < 0)
	{
		spinWeaponDir = 0;
	}
}
else
{
	spinWeaponPos = 0;
	spinWeaponDir = 0;
}
*/
//Collision
//horspeed
if (!place_free(x + horspeed, y))
{
    while (place_free(x + sign(horspeed), y))
    {
        x += sign(horspeed) * dt;
    }
	if (!wallJumping)
	{
		horspeed = 0;
	}
	huggingWall = true;
} 
else
{
	huggingWall = false;
}
//verspeed
if (!place_free(x, y + verspeed))
{
    while (place_free(x, y + sign(verspeed)))
    {
        y += sign(verspeed) * dt;
    }
    resetJump_scr();
}
else
{
	fallJumpSafety -= dt;
	grounded = false;
}

//###OutsideSolid###
if (place_free(x, y))
{
    savePosX = x;
    savePosY = y;
}
else
{
    x = savePosX;
    y = savePosY;
    verSpeed = 0;
}

//Ladder
if (place_meeting(x, y, ladder_obj))
{
	onLadder = true;
}
else
{
	onLadder = false;
}

if (onLadder)
{
	if (keyboard_check(ord("W")))
	{
		verspeed = -2;
	}
	else if (keyboard_check(ord("S")))
	{
		verspeed = 2;
	}
	else
	{
		verspeed = 0;
	}
}

//###Weapon System###
dirCursor = point_direction(x, y, mouse_x, mouse_y);
if (keyboard_check(vk_left))
{
	dirCursor = 180;
}
if (keyboard_check(vk_right))
{
	dirCursor = 0;
}
if (keyboard_check(vk_up))
{
	dirCursor = 90;
}
if (keyboard_check(vk_down))
{
	dirCursor = 270;
}

if (global.pickedWeapon[0] || global.pickedWeapon[1] || global.pickedWeapon[2])
{
	if (grounded)
	{
		if (!isZombie && !onLadder)
		{
			if (horspeed != 0)
			{
				sprite_index = playerWalkingEquipped_spr;
			}
			else
			{
				sprite_index = playerEquipped_spr;
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
				sprite_index = zombieGirl_spr;
			}
		}
	}
}
else
{
	if (grounded)
	{
		if (!isZombie && !onLadder)
		{
			if (horspeed != 0)
			{
				sprite_index = playerWalking_spr;
			}
			else
			{
				sprite_index = player_spr;
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
}
if (onLadder && !isZombie)
{
	if (verspeed == 0)
	{
		if (global.pickedWeapon[0] || global.pickedWeapon[1] || global.pickedWeapon[2])
		{
			sprite_index = playerEquipped_spr;
		}
		else
		{
			sprite_index = player_spr;
		}
	}
	else
	{
		sprite_index = playerClimbing_spr;
	}
}

if (!isZombie)
{
	//Pistol
	if (key_shoot && global.pickedWeapon[0] && global.pistolCooldown <= 0)
	{
		if (!onLadder || onLadder && verspeed == 0)
		{
			//Check Ammo
			if (global.pistolAmmo > 0)
			{
				audio_play_sound(pistolShot_snd, 1, false);
		
				var shotLightx = x + lengthdir_x(24, dirCursor);
				var shotLighty = y - 8 + lengthdir_y(24, dirCursor);
				instance_create_layer(playerBulletLine_obj.x, playerBulletLine_obj.y, "Instances", bulletPistol_obj);
				instance_create_layer(shotLightx, shotLighty, "ForegroundObjects", shotLightPistol_obj);
				instance_create_layer(shotLightx, shotLighty, "ForegroundObjects", smokecloud_obj);
		
				if (!huggingWall)
				{
					if (image_xscale == 1)
					{
						horspeed = -1;
					}
					else
					{
						horspeed = 1;
					}
				}
				global.pistolAmmo--;
				global.pistolCooldown = global.pistolCooldownSave;
				shotZoom = true;
			}
		}
	}

	//Dual Barettas
	if (key_shoot && global.pickedWeapon[1] && global.dualBarettasCooldown <= 0)
	{
		if (!onLadder || onLadder && verspeed == 0)
		{
			//Check Ammo
			if (global.dualBarettasAmmo > 0)
			{
				audio_play_sound(dualBarettasShot_snd, 1, false);
		
				var shotLightx = x + lengthdir_x(24, dirCursor);
				var shotLighty = y - 8 + lengthdir_y(24, dirCursor);
				instance_create_layer(playerBulletLine_obj.x + 10, playerBulletLine_obj.y, "Instances", bulletDualBarettas_obj);
				instance_create_layer(shotLightx, shotLighty, "ForegroundObjects", shotLightDualBarettas_obj);
				instance_create_layer(shotLightx, shotLighty, "ForegroundObjects", smokecloud_obj);
		
				if (!huggingWall)
				{
					if (image_xscale == 1)
					{
						horspeed = -2;
					}
					else
					{
						horspeed = 2;
					}
				}
				global.dualBarettasAmmo--;
				global.dualBarettasCooldown = global.dualBarettasCooldownSave;
				shotZoom = true;
			}
		}
	}

	//Shotgun
	if (key_shoot && global.pickedWeapon[2] && global.shotgunCooldown <= 0)
	{
		if (!onLadder || onLadder && verspeed == 0)
		{
			//Check Ammo
			if (global.shotgunAmmo > 0)
			{
				audio_play_sound(shotgunShot_snd, 1, false);
		
		
				var shotLightx = x + lengthdir_x(24, dirCursor);
				var shotLighty = y - 8 + lengthdir_y(24, dirCursor);
				instance_create_layer(playerBulletLine_obj.x + 10, playerBulletLine_obj.y, "Instances", bulletShotgun_obj);
				instance_create_layer(shotLightx, shotLighty, "ForegroundObjects", shotLightShotgun_obj);
				instance_create_layer(shotLightx, shotLighty, "ForegroundObjects", smokecloud_obj);
		
				if (!huggingWall)
				{
					if (dirCursor > 310 || dirCursor < 50)
					{
						horspeed -= 6;
					}
					else if (dirCursor > 130 && dirCursor < 230)
					{
						horspeed += 6;
					}
					else if (image_xscale == 1)
					{
						horspeed -= 3;
					}
					else
					{
						horspeed += 3;
					}
				}
				global.shotgunAmmo--;
				global.shotgunCooldown = global.shotgunCooldownSave;
				shotZoom = true;
		
				if (dirCursor > 225 && dirCursor < 320)
				{
					verspeed = -shotJumpStrength;
				}
			}
		}
	}
}

//ShotZoom
if (shotZoom)
{
	shotZoomTimer -= dt;
}
if (shotZoomTimer < 0)
{
	shotZoom = false;
	shotZoomTimer = shotZoomTimerSave;
}

//Shot Cooldown
if (global.pistolCooldown > 0 || global.dualBarettasCooldown > 0 || global.shotgunCooldown > 0)
{
	global.pistolCooldown -= 0.1 * dt;
	global.dualBarettasCooldown -= 0.1 * dt;
	global.shotgunCooldown -= 0.1 * dt;
}

//Reload
if (keyboard_check_pressed(ord("R")) && !isZombie)
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
if (!isZombie)
{
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
}


//Animation
if (grounded || !flip)
{
	if (!wallJumpingInAir)
	{
		if (dirCursor > 90 && dirCursor < 270)
		{
			image_xscale = -1;
		}
		else
		{
			image_xscale = 1;
		}
	}
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
	damageCooldown -= dt;
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
		audio_play_sound(infectedVoice_snd, 1, false);
	}
}

//Zombie
if (isZombie && !plagueTransformation)
{
	zombieTimer -= dt;
}
if (zombieTimer < 0)
{
	isZombie = false;
	invincible = false;
	zombieTimer = zombieTimerSave;
}
if (isZombie && keyboard_check_pressed(ord("F")) && !plagueTransformation)
{
	isZombie = false;
	invincible = false;
	zombieTimer = zombieTimerSave;
}

//Plague
if (plagueTransformation)
{
	infection += dt / 15;
}

//Slowmotion
if (keyboard_check(vk_shift))
{
	if (slowmoTimer > 0)
	{
		slowmo = true;
		slowmoTimer -= dt * 3;
		global.timeScale = 0.2;
		image_speed = 0.2;
	}
}
else
{
	slowmo = false;
	if (slowmoTimer < slowmoTimerSave)
	{
		slowmoTimer += dt * 3.5;
	}
	global.timeScale = 1;
	image_speed = 1;
}
if (slowmoTimer < 30)
{
	slowmo = false
	global.timeScale = 1;
	image_speed = 1;
}
if (enemySlowmo)
{
	enemySlowmoTimer -= dt;
	global.timeScale = 0.05;
}
if (enemySlowmoTimer < 0)
{
	enemySlowmoTimer = enemySlowmoTimerSave;
	enemySlowmo = false;
	global.timeScale = 1;
}
