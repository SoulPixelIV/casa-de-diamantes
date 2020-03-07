/// @description Movement
if (live_call()) return live_result;
x += horspeed * global.dt;
y += verspeed * global.dt;

key_left = keyboard_check(ord("A")) //CONTROLLER AXIS L;
key_right = keyboard_check(ord("D")) // CONTROLLER AXIS R;
key_shoot = mouse_check_button_pressed(mb_left) || gamepad_button_check_pressed(0, gp_shoulderrb);
key_jump = keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(0, gp_face1);
key_jump_hold = keyboard_check(vk_space) || gamepad_button_check(0, gp_face1);
key_jump_release = keyboard_check_released(vk_space) || gamepad_button_check_released(0, gp_face1);
key_shift_hold = keyboard_check(vk_shift) || gamepad_button_check(0, gp_shoulderl);
key_control = keyboard_check_pressed(vk_control) || gamepad_button_check(0, gp_face2);

//Movement
if (movement && !wallJumping && !isDashing)
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

//Friction
if (!place_meeting(x, y, colliderSideway_obj) && !huggingWall)
{
	frictionActive = true;
}
if (frictionActive)
{
	frictionActive_scr(id, true);
}
else
{
	frictionActive_scr(id, false);
}

//Gravity
if (verspeed < 3.5 && !onLadder)
{
	verspeed -= gravityStrength * global.dt;
}

if (movement && !isZombie)
{
	//Jump
	if (grounded && key_jump || fallJumpSafety > 0 && key_jump && horspeed == 0)
	{
		jump_scr();
	}
	//Dash
	if (key_control && !isDashing)
	{
		if (horspeed > 0.3 || horspeed < -0.3)
		{
		    dash_scr();
		}
	}
	if (isDashing && !grounded)
	{
		invincible = true;
	}
	//Cancel Dash
	if (stoppedDashing)
	{
		dashTimer -= global.dt;
	}
	if (dashTimer < 0 || onLadder)
	{
		isDashing = false;
		stoppedDashing = false;
		dashTimer = dashTimerSave;
	}
	//Short Jump
	if (key_jump_release && fullJump == false && !isDashing)
	{
	    if (verspeed < 0)
	    {
	        verspeed /= 2;
	    }
	}
}
if (isDashing && !onLadder)
{
	sprite_index = playerDash_spr;
	if (image_index > image_number - 1 && sprite_index == playerDash_spr)
	{
		image_index = image_number - 1;
	}
}

if (jumping && !onLadder && !isDashing && !spin)
{
	if (image_index > image_number - 1)
	{
		image_index = image_number - 1;
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
			horspeed -= jumpStrength / 1.15;
		}
		if (key_left)
		{
			horspeed += jumpStrength / 1.15;
		}
		wallJumps--;
		wallJumpingInAir = true;
		//Wallturning ###TODO###
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
	wallJumpTimer -= global.dt;
}
if (wallJumpTimer < 0)
{
	wallJumpTimer = 12;
	wallJumping = false;
}

//Flip
with (gameManager_obj)
{
	if (global.currentWeapon != pickedWeapon.unarmed)
	{
		with (player_obj)
		{
			if (key_jump && (verspeed == 0 || flipAvail) && !isDashing)
			{
				sprite_index = playerFlip_spr;
				flip = true;
				flipAvail = false;
				flipUsed = true;
				jump_scr();
			}
		}
	}
}
		
if (grounded || isDashing)
{
	flip = false;
	flipAvail = false;
	flipUsed = false;
	flipTiming = flipTimingSave;
}

if (verspeed > 0 && !grounded && !flipUsed && !isDashing)
{
	flipAvail = true;
	flipTiming -= global.dt;
}
if (flipTiming < 0)
{
	flipAvail = false;
}

//Jump Spin
if (!grounded && !isZombie && !flip && !isDashing && !unarmed && !groundCollisionTimerOn)
{
	if (horspeed < movSpeed - 0.3 || horspeed > -movSpeed + 0.3)
	{
		sprite_index = playerJumpSpin_spr;
		spin = true;
	}
}
if (grounded)
{
	spin = false;
}

//Collision
//horspeed
if (!place_free(x + (horspeed * global.dt), y))
{
	if (sign(horspeed) != 0)
	{
		while (place_free(x + sign(horspeed) / 100, y))
		{
			x += sign(horspeed) / 100;
		}
		if (!wallJumping)
		{
			horspeed = 0;
		}
		huggingWall = true;
	}
} 
else
{
	huggingWall = false;
}
//verspeed
if (!place_free(x, y + (verspeed * global.dt)))
{
	if (sign(verspeed) != 0)
	{
		while (place_free(x, y + sign(verspeed) / 100))
		{
			y += sign(verspeed) / 100;
		}
		resetJump_scr();
	}
}
else
{
	fallJumpSafety -= global.dt;
	grounded = false;
}

if (groundCollisionTimerOn)
{
	groundCollisionTimer -= global.dt;
}
if (groundCollisionTimer < 0)
{
	groundCollisionTimerOn = false;
	groundCollisionTimer = groundCollisionTimerSave;
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
		verspeed = -0.75;
	}
	else if (keyboard_check(ord("S")))
	{
		verspeed = 0.75;
	}
	else
	{
		verspeed = 0;
	}
}

