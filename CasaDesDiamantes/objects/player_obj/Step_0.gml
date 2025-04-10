//if (live_call()) return live_result;

//Check for Controller or Keyboard
if (gamepad_button_check_pressed(4, gp_face1) || gamepad_button_check_pressed(0, gp_face1)
 || gamepad_axis_value(4, gp_axislh) < -0.4 || gamepad_axis_value(0, gp_axislh) < -0.4
  || gamepad_button_check(4, gp_padu) || gamepad_axis_value(4, gp_axislv) < -0.4 || gamepad_button_check(0, gp_padu) || gamepad_axis_value(0, gp_axislv) < -0.4
   || gamepad_button_check(4, gp_padu) || gamepad_axis_value(4, gp_axislv) < -0.4 || gamepad_button_check(0, gp_padu) || gamepad_axis_value(0, gp_axislv) < -0.4
    || gamepad_button_check(4, gp_padd) || gamepad_axis_value(4, gp_axislv) > 0.4 || gamepad_button_check(0, gp_padd) || gamepad_axis_value(0, gp_axislv) > 0.4
	 || gamepad_button_check_pressed(4, gp_shoulderrb) || gamepad_button_check_pressed(0, gp_shoulderrb)
	  || gamepad_button_check_pressed(4, gp_face2) || gamepad_button_check_pressed(0, gp_face2)
	   || gamepad_button_check_pressed(4, gp_face3) || gamepad_button_check_pressed(0, gp_face3)
	    || gamepad_button_check(4, gp_shoulderlb) || gamepad_button_check(0, gp_shoulderlb)
		 || gamepad_button_check_pressed(4, gp_start) || gamepad_button_check_pressed(0, gp_start))
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

key_up = keyboard_check(ord("W")) || gamepad_button_check(4, gp_padu) || gamepad_button_check(0, gp_padu);
key_down = keyboard_check(ord("S")) || gamepad_button_check(4, gp_padd) || gamepad_axis_value(4, gp_axislv) > 0.4 || gamepad_button_check(0, gp_padd) || gamepad_axis_value(0, gp_axislv) > 0.4;
key_up_pressed = keyboard_check_pressed(ord("W")) || gamepad_button_check_pressed(4, gp_padu) || gamepad_button_check_pressed(0, gp_padu);
key_down_pressed = keyboard_check_pressed(ord("S")) || gamepad_button_check_pressed(4, gp_padd) || gamepad_button_check_pressed(0, gp_padd);

key_shoot = mouse_check_button_pressed(mb_left) || gamepad_button_check_pressed(4, gp_shoulderrb) || gamepad_button_check_pressed(0, gp_shoulderrb);
key_shoot_hold = mouse_check_button(mb_left) || gamepad_button_check(4, gp_shoulderrb) || gamepad_button_check(0, gp_shoulderrb);
key_shoot_release = mouse_check_button_released(mb_left) || gamepad_button_check_released(4, gp_shoulderrb) || gamepad_button_check_released(0, gp_shoulderrb);
key_reload = mouse_check_button_pressed(mb_right) || gamepad_button_check_pressed(4, gp_face3) || gamepad_button_check_pressed(0, gp_face3);
key_lastWeapon = keyboard_check_pressed(ord("Q")) || gamepad_button_check_pressed(4, gp_face2) || gamepad_button_check_pressed(0, gp_face2);
key_jump = keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(4, gp_face1) || gamepad_button_check_pressed(0, gp_face1);
key_jump_hold = keyboard_check(vk_space) || gamepad_button_check(4, gp_face1) || gamepad_button_check(0, gp_face1);
key_jump_release = keyboard_check_released(vk_space) || gamepad_button_check_released(4, gp_face1) || gamepad_button_check_released(0, gp_face1);
key_shift_hold = keyboard_check(vk_shift) || gamepad_button_check(4, gp_shoulderlb) || gamepad_button_check(0, gp_shoulderlb);
key_shift = keyboard_check_pressed(vk_shift) || gamepad_button_check_pressed(4, gp_shoulderlb) || gamepad_button_check_pressed(0, gp_shoulderlb);
key_control = keyboard_check_pressed(vk_control) || gamepad_button_check_pressed(4, gp_face2) || gamepad_button_check_pressed(0, gp_face2);
key_escape = keyboard_check_pressed(vk_escape) || gamepad_button_check_pressed(4, gp_start) || gamepad_button_check_pressed(0, gp_start);

