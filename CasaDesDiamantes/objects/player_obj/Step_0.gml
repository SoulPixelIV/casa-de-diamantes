//if (live_call()) return live_result;

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
key_shoot_hold = mouse_check_button(mb_left) || gamepad_button_check(4, gp_shoulderrb) || gamepad_button_check(0, gp_shoulderrb);
key_shoot_release = mouse_check_button_released(mb_left) || gamepad_button_check_released(4, gp_shoulderrb) || gamepad_button_check_released(0, gp_shoulderrb);
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
	if (dashDelay >= 0 && wallJumps == wallJumpsMax)
	{
		dashDelay -= global.dt;
	}
	
	//Cancel Dash
	if (stoppedDashing || onLadder)
	{
		if (place_free(x, y + 32))
		{
			if (!place_meeting(x, y + 32, enemy_obj))
			{
				isDashing = false;
				stoppedDashing = false;
			}
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
//Continue dash circle even if player is in a minecart
if (instance_exists(minecartForeground_obj))
{
	if (instance_nearest(x, y, minecartForeground_obj).inMinecart)
	{
		if (dashDelay >= 0)
		{
			dashDelay -= global.dt;
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
				if (global.top1 == noone)
				{
					sprite_index = playerDashUnequipped_spr;
				}
				else
				{
					sprite_index = playerDashUnequippedNude_spr;
				}
				if (image_index > image_number - 1 && (sprite_index == playerDashUnequipped_spr || sprite_index == playerDashUnequippedNude_spr))
				{
					image_index = image_number - 1;
				}
			}
		}
		else
		{
			with (player_obj)
			{
				if (global.top1 == noone)
				{
					if (dashLastSpriteReached)
					{
						if ((dirCursor > 90 && dirCursor < 270 && image_xscale == 1) || (dirCursor < 90 || dirCursor > 270 && image_xscale == -1))
						{
							sprite_index = playerDashReverse_spr;
						}
						else
						{
							sprite_index = playerDash_spr;
						}
					}
					else
					{
						sprite_index = playerDash_spr;
					}
				}
				else
				{
					sprite_index = playerDashNude_spr;
				}
				if (image_index > image_number - 1 && (sprite_index == playerDash_spr || sprite_index == playerDashNude_spr))
				{
					dashLastSpriteReached = true;
				}
				if (dashLastSpriteReached)
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
		flip = false;
		//slowmo = false;
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
			//sprite_index = playerFlip_spr;
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
if (!grounded && !isZombie && !flip && !isDashing && !groundCollisionTimerOn && movement && !unarmed && !deathActivated)
{
	if (horspeed < movSpeed - 0.3 || horspeed > -movSpeed + 0.3)
	{
		spin = true;
		if (global.top1 == noone)
		{
			sprite_index = playerJumpSpin_spr;
		}
		else
		{
			sprite_index = playerJumpSpinNude_spr;
		}
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
	flip = false;
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
			if (!isDashing && !huggingWall && !deathActivated)
			{
				if (grounded)
				{
					if (!isZombie && !onLadder)
					{
						if (horspeed != 0 && movement)
						{
							if (global.top1 == noone)
							{
								sprite_index = playerWalkingEquipped_spr;
							}
							else
							{
								sprite_index = playerWalkingEquippedNude_spr;
							}
						}
						else
						{
							if (global.top1 == noone)
							{
								sprite_index = playerEquipped_spr;
							}
							else
							{
								sprite_index = playerEquippedNude_spr;
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
			if (!isDashing && !huggingWall && !deathActivated)
			{
				if (grounded)
				{
					if (!isZombie && !onLadder)
					{
						if (horspeed != 0)
						{
							if (global.top1 == noone)
							{
								sprite_index = playerWalking_spr;
							}
							else
							{
								sprite_index = playerWalkingNude_spr;
							}
						}
						else
						{
							if (global.top1 == noone)
							{
								sprite_index = player_spr;
							}
							else
							{
								sprite_index = playerNude_spr;
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
					if (jumping && movement)
					{
						if (verspeed < 0)
						{
							if (global.top1 == noone)
							{
								sprite_index = playerJumpSpinUnequipped_spr;
							}
							else
							{
								sprite_index = playerJumpSpinUnequippedNude_spr;
							}
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

if (huggingWall && !grounded && !deathActivated)
{
	if (global.currentWeapon == gameManager_obj.pickedWeapon.dualBarettas)
	{
		sprite_index = playerWallNoArm_spr;
	}
	else
	{
		sprite_index = playerWall_spr;
	}
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
			if (global.top1 == noone)
			{
				sprite_index = playerEquipped_spr;
			}
			else
			{
				sprite_index = playerEquippedNude_spr;
			}
		}
		else
		{
			if (global.top1 == noone)
			{
				sprite_index = player_spr;
			}
			else
			{
				sprite_index = playerNude_spr;
			}
		}
	}
	else
	{
		sprite_index = playerClimbing_spr;
	}
}

if (!isZombie && !deathActivated)
{
	//Pistol
	with (gameManager_obj)
	{
		if (global.currentWeapon == pickedWeapon.pistol && global.pistolCooldown <= 0)
		{
			with (player_obj)
			{
				startShotCooldown = false;
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
				startShotCooldown = false;
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
				startShotCooldown = false;
				if (key_shoot && !reloading)
				{
					if (!onLadder || onLadder && verspeed == 0)
					{
						shooting_scr("shotgun");
					}
				}
			}
		}
		//Shotgun Cock
		if (player_obj.startShotCooldown)
		{
			if (global.currentWeapon == pickedWeapon.shotgun && global.shotgunCooldown < global.shotgunCooldownSave / 2)
			{
				if (!audio_is_playing(shotgunPump_snd) && !player_obj.shotgunPumpDone)
				{
					audio_play_sound(shotgunPump_snd, 1, false);
					instance_create_layer(playerBulletLine_obj.x, playerBulletLine_obj.y, "Instances", shotgunBulletCase_obj);
					player_obj.shotgunPumpDone = true;
				}
			}
		}
		if (global.shotgunCooldown < 0)
		{
			player_obj.shotgunPumpDone = false;
		}
	}
	
	//Sniper
	with (gameManager_obj)
	{
		if (global.currentWeapon == pickedWeapon.sniper && global.sniperCooldown <= 0)
		{
			with (player_obj)
			{
				startShotCooldown = false;
				if (key_shoot_hold && !reloading && movement)
				{
					if (!onLadder || onLadder && verspeed == 0)
					{
						slowmo = true;
						if (!audio_is_playing(sniperShotLoad_snd))
						{
							var sniperLoad = audio_play_sound(sniperShotLoad_snd, 1, false);
							audio_sound_pitch(sniperLoad, 0.5 + (sniperDamageValue / 100) / 5);
						}
						if (sniperDamageValue < sniperDamageValueMax)
						{
							sniperDamageValue += global.dt * 4;
						}
						else
						{
							shooting_scr("sniper");
							slowmo = false;
							audio_stop_sound(sniperShotLoad_snd);
							break;
						}
					}
				}
				if (key_shoot_release)
				{
					if (sniperDamageValue > 1)
					{
						shooting_scr("sniper");
						audio_stop_sound(sniperShotLoad_snd);
						slowmo = false;
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

//Playerpoint
if (place_meeting(x, y, battleArenaPlayerpoint_obj))
{
	inPlayerpoint = true;
}
else
{
	inPlayerpoint = false;
}

//Shot Cooldown
if (startShotCooldown)
{
	with (gameManager_obj)
	{
		if (global.currentWeapon == pickedWeapon.pistol)
		{
			global.pistolCooldown -= 0.1 * global.dt;
		}
		if (global.currentWeapon == pickedWeapon.dualBarettas)
		{
			global.dualBarettasCooldown -= 0.1 * global.dt;
		}
		if (global.currentWeapon == pickedWeapon.shotgun)
		{
			global.shotgunCooldown -= 0.1 * global.dt;
		}	
		if (global.currentWeapon == pickedWeapon.sniper)
		{
			global.sniperCooldown -= 0.1 * global.dt;
		}
	}	
}
with (gameManager_obj)
{
	if (global.currentWeapon == pickedWeapon.pistol && global.pistolCooldown > 0)
	{
		player_obj.startShotCooldown = true;
	}
	if (global.currentWeapon == pickedWeapon.dualBarettas && global.dualBarettasCooldown > 0)
	{
		player_obj.startShotCooldown = true;
	}
	if (global.currentWeapon == pickedWeapon.shotgun && global.shotgunCooldown > 0)
	{
		player_obj.startShotCooldown = true;
	}	
	if (global.currentWeapon == pickedWeapon.sniper && global.sniperCooldown > 0)
	{
		player_obj.startShotCooldown = true;
	}
}	

//Weapon Switching
if (!isZombie && !reloading)
{
	if (global.unlockedWeapon[1] || global.unlockedWeapon[2])
	{
		scrollWeapons = [0, 0];
		
		if (keyboard_check_pressed(ord("1")) && global.unlockedWeapon[1])
		{
			pickWeapon_scr(1);
		}
		if (keyboard_check_pressed(ord("2")) && global.unlockedWeapon[2])
		{
			pickWeapon_scr(2);
		}
		if (keyboard_check_pressed(ord("3")) && global.unlockedWeapon[3])
		{
			pickWeapon_scr(3);
		}
		
		if (global.unlockedWeapon[1])
		{
			scrollWeapons[0] = 1;
		}
		if (global.unlockedWeapon[2])
		{
			scrollWeapons[1] = 1;
		}
		if (global.unlockedWeapon[3])
		{
			scrollWeapons[2] = 1;
		}
		
		if (!startScrollDelay)
		{
			if (mouse_wheel_up())
			{
				startScrollDelay = true;
				if (selWeapon > array_length(scrollWeapons) - 1)
				{
					selWeapon = 1;
				}
				else
				{
					selWeapon++;
				}
			
				if (selWeapon == 1 && !global.unlockedWeapon[1])
				{
					selWeapon++;
				}
				if (selWeapon == 2 && !global.unlockedWeapon[2])
				{
					selWeapon = 1;
				}
				pickWeapon_scr(selWeapon);
			}
			if (mouse_wheel_down())
			{
				startScrollDelay = true;
				if (selWeapon < 2)
				{
					selWeapon = array_length(scrollWeapons);
				}
				else
				{
					selWeapon--;
				}
			
				if (selWeapon == 1 && !global.unlockedWeapon[1])
				{
					selWeapon++;
				}
				if (selWeapon == 2 && !global.unlockedWeapon[2])
				{
					selWeapon = 1;
				}
				pickWeapon_scr(selWeapon);
			}
		}
	}
}

if (startScrollDelay)
{
	scrollDelay -= global.dtNoSlowmo;
}
if (scrollDelay < 0)
{
	scrollDelay = scrollDelaySave;
	startScrollDelay = false;
}

//Switch to pistol if empty
if ((global.pistolAmmo == 0 || global.unlockedWeapon[1] == false) && (global.shotgunAmmo == 0 || global.unlockedWeapon[2] == false) && global.currentWeapon != pickedWeapon.pistol)
{
	pickWeapon_scr(0);
}
// || global.sniperAmmo > 0
if (global.currentWeapon == pickedWeapon.pistol)
{
	if (global.unlockedWeapon[1] == true && global.pistolAmmo > 0)
	{
		pickWeapon_scr(1);
	}
	else
	if (global.unlockedWeapon[2] == true && global.shotgunAmmo > 0)
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
	case playerNude_spr:
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
	case playerJumpSpinNude_spr:
		animationSpeed = 1.2;
		break;
	case playerJumpSpinUnequipped_spr:
		animationSpeed = 1.2;
		break;
	case playerJumpSpinUnequippedNude_spr:
		animationSpeed = 1.2;
		break;
	case playerEquipped_spr:
		animationSpeed = 0.5;
		break;
	case playerEquippedNude_spr:
		animationSpeed = 0.5;
		break;
	case playerWalkingEquipped_spr:
		animationSpeed = 0.8;
		break;
	case playerWalkingEquippedNude_spr:
		animationSpeed = 0.8;
		break;
	case playerWalking_spr:
		animationSpeed = 0.8;
		break;
	case playerWalkingNude_spr:
		animationSpeed = 0.8;
		break;
	case playerJump_spr:
		animationSpeed = 0.75;
		break;
	case playerFalling_spr:
		animationSpeed = 0.75;
		break;
	case playerClimbing_spr:
		animationSpeed = 0.5;
		break;
}

if (grounded || !flip)
{
	if (!wallJumpingInAir && !isDashing && !huggingWall && !setWallDir && !deathActivated)
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
	if (image_alpha > 0.2)
	{
		image_alpha = 0.2;
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

if (hp <= 0 || infection > hp)
{
	if (global.syringes < 1)
	{
		camera_obj.finalDeath = true;
	}
	//Death
	if (!deathActivated)
	{
		death_scr();
		deathActivated = true;
	}
	
	//Revive
	if (keyboard_check_pressed(ord("E")) && global.syringes > 0 && !place_meeting(x, y, toxicWater_obj))
	{
		revive_scr();
	}
	//Full Death
	if (keyboard_check_pressed(ord("Q")))
	{
		camera_obj.finalDeath = true;
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
	infection += global.dt / 100;
}

//Slowmotion
if (!deathSlowmo)
{	
	if (slowmo || keyboard_check(vk_enter))
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

//Radiation
if (distance_to_object(toxicwaste_obj) > 96)
{
	if (radiation > 1)
	{
		radiation -= global.dt / 32;
	}
	else
	{
		radiation = 0;
	}
}
if (distance_to_object(toxicwaste_obj) < 96 && distance_to_object(toxicwaste_obj) > 24)
{
	if (radiation < 100)
	{
		radiation += global.dt / 24;
	}
}
if (distance_to_object(toxicwaste_obj) < 24)
{
	if (radiation < 100)
	{
		radiation += global.dt / 16;
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

//Deactivate Movement if away from camera
if (instance_exists(camera_obj))
{
	if (distance_to_object(camera_obj) < (camera_obj.xScreenSize / 2) + 128)
	{
		gravityStrength = gravityStrengthSave;
	}
	else
	{
		gravityStrength = 0;
		horspeed = 0;
		verspeed = 0;
	}
}

//Gravity
if (verspeed < 2 && !onLadder && gravityOn)
{
	verspeed -= gravityStrength * global.dt;
}

//Collision
if (colliding)
{
	//horspeed
	if (!place_free(x + horspeed * global.dt, y))
	{
		if (sign(horspeed) != 0)
		{
			while (place_free(x + sign(horspeed), y))
			{
				x += sign(horspeed);
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
	//Enemy Collision
	if (place_meeting(x + horspeed * global.dt, y, enemy_obj))
	{
		var nearEnemy = instance_place(x + horspeed * global.dt, y, enemy_obj);
		if (nearEnemy != noone)
		{
			if (nearEnemy.colliding)
			{
				horspeed = 0;
			}
		}
	}
	if ((place_free(x + 1, y) && place_free(x - 1, y)) || grounded)
	{
		huggingWall = false;
		setWallDir = false;
	}

	//verspeed
	if (!place_free(x, y + verspeed * global.dt))
	{
		if (sign(verspeed) != 0)
		{
			while (place_free(x, y + sign(verspeed)))
			{
				y += sign(verspeed);
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
	//Enemy Collision
	if (place_meeting(x, y + verspeed * global.dt, enemy_obj))
	{
		if (instance_place(x, y + verspeed * global.dt, enemy_obj).colliding)
		{
			var collidingEnemy = instance_place(x, y + verspeed * global.dt, enemy_obj);
			collidingEnemy.verspeed = 0;
			verspeed = 0;
		}
	}
}

x += horspeed * global.dt;
y += verspeed * global.dt;