//Weapon System ###TODO###
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

with (gameManager_obj)
{
	if (global.currentWeapon != pickedWeapon.unarmed)
	{
		with (player_obj)
		{
			if (!isDashing)
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
		}
	}
	else
	{
		with (player_obj)
		{
			if (!isDashing)
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
				else
				{
					if (jumping)
					{
						if (verspeed < 0)
						{
							sprite_index = playerJump_spr;
						}
						else
						{
							sprite_index = playerFalling_spr;
						}
					}
				}
			}
		}
	}
}

if (onLadder && !isZombie && !isDashing)
{
	if (verspeed == 0)
	{
		if (global.currentWeapon != unarmed)
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
	with (gameManager_obj)
	{
		if (global.currentWeapon == pickedWeapon.pistol && global.pistolCooldown <= 0)
		{
			with (player_obj)
			{
				if (key_shoot)
				{
					if (!onLadder || onLadder && verspeed == 0)
					{
						shooting_scr("pistol");
					}
				}
			}
		}
	}

	//Dual Barettas
	with (gameManager_obj)
	{
		if (global.currentWeapon == pickedWeapon.dualBarettas && global.dualBarettasCooldown <= 0)
		{
			with (player_obj)
			{
				if (key_shoot)
				{
					if (!onLadder || onLadder && verspeed == 0)
					{
						shooting_scr("dualBarettas");
					}
				}
			}
		}
	}

	//Shotgun
	with (gameManager_obj)
	{
		if (global.currentWeapon == pickedWeapon.shotgun && global.shotgunCooldown <= 0)
		{
			with (player_obj)
			{
				if (key_shoot)
				{
					if (!onLadder || onLadder && verspeed == 0)
					{
						shooting_scr("shotgun");
					}
				}
			}
		}
	}
}

//ShotZoom
if (shotZoom)
{
	shotZoomTimer -= global.dt;
}
if (shotZoomTimer < 0)
{
	shotZoom = false;
	shotZoomTimer = shotZoomTimerSave;
}

//Shot Cooldown
if (global.pistolCooldown > 0 || global.dualBarettasCooldown > 0 || global.shotgunCooldown > 0)
{
	global.pistolCooldown -= 0.1 * global.dt;
	global.dualBarettasCooldown -= 0.1 * global.dt;
	global.shotgunCooldown -= 0.1 * global.dt;
}

//Reload
if (keyboard_check_pressed(ord("R")) && !isZombie)
{
	reload_scr();
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
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

switch (sprite_index)
{
	case player_spr:
		animationSpeed = 0.5;
		break;
	case playerFlip_spr:
		animationSpeed = 1.75;
		break;
	case playerJumpSpin_spr:
		animationSpeed = 1.2;
		break;
	case playerEquipped_spr:
		animationSpeed = 0.5;
		break;
	case playerWalkingEquipped_spr:
		animationSpeed = 1;
		break;
	case playerWalking_spr:
		animationSpeed = 1;
		break;
	case playerJump_spr:
		animationSpeed = 0.75;
		break;
	case playerFalling_spr:
		animationSpeed = 0.75;
		break;
}

if (grounded || !flip)
{
	if (!wallJumpingInAir && !isDashing)
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
	damageCooldown -= global.dt;
}
if (damageCooldown < 0)
{
	damageRecieved = false;
}

if (hp < 0)
{
	//Death
	death_scr();
	
	//Revive
	if (keyboard_check_pressed(ord("R")))
	{
		revive_scr();
	}
}

//Zombie
if (isZombie && !plagueTransformation)
{
	zombieTimer -= global.dt;
}
if (zombieTimer < 0)
{
	isZombie = false;
	if (!isDashing && !grounded)
	{
		invincible = false;
	}
	zombieTimer = zombieTimerSave;
}
if (isZombie && keyboard_check_pressed(ord("F")) && !plagueTransformation)
{
	isZombie = false;
	if (!isDashing && !grounded)
	{
		invincible = false;
	}
	zombieTimer = zombieTimerSave;
}

//Plague
if (plagueTransformation)
{
	infection += global.dt / 15;
}

//Slowmotion
if (keyboard_check(vk_shift))
{
	if (slowmoTimer > 0)
	{
		slowmo = true;
		slowmoTimer -= global.dt * 3;
		global.timeScale = 0.2;
	}
}
else
{
	slowmo = false;
	if (slowmoTimer < slowmoTimerSave)
	{
		slowmoTimer += global.dt * 3.5;
	}
	global.timeScale = 1;
}
if (slowmoTimer < 30)
{
	slowmo = false
	global.timeScale = 1;
}
if (enemySlowmo)
{
	enemySlowmoTimer -= global.dt * 1.6;
	global.timeScale = 0.025;
}
if (enemySlowmoTimer < 0)
{
	enemySlowmoTimer = enemySlowmoTimerSave;
	enemySlowmo = false;
	global.timeScale = 1;
}