if (key_escape && !pauseDelayStart && !enemySlowmo && hp > 0 && !dialogueSystem_obj.inCutscene && camera_obj.blackscreenStrength < 0.1 && !deathActivated && !camera_obj.cameraTrainCutscene) {
	save_scr();
	global.pause = !global.pause;
	camera_obj.pauseScreen = 0;
	camera_obj.cursorPos = 0;
	pauseDelayStart = true;
}
if (pauseDelayStart) {
	pauseDelay -= global.dtNoSlowmo;
}
if (pauseDelay < 0) {
	pauseDelay = pauseDelaySave;
	pauseDelayStart = false;
}

//Sprites
if (global.skin == 0) {
	playerEquippedSprite = playerEquipped_spr;
	playerArmEmptySprite = playerArmEmpty_spr;
	playerArmEmptyWalkingSprite = playerArmEmptyWalking_spr;
	playerArmEmptyWalkingSpriteReverse = playerArmEmptyWalkingReverse_spr;
	playerArmEmpty2Sprite = playerArmEmpty2_spr;
	playerArmCurvedSprite = playerArmCurved_spr;
	playerArmCurvedWalkingSprite = playerArmCurvedWalking_spr;
	playerArmCurvedWalkingSpriteReverse = playerArmCurvedWalkingReverse_spr
	playerAimStanceSprite = playerAimStance_spr;
	playerWalkingSprite = playerWalkingEquipped_spr;
	playerWalkingEquippedReverse = playerWalkingEquippedReverse_spr;
	playerCrouchRollSprite = playerCrouchRoll_spr;
	playerFlipSprite = playerFlip_spr;
	playerPistolStanceSprite = playerPistolStance_spr;
	playerDualBarettasStanceSprite = playerDualBarettasStance_spr;
	playerShotgunStanceSprite = playerShotgunStance_spr;
	playerSilencedMPStanceSprite = playerSilencedMPStance_spr;
	playerAntiMaterialRifleStanceSprite = playerAntiMaterialRifleStance_spr;
	playerDashSprite = playerDash_spr;
	playerDashReverseSprite = playerDashReverse_spr;
	playerCrouchSprite = playerCrouch_spr;
	playerVineDeathSprite = playerVineDeath_spr;
	playerWallSprite = playerWall_spr;
	playerWallNoArmSprite = playerWallNoArm_spr;
}

if (global.skin == 1) {
	playerEquippedSprite = playerEquippedSkin1_spr;
	playerArmEmptySprite = playerArmEmptySkin1_spr;
	playerArmEmptyWalkingSprite = playerArmEmptyWalkingSkin1_spr;
	playerArmEmptyWalkingSpriteReverse = playerArmEmptyWalkingReverseSkin1_spr;
	playerArmEmpty2Sprite = playerArmEmpty2Skin1_spr;
	playerArmCurvedSprite = playerArmCurvedSkin1_spr;
	playerArmCurvedWalkingSprite = playerArmCurvedWalkingSkin1_spr;
	playerArmCurvedWalkingSpriteReverse = playerArmCurvedWalkingReverseSkin1_spr
	playerAimStanceSprite = playerAimStanceSkin1_spr;
	playerWalkingSprite = playerWalkingEquippedSkin1_spr;
	playerWalkingEquippedReverse = playerWalkingEquippedReverseSkin1_spr;
	playerCrouchRollSprite = playerCrouchRollSkin1_spr;
	playerFlipSprite = playerFlipSkin1_spr;
	playerPistolStanceSprite = playerPistolStanceSkin1_spr;
	playerDualBarettasStanceSprite = playerDualBarettasStanceSkin1_spr;
	playerShotgunStanceSprite = playerShotgunStanceSkin1_spr;
	playerSilencedMPStanceSprite = playerSilencedMPStanceSkin1_spr;
	playerAntiMaterialRifleStanceSprite = playerAntiMaterialRifleStanceSkin1_spr;
	playerDashSprite = playerDashSkin1_spr;
	playerDashReverseSprite = playerDashReverseSkin1_spr;
	playerCrouchSprite = playerCrouchSkin1_spr;
	playerVineDeathSprite = playerVineDeathSkin1_spr;
	playerWallSprite = playerWallSkin1_spr;
	playerWallNoArmSprite = playerWallNoArmSkin1_spr;
}

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

