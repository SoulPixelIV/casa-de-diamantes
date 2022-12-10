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
key_lastWeapon = keyboard_check_pressed(ord("Q"));
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
				if (!boosterLockedMovement) {
					horspeed += global.dt / 10;
				} else {
					horspeed += 0;
				}
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
				if (!boosterLockedMovement) {
					horspeed -= global.dt / 10;
				} else {
					horspeed -= 0;
				}
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

//Booster Locked Movement
if (boosterLockedMovement) {
	boosterLockedMovementTimer -= global.dt;
	
	if (isDashing && place_free(x, y + 24)) {
		isDashing = false;
		crouchDirSet = false;
		dashLastSpriteReached = false;
		dashDustEndTimer = dashDustEndTimerSave;
		crouchRollTimer = crouchRollTimerSave;
		dashroll = false;
		crouchslide = false;
		dashjumpbuffer = false;
		dashStartDelay = dashStartDelaySave;
		boosterLockedMovement = false;
		boosterLockedMovementTimer = boosterLockedMovementTimerSave;
			
		reachedGroundOnce = false;
	}
}

if (boosterLockedMovementTimer < 0 || (grounded && boosterLockedMovementTimer < (boosterLockedMovementTimerSave - (boosterLockedMovementTimer / 8)))) {
	boosterLockedMovement = false;
	boosterLockedMovementTimer = boosterLockedMovementTimerSave;
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
		if (!dashroll) {
			if (!isDashing) {
				jump_scr();
			} else {
				dashStandupDelayStart = true;
			}
		} else {
			dashjumpbuffer = true;
		}
	}
	//Dash Jump Buffer
	if (dashjumpbuffer && !dashroll) {
		jump_scr();
	}
	
	//Dash Standup Delay
	if (dashStandupDelayStart) {
		dashStandupDelay -= global.dt;
	}
	if (dashStandupDelay < 0) {
		dashStandupDelayStart = false;
		dashStandupDelay = dashStandupDelaySave;
		jump_scr();
	}
	
	//Dash
	if (key_shift && !isDashing && dashDelay < 0 && !huggingWall && !boosterLockedMovement)
	{
		dash_scr();
		dashInvincibilityOn = true;
	}
	if (dashDelay >= 0 && wallJumps == wallJumpsMax)
	{
		dashDelay -= global.dt;
	}
	if (dashInvincibilityOn) {
		invincible = true;
		dashInvincibility -= global.dt;
	}
	if (dashInvincibility < 0) {
		if (!place_meeting(x, y, slowmoCollider_obj)) {
			invincible = false;
		}
		dashInvincibility = dashInvincibilitySave;
		dashInvincibilityOn = false;
	}
	
	//Cancel Dash
	if (stoppedDashing || onLadder)
	{
		//Check for collision with ground (Different hitbox sizes cause issues)
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

//Stop Dash in Minecart
if (instance_exists(minecartForeground_obj))
{
	if (instance_nearest(x, y, minecartForeground_obj).inMinecart)
	{
		stoppedDashing = true;
		stillInAir = true;
		dashDustEndTimer = dashDustEndTimerSave;
		crouchRollTimer = crouchRollTimerSave;
		dashroll = false;
		crouchslide = false;
		//Continue dash circle even if player is in a minecart
		if (dashDelay >= 0)
		{
			dashDelay -= global.dt;
		}
	}
}

//Create dust particles while dashing
if (isDashing && dashDustEndTimer > 0) {
	dashDustTimer -= global.dt;
	dashDustEndTimer -= global.dt;
	if (dashDustTimer < 0)
	{
		instance_create_layer(player_obj.x - 28 * sign(horspeed), player_obj.y, "ForegroundObjects", dustParticle_obj);
		dashDustTimer = dashDustTimerSave;
	}
}

//DEBUG Slowmo Forced
if (keyboard_check_pressed(vk_delete)) {
	forceSlowmo = !forceSlowmo;
	if (forceSlowmo) {
		blackborderPauseTimer = 0;
	} else {
		blackborderPauseTimer = blackborderPauseTimerSave;
	}
}

if (isDashing && !onLadder)
{	
	dashStartDelay -= global.dt;
	//Hitbox height difference between dash sprite and crouch roll sprite
	if (place_free(x, y + 1)) {
		if (!reachedGroundOnce) {
			if (((dirCursor > 90 && dirCursor < 270) && image_xscale == 1) || ((dirCursor < 90 || dirCursor > 270) && image_xscale == -1))
			{
				sprite_index = playerDashReverse_spr;
			}
			else
			{
				sprite_index = playerDash_spr;
			}
		} else {
			isDashing = false;
			crouchDirSet = false;
			dashLastSpriteReached = false;
			dashDustEndTimer = dashDustEndTimerSave;
			crouchRollTimer = crouchRollTimerSave;
			dashroll = false;
			crouchslide = false;
			dashjumpbuffer = false;
			dashStartDelay = dashStartDelaySave;
			boosterLockedMovement = false;
			boosterLockedMovementTimer = boosterLockedMovementTimerSave;
			
			reachedGroundOnce = false;
		}
	} else {		
		//Ignore inital grounded position on dash startup
		if (dashStartDelay < 0) {
			//Ground Roll in to Crouch
			crouchRollTimer -= global.dt;
			if (crouchRollTimer > 0) {
				sprite_index = playerCrouchRoll_spr;
				
				if (!audio_is_playing(dashroll_snd))
				{
					var rollsnd = audio_play_sound(dashroll_snd, 1, false);
					audio_sound_pitch(rollsnd, random_range(0.9, 1.1));
				}
			
				dashroll = true;
			} else {
				reachedGroundOnce = true;
							
				sprite_index = playerCrouch_spr;
				
				crouchslide = true;
				dashroll = false;
				if (!crouchDirSet) {
					crouchDir = image_xscale;
					crouchDirSet = true;
				}
					
				//Check for Crouch Cancel while turning around
				/*
				if (image_xscale != crouchDir && !dashjumpbuffer) {
					crouchDirSet = false;
					jump_scr();
				} */
				
				//Cancel Crouch on Movement
				if (key_left || key_right) {
					reachedGroundOnce = false;
					crouchDirSet = false;
					jump_scr();
				}
			}
		
			//Particles
			if (horspeed != 0 && crouchslide) {
				walljumpDustTimer -= global.dt;
				if (walljumpDustTimer < 0)
				{
					instance_create_layer(player_obj.x - 4 * image_xscale, player_obj.y + 19, "ForegroundObjects", dustParticle_obj);
					instance_create_layer(player_obj.x + 22 * image_xscale, player_obj.y + 19, "ForegroundObjects", dustParticle_obj);
					walljumpDustTimer = walljumpDustTimerSave;
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
			verspeed = -jumpStrength;
		
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
	
	//Let go of Wall
	if (huggingWall && key_down)
	{
		huggingWall = false;
		setWallDir = false;
	}
	
	if (huggingWall) {
		if (image_xscale == 1 && key_right) {
			otherDirWallHugTimer -= global.dt;
		}
		if (image_xscale == -1 && key_left) {
			otherDirWallHugTimer -= global.dt;
		}
		if (!key_right && !key_left) {
			otherDirWallHugTimer = otherDirWallHugTimerSave;
		}
		if (otherDirWallHugTimer < 0) {
			huggingWall = false;
			setWallDir = false;
			otherDirWallHugTimer = otherDirWallHugTimerSave;
		}
	}
	
	if (huggingWall)
	{
		flip = false;
		dashroll = false;
		crouchRollTimer = crouchRollTimerSave;
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
if (!grounded && !isZombie && !flip && !isDashing && !groundCollisionTimerOn && movement && !unarmed && !deathActivated)
{
	if (horspeed < movSpeed - 0.3 || horspeed > -movSpeed + 0.3)
	{
		spin = true;
		
		if (jumpspinAim) {
			sprite_index = playerAimStance_spr;
		} else {
			if (global.currentWeapon == pickedWeapon.pistol) {
				if (global.top1 == noone)
				{
					sprite_index = playerPistolStance_spr;
				}
				else
				{
					//sprite_index = playerJumpSpinNude_spr;
					sprite_index = playerPistolStance_spr;
				}
			}
			if (global.currentWeapon == pickedWeapon.dualBarettas) {
				if (global.top1 == noone)
				{
					sprite_index = playerDualBarettasStance_spr;
				}
				else
				{
					//sprite_index = playerJumpSpinNude_spr;
					sprite_index = playerDualBarettasStance_spr;
				}
			}
			if (global.currentWeapon == pickedWeapon.shotgun) {
				if (global.top1 == noone)
				{
					sprite_index = playerShotgunStance_spr;
				}
				else
				{
					//sprite_index = playerJumpSpinNude_spr;
					sprite_index = playerShotgunStance_spr;
				}
			}
		}
	}
	
	//Spin Aim
	if (jumpspinAim) {
		jumpspinAimTimer -= global.dt;
	}
	if (jumpspinAimTimer < 0) {
		jumpspinAim = false;
		jumpspinAimTimer = jumpspinAimTimerSave;
	}
}
if (grounded)
{
	spin = false;
}

//Invincibility
if (!movement)
{
	//invincible = true;
	horspeed = 0;
	verspeed = 0;
}
else
{
	if (!dashInvincibilityOn && !place_meeting(x, y, slowmoCollider_obj)) {
		invincible = false;
	}
}

if (place_meeting(x, y, slowmoCollider_obj)) {
	invincible = true;
}

//Player Trail
if (!huggingWall) {
	if (dashInvincibilityOn || activateTrailEffect || jumpType == 2) {
		trailDensity -= global.dt;
	}
	if (trailDensity < 0) {
		var trail = instance_create_layer(x, y, "Instances", playerTrail_obj);
		trail.sprite_index = sprite_index;
		trail.image_speed = 0;
		trail.image_index = image_index
		trailDensity = trailDensitySave;
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
	if (huggingWall && image_xscale == 1) {
		if (dirCursor > 0 && dirCursor < 180) {
			updowndir = 0;
		}
		if (dirCursor > 180 && dirCursor < 360) {
			updowndir = 1;
		}
		
		if (dirCursor > 75 && updowndir == 0) {
			dirCursor = 75;
		}
		if (dirCursor < 285 && updowndir == 1) {
			dirCursor = 285;
		}
	}
	if (huggingWall && image_xscale == -1) {
		if (dirCursor < 105) {
			dirCursor = 105;
		}
		if (dirCursor > 255) {
			dirCursor = 255;
		}
	}
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
								if (sign(horspeed) == image_xscale) {
									sprite_index = playerWalkingEquipped_spr;
								} else {
									sprite_index = playerWalkingEquippedReverse_spr;
								}
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
							//sprite_index = playerFalling_spr;
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

	walljumpDustTimer -= global.dt;
	if (walljumpDustTimer < 0)
	{
		instance_create_layer(player_obj.x - 6 * image_xscale, player_obj.y + 22, "ForegroundObjects", dustParticle_obj);
		walljumpDustTimer = walljumpDustTimerSave;
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
	
	//Silenced MP
	with (gameManager_obj)
	{
		if (global.currentWeapon == pickedWeapon.silencedMP && global.silencedMPCooldown <= 0)
		{
			with (player_obj)
			{
				startShotCooldown = false;
				if (key_shoot_hold && !reloading)
				{
					if (!onLadder || onLadder && verspeed == 0)
					{
						shooting_scr("silencedMP");
					}
				}
			}
		}
	}
	
	//Bow
	with (gameManager_obj)
	{
		if (global.currentWeapon == pickedWeapon.bow && global.bowCooldown <= 0)
		{
			with (player_obj)
			{
				if (key_shoot_hold && !reloading && movement)
				{
					if (!onLadder || onLadder && verspeed == 0)
					{
						bowReadying = true;
						if (bowReadyingImage < 4) { //playerbowReadying image number
							bowReadyingImage += global.dt / 20;
						}
						if (!audio_is_playing(bowReadying_snd) && !playedSoundBowReadying)
						{
							audio_play_sound(bowReadying_snd, 1, false);
							playedSoundBowReadying = true;
						}
					}
				}
				if (key_shoot_release)
				{
					if (bowReadyingImage > 0)
					{
						shooting_scr("bow");
						audio_stop_sound(bowReadying_snd);
						//audio_play_sound(bowShot_snd, 1, false);
						audio_play_sound(arrowShotWind_snd, 0.9, false);
						bowReadying = false;
						bowReadyingImage = 0;
						playedSoundBowReadying = false;
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
		if (global.currentWeapon == pickedWeapon.silencedMP)
		{
			global.silencedMPCooldown -= 0.1 * global.dt;
		}
		if (global.currentWeapon == pickedWeapon.bow)
		{
			global.bowCooldown -= 0.1 * global.dt;
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
	if (global.currentWeapon == pickedWeapon.bow && global.bowCooldown > 0)
	{
		player_obj.startShotCooldown = true;
	}
	if (global.currentWeapon == pickedWeapon.silencedMP && global.silencedMPCooldown > 0)
	{
		player_obj.startShotCooldown = true;
	}
}	

//Weapon Switching
if (!isZombie && !reloading)
{
	//Change to other tier weapon with "Q"
	if (key_lastWeapon) {
		if (global.currentWeapon == gameManager_obj.pickedWeapon.dualBarettas && global.unlockedWeapon[2]) {
			pickWeapon_scr(2);
		} else
		if (global.currentWeapon == gameManager_obj.pickedWeapon.shotgun && global.unlockedWeapon[1]) {
			pickWeapon_scr(1);
		} else
		if (global.currentWeapon == gameManager_obj.pickedWeapon.bow && global.unlockedWeapon[3]) {
			pickWeapon_scr(3);
		} else
		if (global.currentWeapon == gameManager_obj.pickedWeapon.silencedMP && global.unlockedWeapon[4]) {
			pickWeapon_scr(4);
		}
	}
	
	if (global.unlockedWeapon[1] || global.unlockedWeapon[2] || global.unlockedWeapon[3] || global.unlockedWeapon[4])
	{
		scrollWeapons = [0, 0, 0, 0];
		
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
		if (keyboard_check_pressed(ord("4")) && global.unlockedWeapon[4])
		{
			pickWeapon_scr(4);
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
		if (global.unlockedWeapon[4])
		{
			scrollWeapons[3] = 1;
		}
		
		if (!startScrollDelay)
		{
			if (mouse_wheel_up() || gamepad_button_check(0, gp_shoulderr) || gamepad_button_check(4, gp_shoulderr))
			{
				startScrollDelay = true;
				//SelWeapon starts at 1
				if (selWeapon > array_length(scrollWeapons) - 1)
				{
					selWeapon = 1; //Cycle to first weapon
				}
				else
				{
					selWeapon++; //Otherwise go to next weapon
				}
			
				//Check if selected Weapon is available
				if (selWeapon == 1 && !global.unlockedWeapon[1])
				{
					selWeapon++;
				}
				if (selWeapon == 2 && !global.unlockedWeapon[2])
				{
					selWeapon++;
				}
				if (selWeapon == 3 && !global.unlockedWeapon[3])
				{
					selWeapon++;
				}
				if (selWeapon == 4 && !global.unlockedWeapon[4])
				{
					selWeapon = 1;
				}
				
				if (global.unlockedWeapon[selWeapon] == true) {
					pickWeapon_scr(selWeapon);
				}
			}
			if (mouse_wheel_down() || gamepad_button_check(0, gp_shoulderl) || gamepad_button_check(4, gp_shoulderl))
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
			
				if (selWeapon == 4 && !global.unlockedWeapon[4])
				{
					selWeapon--;
				}
				if (selWeapon == 3 && !global.unlockedWeapon[3])
				{
					selWeapon--;
				}
				if (selWeapon == 2 && !global.unlockedWeapon[2])
				{
					selWeapon--;
				}
				if (selWeapon == 1 && !global.unlockedWeapon[1])
				{
					selWeapon = 4;
				}
				
				if (global.unlockedWeapon[selWeapon] == true) {
					pickWeapon_scr(selWeapon);
				}
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
if ((global.pistolAmmo == 0 || global.unlockedWeapon[1] == false) && (global.shotgunAmmo == 0 || global.unlockedWeapon[2] == false) && (global.silencedMPAmmo == 0 || global.unlockedWeapon[3] == false) && (global.bowAmmo == 0 || global.unlockedWeapon[4] == false) && global.currentWeapon != pickedWeapon.pistol)
{
	pickWeapon_scr(0);
}
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
	else
	if (global.unlockedWeapon[3] == true && global.silencedMPAmmo > 0)
	{
		pickWeapon_scr(3);
	}
	else
	if (global.unlockedWeapon[4] == true && global.bowAmmo > 0)
	{
		pickWeapon_scr(4);
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
	case playerShotgunStance_spr:
		animationSpeed = 1.5;
		break;
	case playerDualBarettasStance_spr:
		animationSpeed = 1.5;
		break;
	case playerPistolStance_spr:
		animationSpeed = 1.5;
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
		animationSpeed = 0.9;
		break;
	case playerWalkingEquippedReverse_spr:
		animationSpeed = 0.9;
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
	case playerClimbing_spr:
		animationSpeed = 0.5;
		break;
	case playerCrouchRoll_spr:
		animationSpeed = 0;
		break;
	case playerCrouch_spr:
		animationSpeed = 0.5;
		break;
}

if (grounded || !flip)
{
	if (!wallJumpingInAir && (!isDashing || crouchslide) && !huggingWall && !setWallDir && !deathActivated && (!spin || (spin && jumpspinAim)))
	{
		if (!place_meeting(x, y, ladder_obj) || (place_meeting(x, y, ladder_obj) && verspeed == 0)) {
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
	if (instance_exists(toxicWater_obj)) {
		if (place_meeting(x, y, toxicWater_obj)) {
			camera_obj.finalDeath = true;
		}
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
		if (!place_meeting(x, y, slowmoCollider_obj)) {
			global.timeScale = 1;
		}
	}
	
	if (slowmoTimer < 30)
	{
		slowmo = false
		global.timeScale = 1;
	}
	with (camera_obj) {
		if (distance_to_object(player_obj.camFollowTarget) < 512) { //Chech if target too far away
			if (player_obj.enemySlowmo && !player_obj.blackborderPause) {
				follow = player_obj.camFollowTarget;
				drawBlackborders = true;
				if (!player_obj.slowmoSoundPlayed) {
					with (player_obj) {
						audio_play_sound(slowmoStart_snd, 1, false);
						slowmoSoundPlayed = true;
					}
				}
				global.timeScale = 0.2;
				player_obj.enemySlowMotionTimer -= global.dt;
			}
		}
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
		blackborderPause = true;
	}
}

if (blackborderPause) {
	blackborderPauseTimer -= global.dt;
}

if (blackborderPauseTimer < 0) {
	if (!enemySlowmo) {
		blackborderPause = false;
		blackborderPauseTimer = blackborderPauseTimerSave;
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

//Glitter on specific clothes
if (global.top1 == glitterTop_spr) {
	glitterTimer -= global.dt;
	if (glitterTimer < 0) {
		instance_create_layer(random_range(x - 5, x + 5), random_range(y - 8, y + 8), "GraphicsLayer", blueSparkle_obj);
		glitterTimer = random_range(125,500);
	}
}

//Radiation
if (distance_to_object(toxicwaste_obj) > 64 && distance_to_object(rainmaker_obj) > 76)
{
	if (radiation > 1)
	{
		radiation -= global.dt / 24;
	}
	else
	{
		radiation = 0;
	}
}
if ((distance_to_object(toxicwaste_obj) < 64 && distance_to_object(toxicwaste_obj) > 18) || distance_to_object(rainmaker_obj) < 76)
{
	if (radiation < 100)
	{
		radiation += global.dt / 16;
	}
}
if (distance_to_object(toxicwaste_obj) < 18)
{
	if (radiation < 100)
	{
		radiation += global.dt / 8;
	}
}

if (radiation > 80) {
	radiationHitTimer -= global.dt;
	if (radiationHitTimer < 0) {
		hp -= 1;
		radiationHitTimer = radiationHitTimerSave;
		camera_obj.hitVignette = true;
	}
}
	
//Audio
audio_listener_position(x, y, 0);

if (isDashing && grounded && horspeed != 0)
{
	if (!audio_is_playing(dashslide_snd))
	{
		var slidesnd = audio_play_sound(dashslide_snd, 1, false);
		audio_sound_pitch(slidesnd, random_range(0.9, 1.1));
	}
}
else
{
	if (!huggingWall)
	{
		audio_stop_sound(dashslide_snd);
	}
}

//Hit Cooldown while invincible
invincibleHitCooldown -= global.dt;

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
					if (place_free(x, y - 16)) {
						huggingWall = true;
					}
				}
			}
		}
	}
	//Enemy Collision
	if (!isDashing) {
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
			if (place_free(x, y - 16)) {
				resetJump_scr();
			} else {
				verspeed = 0;
			}
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
	if (!isDashing) {
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
}

x += horspeed * global.dt;
y += verspeed * global.dt;