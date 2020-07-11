if (live_call()) return live_result;
x += horspeed * global.dt;
y += verspeed * global.dt;

key_left = keyboard_check(ord("A")); //CONTROLLER AXIS L;
key_right = keyboard_check(ord("D")); // CONTROLLER AXIS R;
key_up = keyboard_check(ord("W"));
key_down = keyboard_check(ord("S"))
key_shoot = mouse_check_button_pressed(mb_left) || gamepad_button_check_pressed(0, gp_shoulderrb);
key_jump = keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(0, gp_face1);
key_jump_hold = keyboard_check(vk_space) || gamepad_button_check(0, gp_face1);
key_jump_release = keyboard_check_released(vk_space) || gamepad_button_check_released(0, gp_face1);
key_shift_hold = keyboard_check(vk_shift) || gamepad_button_check(0, gp_shoulderl);
key_shift = keyboard_check_pressed(vk_shift) || gamepad_button_check_pressed(0, gp_shoulderl);
key_control = keyboard_check_pressed(vk_control) || gamepad_button_check_pressed(0, gp_face2);

//Movement

//Cap Speed
if (horspeed > horspeedMax)
{
	horspeed = horspeedMax;
}
if (horspeed < -horspeedMax)
{
	horspeed = -horspeedMax;
}
if (verspeed > verspeedMax)
{
	verspeed = verspeedMax;
}
if (verspeed < -verspeedMax)
{
	verspeed = -verspeedMax;
}

