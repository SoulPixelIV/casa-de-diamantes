//if (live_call()) return live_result;
x += horspeed * global.dt;
y += verspeed * global.dt;

//Check for Controller or Keyboard
if (gamepad_button_check_pressed(4, gp_face1) || gamepad_button_check_pressed(0, gp_face1))
{
	inputMethod = 1;
}
else if (keyboard_check_pressed(vk_anykey))
{
	inputMethod = 0;
}

key_left = keyboard_check(ord("A")) || gamepad_axis_value(4, gp_axislh) < -0.4 || gamepad_axis_value(0, gp_axislh) < -0.4; //CONTROLLER AXIS L;
key_right = keyboard_check(ord("D")) || gamepad_axis_value(4, gp_axislh) > 0.4 || gamepad_axis_value(0, gp_axislh) > 0.4; // CONTROLLER AXIS R;
key_left_release = keyboard_check_released(ord("A")) || (gamepad_axis_value(4, gp_axislh) < 0.4 && gamepad_axis_value(4, gp_axislh) > -0.4) || (gamepad_axis_value(0, gp_axislh) < 0.4 && gamepad_axis_value(0, gp_axislh) > -0.4);
key_right_release = keyboard_check_released(ord("D")) || (gamepad_axis_value(4, gp_axislh) < 0.4 && gamepad_axis_value(4, gp_axislh) > -0.4) || (gamepad_axis_value(0, gp_axislh) < 0.4 && gamepad_axis_value(0, gp_axislh) > -0.4);

key_up = keyboard_check(ord("W")) || gamepad_button_check(4, gp_padu) || gamepad_axis_value(4, gp_axislv) < -0.4 || gamepad_button_check(0, gp_padu) || gamepad_axis_value(0, gp_axislv) < -0.4;
key_down = keyboard_check(ord("S")) || gamepad_button_check(4, gp_padd) || gamepad_axis_value(4, gp_axislv) > 0.4 || gamepad_button_check(0, gp_padd) || gamepad_axis_value(0, gp_axislv) > 0.4;
key_up_pressed = keyboard_check_pressed(ord("W")) || gamepad_button_check_pressed(4, gp_padu) || gamepad_button_check_pressed(0, gp_padu);
key_down_pressed = keyboard_check_pressed(ord("S")) || gamepad_button_check_pressed(4, gp_padd) || gamepad_button_check_pressed(0, gp_padd);

key_shoot = mouse_check_button_pressed(mb_left) || gamepad_button_check_pressed(4, gp_shoulderrb) || gamepad_button_check_pressed(0, gp_shoulderrb);
key_reload = mouse_check_button_pressed(mb_right) || gamepad_button_check_pressed(4, gp_face2) || gamepad_button_check_pressed(0, gp_face2);
key_jump = keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(4, gp_face1) || gamepad_button_check_pressed(0, gp_face1);
key_jump_hold = keyboard_check(vk_space) || gamepad_button_check(4, gp_face1) || gamepad_button_check(0, gp_face1);
key_jump_release = keyboard_check_released(vk_space) || gamepad_button_check_released(4, gp_face1) || gamepad_button_check_released(0, gp_face1);
key_shift_hold = keyboard_check(vk_shift) || gamepad_button_check(4, gp_shoulderlb) || gamepad_button_check(0, gp_shoulderlb);
key_shift = keyboard_check_pressed(vk_shift) || gamepad_button_check_pressed(4, gp_shoulderlb) || gamepad_button_check_pressed(0, gp_shoulderlb);
key_control = keyboard_check_pressed(vk_control) || gamepad_button_check_pressed(4, gp_face2) || gamepad_button_check_pressed(0, gp_face2);

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
		if (key_right)
		{
			if (horspeed < movSpeed)
			{
				horspeed += global.dt / 10;
			}
			if (horspeed > movSpeed - 0.2 && horspeed < movSpeed + 0.2)
			{
				horspeed = movSpeed
			}
			if (!audio_is_playing(walk1_snd) && !audio_is_playing(walk2_snd) && grounded)
			{
				var walksnd = audio_play_sound(choose(walk1_snd, walk2_snd), 1, false);
				audio_sound_pitch(walksnd, random_range(0.9, 1.1));
			}
		}
		if (key_left)
		{
			if (horspeed < -movSpeed + 0.2 && horspeed > -movSpeed - 0.2)
			{
				horspeed = -movSpeed
			}
			if (horspeed > -movSpeed)
			{
				horspeed -= global.dt / 10;
			}

			if (!audio_is_playing(walk1_snd) && !audio_is_playing(walk2_snd) && grounded)
			{
				audio_play_sound(walk1_snd, 1, false);
			}
		}
		if (!key_right && grounded)
		{
			if (horspeed = movSpeed)
			{
				horspeed -= 0.05;
			}
		}
		if (!key_left && grounded)
		{
			if (horspeed = -movSpeed)
			{
				horspeed += 0.05;
			}
		}
	}
}