muteSoundTimer -= global.dt;

if (!inCutscene) {
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
}

//Skip Cutscene
if (inCutscene) {
	if (inputMethod == 0) {
		if (keyboard_check(vk_enter)) {
			global.cutsceneLevel2Done = true;
			musicManager_obj.act1MusicStarted = false;
			room_restart();
		}
	} else {
		if (gamepad_button_check_pressed(0, gp_select) || gamepad_button_check_pressed(4, gp_select)) {
			global.cutsceneLevel2Done = true;
			musicManager_obj.act1MusicStarted = false;
			room_restart();
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

if (movement && !isZombie && !global.pause && !inCutscene)
{
	//Jump
	if (!place_meeting(x, y, slowmoCollider_obj)) {
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
		
		//Falling Second Jump
		if (!grounded && key_jump && jumpType != 2 && jumpType != 1) {
			if (!dashroll) {
				if (!isDashing) {
					sprite_index = playerFlip_spr;
					flip = true;
					flipUsed = true;
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
			if (!place_meeting(x, y, slowmoCollider_obj) && !inChamber) {
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
}

//Drunk Filter
if (room == level_Casino || room == level_CasinoRoof || room == blackjackTable || room == level0 || room == level1 || room == level2 || room == level3 || room == level4 || room == level5A || room == level5B || room == level6 || room == level7 || room == level8 || room == level9 || room == warpzone1 || room == level10 || room == level11 || room == level12 || room == level13 || room == level14 || room == warpzone2) {
	fil1 = layer_get_fx("DrunkFilter1");
	fil2 = layer_get_fx("DrunkFilter2");
	
	fx_set_parameter(fil1, "g_Distort1Amount", global.drunknessLevel);
	fx_set_parameter(fil1, "g_Distort2Amount", global.drunknessLevel * 2);
	
	fx_set_parameter(fil2, "g_TwistBlurIntensity", global.drunknessLevel / 100);
}
//Slowly remove drunkness
if (global.drunknessLevel > 0) {
	global.drunknessLevel -= global.dt / 25000;
}

//Stop Dash in Minecart
if (instance_exists(minecart_obj))
{
	if (instance_nearest(x, y, minecart_obj).inMinecart)
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
if (isDashing && dashDustEndTimer > 0 && !inChamber) {
	dashDustTimer -= global.dt;
	dashDustEndTimer -= global.dt;
	if (dashDustTimer < 0)
	{
		instance_create_layer(player_obj.x - 28 * sign(horspeed), player_obj.y, "ForegroundObjects", dustParticle_obj);
		dashDustTimer = dashDustTimerSave;
	}
}

//DEBUG Slowmo Forced
/*
if (keyboard_check_pressed(vk_delete)) {
	forceSlowmo = !forceSlowmo;
	if (forceSlowmo) {
		blackborderPauseTimer = 0;
	} else {
		blackborderPauseTimer = blackborderPauseTimerSave;
	}
}*/

if (isDashing && !onLadder)
{	
	dashStartDelay -= global.dt;
	//Hitbox height difference between dash sprite and crouch roll sprite
	if (place_free(x, y + 1)) {
		if (!reachedGroundOnce) {
			if (((dirCursor > 90 && dirCursor < 270) && image_xscale == 1) || ((dirCursor < 90 || dirCursor > 270) && image_xscale == -1))
			{
				sprite_index = playerDashReverseSprite;
			}
			else
			{
				sprite_index = playerDashSprite;
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
				sprite_index = playerCrouchRollSprite;
				
				if (!audio_is_playing(dashroll_snd))
				{
					var rollsnd = audio_play_sound(dashroll_snd, 1, false);
					audio_sound_pitch(rollsnd, random_range(0.9, 1.1));
				}
			
				dashroll = true;
			} else {
				reachedGroundOnce = true;
							
				sprite_index = playerCrouchSprite;
				
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
					if (movement) {
						reachedGroundOnce = false;
						crouchDirSet = false;
						jump_scr();
					}
				}
			}
		
			//Particles
			if (horspeed != 0 && crouchslide && !inChamber) {
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
			//huggingWall = false;
			//setWallDir = false;
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

if (place_meeting(x, y, slowmoCollider_obj)) {
	huggingWall = false;
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
if (!grounded && !isZombie && !flip && !isDashing && !groundCollisionTimerOn && !unarmed && !deathActivated)
{
	if (horspeed < movSpeed - 0.3 || horspeed > -movSpeed + 0.3)
	{
		spin = true;
		
		if (jumpspinAim) {
			sprite_index = playerAimStanceSprite;
		} else {
			if (global.currentWeapon == pickedWeapon.pistol) {
				sprite_index = playerPistolStanceSprite;
			}
			if (global.currentWeapon == pickedWeapon.dualBarettas) {
				sprite_index = playerDualBarettasStanceSprite;
			}
			if (global.currentWeapon == pickedWeapon.shotgun) {
				sprite_index = playerShotgunStanceSprite;
			}
			if (global.currentWeapon == pickedWeapon.silencedMP) {
				sprite_index = playerSilencedMPStanceSprite;
			}
			if (global.currentWeapon == pickedWeapon.bow) {
				sprite_index = playerAntiMaterialRifleStanceSprite;
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
	if (!dashInvincibilityOn && !place_meeting(x, y, slowmoCollider_obj) && !inChamber) {
		invincible = false;
	}
}

if (place_meeting(x, y, slowmoCollider_obj) || inChamber) {
	invincible = true;
}

//Player Trail
if (!huggingWall && !inChamber) {
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

//HP FULL
if (place_meeting(x, y, healthpackPickup_obj) || place_meeting(x, y, healthpack_obj) || place_meeting(x, y, healthpackDrop_obj) ||place_meeting(x, y, maxHealthpack_obj)) {
	camera_obj.hpFullMessage = true;
} else {
	camera_obj.hpFullMessage = false;
}

//Create Dust Particles
if (grounded && !createdParticles && !isDashing && !inChamber)
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

//Springladder
if (onSpringLadder) {
	gravityOn = false;
	
	nearestSpringLadder = instance_nearest(x, y, springladder_obj);
	x = nearestSpringLadder.x;
	y = nearestSpringLadder.y;
	
	if (key_jump) {
		jump_scr();
		//verspeed -= global.dt * 1.7;
		onSpringLadderDelay = onSpringLadderDelaySave;
		onSpringLadder = false;
		gravityOn = true;
	}
}

onSpringLadderDelay -= global.dt;

//Ladder LEGACY
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
	//resetJump_scr
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
if (!global.pause) {
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
							if (sign(horspeed) == image_xscale) {
								sprite_index = playerWalkingSprite;
							} else {
								sprite_index = playerWalkingEquippedReverse;
							}
						}
						else
						{
							sprite_index = playerEquippedSprite;
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
					if (jumping)
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
		sprite_index = playerWallNoArmSprite;
	}
	else
	{
		sprite_index = playerWallSprite;
	}

	walljumpDustTimer -= global.dt;
	if (walljumpDustTimer < 0 && !inChamber)
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
			sprite_index = playerEquippedSprite;
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

if (shootingAllowed && !global.pause) {
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
							if (room == level_Casino || room == level_CasinoRoof || room == level_DiningHall || room == level_Basement || room == level_TristramRoom) {
								camera_obj.showWeaponProhibited = true;
							} else {
								shooting_scr("pistol");
							}
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
							if (room == level_Casino || room == level_CasinoRoof || room == level_DiningHall || room == level_Basement || room == level_TristramRoom) {
								camera_obj.showWeaponProhibited = true;
							} else {
								if (global.pistolAmmo > 0) {
									shooting_scr("dualBarettas");
								} else {
									if (!audio_is_playing(emptyClip_snd)) {
										var emptyShot = audio_play_sound(emptyClip_snd, 1, false);
										audio_sound_pitch(emptyShot, random_range(0.9, 1.1));
									}
								}
							}
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
							if (room == level_Casino || room == level_CasinoRoof || room == level_DiningHall || room == level_Basement || room == level_TristramRoom) {
								camera_obj.showWeaponProhibited = true;
							} else {
								if (global.shotgunAmmo > 0) {
									shooting_scr("shotgun");
								} else {
									if (!audio_is_playing(emptyClip_snd)) {
										var emptyShot = audio_play_sound(emptyClip_snd, 1, false);
										audio_sound_pitch(emptyShot, random_range(0.9, 1.1));
									}
								}
							}
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
							if (room == level_Casino || room == level_CasinoRoof || room == level_DiningHall || room == level_Basement || room == level_TristramRoom) {
								camera_obj.showWeaponProhibited = true;
							} else {
								if (global.silencedMPAmmo > 0) {
									shooting_scr("silencedMP");
								} else {
									if (!audio_is_playing(emptyClip_snd)) {
										var emptyShot = audio_play_sound(emptyClip_snd, 1, false);
										audio_sound_pitch(emptyShot, random_range(0.9, 1.1));
									}
								}
							}
						}
					}
				}
			}
		}
		//Particle System
		partX = playerBulletLine_obj.x + lengthdir_x(24, dirCursor);
		partY = playerBulletLine_obj.y + lengthdir_y(24, dirCursor);
		partX2 = playerBulletLine_obj.x + lengthdir_x(18, dirCursor);
		partY2 = playerBulletLine_obj.y + lengthdir_y(18, dirCursor);
			
		part_emitter_region(global.partSystem, partEmitterPlayer, partX, partX, partY, partY, ps_shape_ellipse, ps_distr_invgaussian);

		//Flamethrower Load
		if (global.silencedMPUpgrade2 && global.currentWeapon == pickedWeapon.silencedMP && global.silencedMPAmmo != 0) {
			if (key_shoot_hold) {
				if (!flamethrowerOn) {
					if (flamethrowerLoad < 300) {
						flamethrowerLoad += global.dt;
					} else {
						flamethrowerLoad = 300;
						flamethrowerOn = true;
					}
				}
			} else {
				if (!flamethrowerOn) {
					if (flamethrowerLoad > 0) {
						flamethrowerLoad -= global.dt;
					} else {
						flamethrowerLoad = 0;
					}
				}
			}
		}
		
		if (flamethrowerOn) {
			flamethrowerTimer -= global.dt;
			if (!flameBurstOn) {
				instance_create_layer(partX2, partY2, "Instances", flamethrowerHitbox_obj);
				flameSound1 = audio_play_sound(flamethrower_snd, 1, true);
				flameSound2 = audio_play_sound(flamethrower_snd, 1, true);
				flameSound3 = audio_play_sound(flamethrower_snd, 1, true);
				//partEmitterPlayer = part_emitter_create(global.partSystem);
				//part_emitter_stream(global.partSystem, partEmitterPlayer, global.flamethrowerSparkPart, 19);
				flameBurstOn = true;
			}
		} else {
			if (instance_exists(flamethrowerHitbox_obj)) {
				instance_destroy(flamethrowerHitbox_obj);
			}
			//part_emitter_destroy(global.partSystem, partEmitterPlayer);
			audio_stop_sound(flameSound1)
			audio_stop_sound(flameSound2)
			audio_stop_sound(flameSound3)
			flameBurstOn = false;
		}
		
		if (flamethrowerTimer < 0 || global.silencedMPAmmo == 0 || global.currentWeapon != pickedWeapon.silencedMP) {
			if (shootingAllowed && !global.pause) {
				part_emitter_destroy(global.partSystem, partEmitterPlayer);
				flamethrowerOn = false;
				flamethrowerLoad = 0;
				flamethrowerTimer = flamethrowerTimerSave;
			}
		}
		if (!key_shoot_hold) {
			flamethrowerOn = false;
			flamethrowerLoad = 0;
			flamethrowerTimer = flamethrowerTimerSave;
		}
	
		//Anti-Material Rifle
		with (gameManager_obj)
		{
			if (global.currentWeapon == pickedWeapon.bow && global.bowCooldown <= 0)
			{
				with (player_obj)
				{
					startShotCooldown = false;
					if (key_shoot && !reloading)
					{
						if (!onLadder || onLadder && verspeed == 0)
						{
							if (room == level_Casino || room == level_CasinoRoof || room == level_DiningHall || room == level_Basement || room == level_TristramRoom) {
								camera_obj.showWeaponProhibited = true;
							} else {
								if (global.bowAmmo > 0) {
									shooting_scr("bow");
								} else {
									if (!audio_is_playing(emptyClip_snd)) {
										var emptyShot = audio_play_sound(emptyClip_snd, 1, false);
										audio_sound_pitch(emptyShot, random_range(0.9, 1.1));
									}
								}
							}
						}
					}
				}
			}
		}
	}
}

//Blackscreen Strength
if (!blackscreenDone) {
	if (blackscreenStartTimer > 0) {
		blackscreenStartTimer -= global.dt;
	}
	if (blackscreenStartTimer <= 0) {
		if (camera_obj.blackscreenStrength > 0) {
			blackscreen_scr(1)
		} else {
			blackscreenDone = true;
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
			if (mouse_wheel_up() || gamepad_button_check_pressed(0, gp_shoulderr) || gamepad_button_check_pressed(4, gp_shoulderr))
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
			if (mouse_wheel_down() || gamepad_button_check_pressed(0, gp_shoulderl) || gamepad_button_check_pressed(4, gp_shoulderl))
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
	case playerShotgunStanceSprite:
		animationSpeed = 1.5;
		break;
	case playerDualBarettasStanceSprite:
		animationSpeed = 1.5;
		break;
	case playerPistolStanceSprite:
		animationSpeed = 1.5;
		break;
	case playerSilencedMPStanceSprite:
		animationSpeed = 1.5;
		break;
	case playerAntiMaterialRifleStanceSprite:
		animationSpeed = 1.5;
		break;
	case playerJumpSpinUnequipped_spr:
		animationSpeed = 1.2;
		break;
	case playerJumpSpinUnequippedNude_spr:
		animationSpeed = 1.2;
		break;
	case playerEquippedSprite:
		animationSpeed = 0.5;
		break;
	case playerEquippedNude_spr:
		animationSpeed = 0.5;
		break;
	case playerWalkingSprite:
		animationSpeed = 1.15;
		break;
	case playerWalkingEquippedReverse:
		animationSpeed = 1.15;
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
	case playerCrouchRollSprite:
		animationSpeed = 0;
		break;
	case playerCrouchSprite:
		animationSpeed = 0.5;
		break;
	case playerVineDeathSprite:
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
	if (!inChamber) {
		image_alpha = 1;
	}
}

if (hp <= 0 || infection > hp || deathActivated)
{	
	player_obj.plagueTransformation = false;
	player_obj.infection = 0;
	camera_obj.zombiespikeEffectBorder = camera_obj.zombiespikeEffectBorderSave;
	camera_obj.zombiespikeBorderTransparent = camera_obj.zombiespikeBorderTransparentSave;
	camera_obj.showedInf = false;
	camera_obj.showInfOverlay = false;
	camera_obj.InfOverlayTimer = camera_obj.InfOverlayTimerSave;
	camera_obj.infOverlayX = camera_obj.xScreenSize;
	camera_obj.infOverlayY = 0;
	camera_obj.infOverlayLocked = false;
	
	if (global.syringes < 1)
	{
		camera_obj.finalDeath = true;
		camera_obj.drawInfectionText = true;
		movement = false;
		inChamber = true;
		gravityOn = false;
		
		if (!createDeathChunks) {
			var amount = random_range(12, 18);
			repeat(amount) {
				instance_create_layer(x, y, "Instances", meatchunk_obj);
			}
	
			var amount2 = random_range(8, 14);
			repeat(amount2) {
				var blood = instance_create_layer(x + random_range(-16, 16), y + random_range(-20, 20), "Instances", bloodSpread2_obj);
				blood.image_xscale = choose(random_range(0.7, 1), random_range(-0.7, -1));
				blood.image_yscale = choose(random_range(0.7, 1), random_range(-0.7, -1));
			}
	
			inChamber = true;
			createDeathChunks = true;
		}
	} else {
		//Death
		if (instance_exists(camera_obj)) {
			camera_obj.hazeEffect = true;
		}
		if (!deathActivated)
		{
			death_scr();
			repeat(14) {
				currVine = instance_create_layer(x, y, "Instances", vine_obj);
				currVine.image_angle = random_range(0, 359);
				currVine.growSpeed = random_range(1, 2.4);
			}
			instance_create_layer(x, y, "ForegroundObjects", playerVineDeath_obj);		
		}
	}
	
	if (instance_exists(toxicWater_obj)) {
		if (place_meeting(x, y, toxicWater_obj)) {
			camera_obj.finalDeath = true;
			camera_obj.drawInfectionText = true;
		}
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
		camera_obj.drawInfectionText = true;
		if (instance_exists(camera_obj)) {
			camera_obj.hazeEffect = false;
		}
		
		if (!createDeathChunks) {
			var amount = random_range(14, 20);
			repeat(amount) {
				instance_create_layer(x, y, "Instances", meatchunk_obj);
			}
	
			var amount2 = random_range(8, 14);
			repeat(amount2) {
				var blood = instance_create_layer(x + random_range(-16, 16), y + random_range(-20, 20), "Instances", bloodSpread2_obj);
				blood.image_xscale = choose(random_range(0.7, 1), random_range(-0.7, -1));
				blood.image_yscale = choose(random_range(0.7, 1), random_range(-0.7, -1));
			}
	
			inChamber = true;
			createDeathChunks = true;
		}
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
	if (slowmo)
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
		if (!place_meeting(x, y, slowmoCollider_obj)) {
			slowmo = false
			global.timeScale = 1;
		}
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
	sprite_index = playerVineDeathSprite;
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

//Radiatio
if (radiation > 80) {
	radiationHitTimer -= global.dt;
	if (radiationHitTimer < 0) {
		if (hp > 10) {
			hp -= 1;
			radiationHitTimer = radiationHitTimerSave;
			camera_obj.hitVignette = true;
			if (!audio_is_playing(moan1_snd) && !audio_is_playing(moan2_snd)) {
				audio_play_sound(choose(moan1_snd, moan2_snd), 1, false);
			}
		}
	}
}

if (!place_meeting(x, y, toxicwaste_obj)) {
	if (radiation > 1) {
		radiation -= global.dt / 24;
	} else {
		radiation = 0;
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
/*
if (!window_has_focus())
{
	movement = false;
	setMovAfterScreen = true;
}
else if (setMovAfterScreen)
{
	movement = true;
	setMovAfterScreen = false;
}*/

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
	if (!place_free(x + horspeed * global.dt, y) || place_meeting(x + horspeed * global.dt, y, colliderPlayerOnly_obj))
	{
		if (sign(horspeed) != 0)
		{
			while (place_free(x + sign(horspeed), y) && !place_meeting(x + sign(horspeed), y, colliderPlayerOnly_obj))
			{
				x += sign(horspeed);
			}
			if (!wallJumping)
			{
				horspeed = 0;
			}
			if (!grounded && verspeed > 0)
			{
				if (place_free(x, y + (verspeed * global.dt)) && !place_meeting(x, y + (verspeed * global.dt), colliderPlayerOnly_obj))
				{
					if (place_free(x, y - 16) && !place_meeting(x, y -16, colliderPlayerOnly_obj)) {
						if (!place_meeting(x, y, slowmoCollider_obj)) {
							huggingWall = true;
						}
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
		if (place_meeting(x + horspeed * global.dt, y, zombieGirlTutorial_obj)) {
			var nearEnemy = instance_place(x + horspeed * global.dt, y, zombieGirlTutorial_obj);
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
	
	x += horspeed * global.dt;

	//verspeed
	if (!place_free(x, y + verspeed * global.dt) || place_meeting(x, y + verspeed * global.dt, colliderPlayerOnly_obj))
	{
		if (sign(verspeed) != 0)
		{
			while (place_free(x, y + sign(verspeed)) && !place_meeting(x, y + sign(verspeed), colliderPlayerOnly_obj))
			{
				y += sign(verspeed);
			}
			if (place_free(x, y - 16) && !place_meeting(x, y - 16, colliderPlayerOnly_obj)) {
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
		if (place_meeting(x, y + verspeed * global.dt, zombieGirlTutorial_obj)) {
			var collidingEnemy = instance_place(x, y + verspeed * global.dt, zombieGirlTutorial_obj);
			collidingEnemy.verspeed = 0;
			verspeed = 0;
		}
	}
	
	y += verspeed * global.dt;
} else {
	x += horspeed * global.dt;
	y += verspeed * global.dt;
}