if (movement && !wallJumping && !isDashing)
{
	if (!huggingWall)
	{
		if (key_right && !key_left)
		{
			if (!isZombie)
			{
				if (horspeed < movSpeed)
				{
					horspeed = movSpeed;
				}
			} 
			else
			{
				horspeed = movSpeedZombie;
			}
			if (!audio_is_playing(walk1_snd) && !audio_is_playing(walk2_snd) && grounded)
			{
				var walksnd = audio_play_sound(choose(walk1_snd, walk2_snd), 1, false);
				audio_sound_pitch(walksnd, random_range(0.9, 1.1));
			}
		}
		if (key_left && !key_right)
		{
			if (!isZombie)
			{
				if (horspeed > -movSpeed)
				{
					horspeed = -movSpeed;
				}
			}
			else
			{
				horspeed = -movSpeedZombie;
			}
			if (!audio_is_playing(walk1_snd) && !audio_is_playing(walk2_snd) && grounded)
			{
				audio_play_sound(walk1_snd, 1, false);
			}
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
if (verspeed < 2 && !onLadder)
{
	verspeed -= gravityStrength * global.dt;
}

if (movement && !isZombie)
{
	//Jump
	if (grounded && key_jump || fallJumpSafety > 0 && key_jump)
	{
		jump_scr();
	}
	//Dash
	if (key_shift && !isDashing && dashDelay < 0)
	{
		if (horspeed > 0.3 || horspeed < -0.3)
		{
		    dash_scr();
		}
	}
	if (dashDelay > 0)
	{
		dashDelay -= global.dt;
	}
	
	if (!grounded && !onLadder && !huggingWall)
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
	if (key_jump_release && fullJump == false && !isDashing && !flip)
	{
	    if (verspeed < 0)
	    {
	        verspeed /= 2;
			shortJump = true;
	    }
	}
}
if (isDashing && !onLadder)
{
	with (gameManager_obj)
	{
		if (global.currentWeapon == pickedWeapon.unarmed)
		{
			with (player_obj)
			{
				sprite_index = playerDashUnequipped_spr;
				if (image_index > image_number - 1 && sprite_index == playerDashUnequipped_spr)
				{
					image_index = image_number - 1;
				}
			}
		}
		else
		{
			with (player_obj)
			{
				sprite_index = playerDash_spr;
				if (image_index > image_number - 1 && sprite_index == playerDash_spr)
				{
					image_index = image_number - 1;
				}
			}
		}
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
if (movement && !isZombie)
{
	if (huggingWall && key_jump)
	{
		if (wallJumps > 0)
		{
			wallJumping = true;
			verspeed = -jumpStrength / 1.12;
		
			if (image_xscale == 1 && key_right)
			{
				horspeed += jumpStrength / 1.15;
			}
			else if (image_xscale == 1 && key_left)
			{
				horspeed += jumpStrength / 1.7;
			}
			else if (image_xscale == -1 && key_left)
			{
				horspeed -= jumpStrength / 1.15;
			}
			else if (image_xscale == -1 && key_right)
			{
				horspeed -= jumpStrength / 1.7;
			}
			else if (image_xscale == 1 && !key_right && !key_left)
			{
				horspeed += jumpStrength / 1.7;
			}
			else if (image_xscale == -1 && !key_right && !key_left)
			{
				horspeed -= jumpStrength / 1.7;
			}
			wallJumps--;
			wallJumpingInAir = true;
			huggingWall = false;
			setWallDir = false;
			stoppedDashing = true;
		}
		else
		{
			huggingWall = false;
			setWallDir = false;
		}
	}
	if (huggingWall && key_down)
	{
		huggingWall = false;
		setWallDir = false;
	}
	if (huggingWall)
	{
		slowmo = false;
	}
}

if (wallJumping)
{
	wallJumpTimer -= global.dt;
}
if (wallJumpTimer < 0)
{
	wallJumpTimer = wallJumpTimerSave;
	wallJumping = false;
}

//Flip
with (gameManager_obj)
{
	if (global.currentWeapon != pickedWeapon.unarmed)
	{
		with (player_obj)
		{
			if (key_jump && !huggingWall && !wallJumping && !grounded && !isDashing && !flipUsed && jumpType == 1 && fallJumpSafety < 0 && wallJumps > 0)
			{
				sprite_index = playerFlip_spr;
				invincible = true;
				flip = true;
				flipUsed = true;
				jump_scr();
			}
		}
	}
}
		
if (grounded || isDashing)
{
	flip = false;
	flipUsed = false;
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
if (colliding)
{
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
			if (!grounded && verspeed > 0)
			{
				huggingWall = true;
			}
		}
	}
	if ((place_free(x + 1, y) && place_free(x - 1, y)) || grounded)
	{
		huggingWall = false;
		setWallDir = false;
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
		createdParticles = false;
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
}

//Create Dust Particles
if (grounded && !createdParticles && !isDashing)
{
	repeat(5)
	{
		instance_create_layer(player_obj.x, player_obj.y + 26, "ForegroundObjects", dustParticle_obj);
	}
	createdParticles = true;
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

//Ladder
if (place_meeting(x, y, ladder_obj) && (key_up || key_down))
{
	onLadder = true;
}

if (!place_meeting(x, y, ladder_obj))
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
	movSpeed = movSpeedSave / 2
}
else
{
	movSpeed = movSpeedSave;
}
	
if (huggingWall && !onLadder && !grounded)
{
	verspeed = 0.2;
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
			if (!isDashing && !huggingWall)
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
			if (!isDashing && !huggingWall)
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
							sprite_index = playerJumpSpinUnequipped_spr;
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

if (huggingWall && !grounded)
{
	sprite_index = playerWall_spr;
	if (horspeed <= 0)
	{
		walljumpDustTimer -= global.dt;
		if (walljumpDustTimer < 0)
		{
			instance_create_layer(player_obj.x - 6, player_obj.y + 22, "ForegroundObjects", dustParticle_obj);
			instance_create_layer(player_obj.x - 6, player_obj.y - 16, "BackgroundObjects", dustParticle_obj);
			walljumpDustTimer = walljumpDustTimerSave;
		}
	}
	else
	{
		walljumpDustTimer -= global.dt;
		if (walljumpDustTimer < 0)
		{
			instance_create_layer(player_obj.x + 6, player_obj.y + 22, "ForegroundObjects", dustParticle_obj);
			instance_create_layer(player_obj.x + 6, player_obj.y - 16, "BackgroundObjects", dustParticle_obj);
			walljumpDustTimer = walljumpDustTimerSave;
		}
	}
	if (!setWallDir)
	{
		if (!place_free(x - 1, y))
		{
			image_xscale = 1;
		}
		if (!place_free(x + 1, y))
		{
			image_xscale = -1;
		}
	}
	setWallDir = true;
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
				if (key_shoot && !reloading)
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
				if (key_shoot && !reloading)
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
				if (key_shoot && !reloading)
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
	if (global.currentWeapon == pickedWeapon.pistol && global.pistolAmmo < 8 || global.currentWeapon == pickedWeapon.dualBarettas && global.pistolAmmo < 8
	|| global.currentWeapon == pickedWeapon.shotgun && global.shotgunAmmo < 3)
	{
		reloading = true;
	}
}

if (reloading)
{
	if (global.currentWeapon == pickedWeapon.pistol)
	{
		global.pistolReload -= global.dt;
	}
	if (global.currentWeapon == pickedWeapon.dualBarettas)
	{
		global.dualBarettasReload -= global.dt;
	}
	if (global.currentWeapon == pickedWeapon.shotgun)
	{
		global.shotgunReload -= global.dt;
	}
}

if (global.pistolReload < 0 || global.dualBarettasReload < 0 || global.shotgunReload < 0)
{
	reload_scr();
}

//Weapon Switching
if (!isZombie && !reloading)
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
	case zombieGirl_spr:
		animationSpeed = 0.25;
		break;
	case playerFlip_spr:
		animationSpeed = 1.75;
		break;
	case playerJumpSpin_spr:
		animationSpeed = 1.2;
		break;
	case playerJumpSpinUnequipped_spr:
		animationSpeed = 1.2;
		break;
	case playerEquipped_spr:
		animationSpeed = 0.5;
		break;
	case playerWalkingEquipped_spr:
		animationSpeed = 0.8;
		break;
	case playerWalking_spr:
		animationSpeed = 0.8;
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
	if (!wallJumpingInAir && !isDashing && !huggingWall && !setWallDir)
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
	if (damageCooldown < damageCooldownSave / 4)
	{
		damageFlickerTimer -= global.dt * 2;
	}
	else
	{
		damageFlickerTimer -= global.dt;
	}
}
if (damageFlickerTimer < 0)
{
	if (image_alpha > 0)
	{
		image_alpha = 0;
	}
	else
	{
		image_alpha = 1;
	}
	damageFlickerTimer = damageFlickerTimerSave;
}
if (damageCooldown < 0)
{
	damageRecieved = false;
	image_alpha = 1;
}

if (hp < 0 || infection > 100)
{
	//Death
	if (!deathActivated)
	{
		death_scr();
		deathActivated = true;
	}
	
	//Revive
	if (keyboard_check_pressed(ord("R")) && syringes > 0)
	{
		revive_scr();
	}
	//Full Death
	if (keyboard_check_pressed(ord("Q")))
	{
		fullDeath_scr();
	}
}

//Zombie
if (isZombie && !plagueTransformation)
{
	zombieTimer -= global.dt / 1.5;
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
	infection += global.dt / 69;
}

//Slowmotion
if (!deathSlowmo)
{
	if (!player_obj.grounded && jumpType == 2 && !huggingWall && !wallJumping && wallJumps > 0)
	{
		if (key_jump_hold)
		{
			if (slowmoTimer > 0)
			{
				slowmo = true;
				slowmoTimer -= global.dt * 3;
			}
		}
		else
		{
			slowmo = false;
		}
	}
	
	if (slowmo)
	{
		global.timeScale = 0.2;
	}
	else
	{
		global.timeScale = 1;
	}
	
	if (slowmoTimer < 30)
	{
		slowmo = false
		global.timeScale = 1;
	}
	if (enemySlowmo)
	{
		global.timeScale = 0.05;
		enemySlowMotionTimer -= global.dt;
	}
	if (enemySlowMotionTimer < 0)
	{	
		camera_obj.follow = player_obj;
		camera_obj.vignetteFlash = false;
		enemySlowmo = false;
		global.timeScale = 1;
		enemySlowMotionTimer = enemySlowMotionTimerSave;
	}
}

//Camera Settings
if (!place_meeting(x, y, cameraViewIn_obj) && !place_meeting(x, y, cameraViewOut_obj))
{
	camera_obj.currentCameraState = cameraState.normal;
}

//Death Slowmo
if (deathSlowmo)
{
	sprite_index = playerDeath_spr;
	global.timeScale += global.dt / 200;
	
	if (global.timeScale > 0.95)
	{
		global.timeScale = 1;
		deathSlowmo = false;
	}
}
	