//Moving Platform
if (onMovingPlatform)
{
	if (horspeed < instance_nearest(x, y, sidewaysPlatform_obj).horspeed + 0.05 && horspeed > instance_nearest(x, y, sidewaysPlatform_obj).horspeed - 0.05)
	{
		horspeed = instance_nearest(x, y, sidewaysPlatform_obj).horspeed;
	}
	else
	{
		if (horspeed < instance_nearest(x, y, sidewaysPlatform_obj).horspeed)
		{
			horspeed += 0.02;
		}
		else
		{
			horspeed -= 0.02;
		}
	}
}

//Friction
if (!onMovingPlatform)
{
	frictionActive_scr(id);
}

//Gravity
if (verspeed < 2 && !onLadder && gravityOn)
{
	verspeed -= gravityStrength * global.dt;
}

if (movement && !isZombie)
{
	//Jump
	if (grounded && key_jump || fallJumpSafety > 0 && key_jump || isDashing && key_jump || onBooster && key_jump && jumpType != 2)
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
	if (dashDelay >= 0)
	{
		dashDelay -= global.dt;
	}
	
	//Cancel Dash
	if (stoppedDashing || onLadder)
	{
		if (place_free(x, y + 32))
		{
			isDashing = false;
			stoppedDashing = false;
		}
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
			verspeed = -jumpStrength / 1.05;
		
			if (image_xscale == 1 && key_right)
			{
				horspeed += jumpStrength / 2.3;
			}
			else if (image_xscale == 1 && key_left)
			{
				horspeed += jumpStrength / 3;
			}
			else if (image_xscale == -1 && key_left)
			{
				horspeed -= jumpStrength / 2.3;
			}
			else if (image_xscale == -1 && key_right)
			{
				horspeed -= jumpStrength / 3;
			}
			else if (image_xscale == 1 && !key_right && !key_left)
			{
				horspeed += jumpStrength / 3;
			}
			else if (image_xscale == -1 && !key_right && !key_left)
			{
				horspeed -= jumpStrength / 3;
			}
			wallJumps--;
			wallJumpingInAir = true;
			huggingWall = false;
			setWallDir = false;
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
		//Check if there is space to cancel dash
		if (place_free(x, y + 32))
		{
			isDashing = false;
		}
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
	with (player_obj)
	{
		if (key_jump && !huggingWall && !wallJumping && !grounded && !isDashing && !flipUsed && jumpType == 1 && fallJumpSafety < 0 && wallJumps > 0 && movement)
		{
			sprite_index = playerFlip_spr;
			flip = true;
			flipUsed = true;
			jump_scr();
		}
	}
}
		
if (grounded || isDashing)
{
	flip = false;
	flipUsed = false;
}

//Jump Spin
if (!grounded && !isZombie && !flip && !isDashing && !groundCollisionTimerOn && movement && !unarmed)
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

//Invincibility
if (!movement)
{
	invincible = true;
	horspeed = 0;
	verspeed = 0;
}
else
{
	invincible = false;
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
				if (place_free(x, y + (verspeed * global.dt)))
				{
					huggingWall = true;
				}
			}
		}
	}
	
	if (place_meeting(x + (horspeed * global.dt), y, enemy_obj))
	{
		if (instance_place(x + (horspeed * global.dt), y, enemy_obj).colliding)
		{
			if (sign(horspeed) != 0)
			{
				while (place_meeting(x + sign(horspeed) / 100, y, enemy_obj))
				{
					x -= sign(horspeed) / 100;
				}
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
		onMovingPlatform = false;
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
if (place_meeting(x, y, ladder_obj) && (key_up || key_down) && !isDashing)
{
	onLadder = true;
}

if (!place_meeting(x, y, ladder_obj))
{
	onLadder = false;
}

if (onLadder)
{
	resetJump_scr();
	if (!key_left && !key_right)
	{
		horspeed = 0;
	}
	if (key_up)
	{
		verspeed = -0.75;
		if (!audio_is_playing(climb1_snd) && !audio_is_playing(climb2_snd) && !audio_is_playing(climb3_snd) && !audio_is_playing(climb4_snd))
		{
			var climbsnd = audio_play_sound(choose(climb1_snd, climb2_snd, climb3_snd, climb4_snd), 1, false);
		}
	}
	else if (key_down)
	{
		verspeed = 0.75;
		if (!audio_is_playing(climb1_snd) && !audio_is_playing(climb2_snd) && !audio_is_playing(climb3_snd) && !audio_is_playing(climb4_snd))
		{
			var climbsnd = audio_play_sound(choose(climb1_snd, climb2_snd, climb3_snd, climb4_snd), 1, false);
		}
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
	if (verspeed > 0.22)
	{
		verspeed -= global.dt / 20;
	}
	if (verspeed < 0.18)
	{
		verspeed += global.dt / 20;
	}
	if (verspeed < 0.22 && verspeed > 0.18)
	{
		verspeed = 0.2;
	}
	if (!audio_is_playing(slide_snd))
	{
		var slidesnd = audio_play_sound(slide_snd, 1, false);
		audio_sound_pitch(slidesnd, random_range(0.9, 1.1));
	}
}
else
{
	if (!isDashing)
	{
		audio_stop_sound(slide_snd);
	}
}

//Weapon System ###TODO###
if (inputMethod == 0)
{
	dirCursor = point_direction(x, y, mouse_x, mouse_y);
}
else
{
	if (gamepad_is_connected(4))
	{
		if ((gamepad_axis_value(4, gp_axisrh) > -controllerDeadzone && gamepad_axis_value(4, gp_axisrh) < controllerDeadzone && gamepad_axis_value(4, gp_axisrv) > -controllerDeadzone && gamepad_axis_value(4, gp_axisrv) < controllerDeadzone))
		{
			dirCursor = controllerDirLastInput;
		}
		else
		{
			dirCursor = point_direction(0, 0, gamepad_axis_value(4, gp_axisrh), gamepad_axis_value(4, gp_axisrv));
			controllerDirLastInput = dirCursor;
		}
	}
	if (gamepad_is_connected(0))
	{
		if (gamepad_axis_value(0, gp_axisrh) > -controllerDeadzone && gamepad_axis_value(0, gp_axisrh) < controllerDeadzone && gamepad_axis_value(0, gp_axisrv) > -controllerDeadzone && gamepad_axis_value(0, gp_axisrv) < controllerDeadzone)
		{
			dirCursor = controllerDirLastInput;
		}
		else
		{
			dirCursor = point_direction(0, 0, gamepad_axis_value(0, gp_axisrh), gamepad_axis_value(0, gp_axisrv));
			controllerDirLastInput = dirCursor;
		}
	}
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
						if (horspeed != 0 && movement)
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
					if (jumping && movement)
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
				if (key_shoot && !reloading && movement)
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
if (key_reload && !isZombie)
{
	if ((global.currentWeapon == pickedWeapon.pistol && global.pistolMag != 0) || (global.currentWeapon == pickedWeapon.dualBarettas && global.pistolMag != 0) || (global.currentWeapon == pickedWeapon.shotgun && global.shotgunMag != 0))
	{
		if (global.currentWeapon == pickedWeapon.pistol && global.pistolAmmo < 18 || global.currentWeapon == pickedWeapon.dualBarettas && global.pistolAmmo < 18
		|| global.currentWeapon == pickedWeapon.shotgun && global.shotgunAmmo < 6)
		{
			reloading = true;
		}
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

spriteAnimation = image_index;
if (spriteAnimation > image_number)
{
	spriteAnimation = 0;
}

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
	case playerClimbing_spr:
		animationSpeed = 0.25;
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

if (hp <= 0 || infection < 0)
{
	//Death
	if (!deathActivated)
	{
		death_scr();
		deathActivated = true;
	}
	
	//Revive
	if (keyboard_check_pressed(ord("E")) && syringes > 0 && !place_meeting(x, y, toxicWater_obj))
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
	zombieTimer = zombieTimerSave;
}
if (isZombie && keyboard_check_pressed(ord("F")) && !plagueTransformation)
{
	isZombie = false;
	zombieTimer = zombieTimerSave;
}

//Plague
if (plagueTransformation)
{
	infection -= global.dt / 200;
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
				//slowmo = true;
				//slowmoTimer -= global.dt * 3;
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
		camera_obj.drawBlackborders = true;
		if (!slowmoSoundPlayed)
		{
			audio_play_sound(slowmoStart_snd, 1, false);
			slowmoSoundPlayed = true;
		}
		global.timeScale = 0.2;
		enemySlowMotionTimer -= global.dt;
	}
	if (enemySlowMotionTimer < 0)
	{	
		audio_play_sound(slowmoEnd_snd, 1, false);
		camera_obj.follow = player_obj;
		camera_obj.vignetteFlash = false;
		enemySlowmo = false;
		slowmoSoundPlayed = false;
		global.timeScale = 1;
		camera_obj.drawBlackborders = false;
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
	
//Audio
audio_listener_position(x, y, 0);

if (isDashing && grounded && horspeed != 0)
{
	if (!audio_is_playing(slide_snd))
	{
		var slidesnd = audio_play_sound(slide_snd, 1, false);
		audio_sound_pitch(slidesnd, random_range(0.9, 1.1));
	}
}
else
{
	if (!huggingWall)
	{
		audio_stop_sound(slide_snd);
	}
}

//Lock Movement when no window focus
if (!window_has_focus())
{
	movement = false;
	setMovAfterScreen = true;
}
else if (setMovAfterScreen)
{
	movement = true;
	setMovAfterScreen = false;
}