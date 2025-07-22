//if (live_call()) return live_result;

teleportTimer -= global.dt;

if (teleportTimer < 0) {
	room_goto(level_Casino);
}

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
	if (movement && !wallJumping && !isDashing) {
		horspeed = movSpeed
		if (!audio_is_playing(walk1_snd) && !audio_is_playing(walk2_snd) && grounded) {
			var walksnd = audio_play_sound(choose(walk1_snd, walk2_snd), 1, false);
			audio_sound_pitch(walksnd, random_range(0.9, 1.1));
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
		
if (grounded || isDashing)
{
	flip = false;
	flipUsed = false;
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
		dirCursor = 0
	}
	else
	{
		dirCursor = 0
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

//Weapon Switching
if (!isZombie && !reloading && !inCutscene && movement)
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

//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

spriteAnimation = image_index;
if (spriteAnimation > image_number)
{
	spriteAnimation = 0;
}

animationSpeed = 1.15;

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
dodgeRewardTimer -= global.dt;

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
		if (place_meeting(x + horspeed * global.dt, y, glassWall_obj)) {
			var nearEnemy = instance_place(x + horspeed * global.dt, y, glassWall_obj);
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
		if (place_meeting(x, y + verspeed * global.dt, glassWall_obj)) {
			var collidingEnemy = instance_place(x, y + verspeed * global.dt, glassWall_obj);
			collidingEnemy.verspeed = 0;
			verspeed = 0;
		}
	}
	
	y += verspeed * global.dt;
} else {
	x += horspeed * global.dt;
	y += verspeed * global.dt;
}