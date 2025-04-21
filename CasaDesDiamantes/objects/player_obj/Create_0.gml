/// @description Vars

//Save Game
save_scr();

//Movement
horspeed = 0;
verspeed = 0;
horspeedMax = 1.8;
verspeedMax = 7;
movSpeed = 0.82;
movSpeedSave = movSpeed;
movSpeedZombie = 0.54;
dashSpeed = 0.65; //1.23 before rework
wallJumps = 3;
wallJumpsMax = wallJumps;
otherDirWallHugTimer = 24; //Amount of time player needs to hold other direction key to let go of wall
dashDelay = 300;
dashInvincibility = 120;
dashInvincibilityOn = false;
dashStartDelay = 50;
dashStandupDelay = 13; //Delay until jump gets recognized after dash has started
dashStandupDelayStart = false;
crouchRollTimer = 55; //120 before rework
dashroll = false;
dashjumpbuffer = false;
crouchslide = false;
reachedGroundOnce = false; //True if crouchroll was already activated for this specific dash
crouchDir = 1;
crouchDirSet = false;
stillInAir = false;
animationSpeed = 1;
jumpType = 0;
inputMethod = 0; //0 -> Keyboard | 1 -> Controller
controllerDeadzone = 0.3;
controllerDirLastInput = 0;
playerRotation = 0;
radiation = 0;
flamethrowerLoad = 0;
flamethrowerOn = false;
flameBurstOn = false;
flamethrowerTimer = 700;
updowndir = 0; //Helper var for dircursor clamp
muteSoundTimer = 400; //Mute player soundeffects when spawning
sittingInMinecart = false;

//Physics
gravityStrength = -0.03; //Lower is lower gravity
gravityOn = true;
inCutscene = false;
shootingAllowed = true;
jumpStrength = 2.4; //2 before rework
frictionStrength = 0.015; //Lower is more slippery
shotJumpStrength = 4;
fallJumpSafety = 25; //Coyote Time
flipUsed = false;
onMovingPlatform = false;
onBooster = false;
boosterLockedMovement = false;
boosterLockedMovementTimer = 50;

//Action
hp = 100;
hpOld = hp;
zombieTimer = 1550;
slowmoTimer = 260;
damageCooldown = 200;
jumpspinAim = true;
jumpspinAimTimer = 70;
shotgunX = 0;
shotgunY = 0;
shotgunArmX = 0;
shotgunArmY = 0;
shotgunArmCurvedX = 0;
shotgunArmCurvedY = 0;
dodgeRewardTimer = 17;

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

//Effects
enemySlowMotionTimer = 100;
activateTrailEffect = false;
trailDensity = 1;
shotZoomTimer = 8.75;
walljumpDustTimer = 12;
dashDustTimer = 18;
dashDustEndTimer = 75;
damageFlickerTimer = 17;
blackborderPauseTimer = 1200;
blackborderPause = false;
camFollowTarget = noone;
glitterTimer = random_range(125,500);

inChamber = false;
createDeathChunks = false;
radiationHitTimer = 35;
sniperDamageValue = 0;
sniperDamageValueMax = 500;
bowDamageValue = 1;
bowDamageValueMax = 10;
bowReadying = false;
bowReadyingImage = 0;
shotgunPumpDone = false;
colliding = true;
reloading = false;
infection = 0;
startShotCooldown = true;
maxhp = hp;
syringesLost = 0;
savePosX = x;
savePosY = y;
movement = true;
invincible = false;
onLadder = false;
onSpringLadder = false;
onSpringLadderDelay = 100;
isZombie = false;
isDashing = false;
inPlayerpoint = false;
plagueTransformation = false;
shotZoom = false;
enemySlowmo = false;
currDir = 0;
fullJump = false;
jumping = false;
grounded = false;
crouching = false;
stoppedDashing = false;
flip = false;
spin = false;
wallJumping = false;
wallJumpingInAir = false;
wallJumpTimer = 45;
groundCollisionTimer = 20;
groundCollisionTimerOn = false;
slowmo = false;
spinWeaponPos = 0;
spinWeaponDir = 0;
setWallDir = false;
damageRecieved = false;
huggingWall = false;
dirCursor = 0;
lightStrength = 0;
lightSize = 0;
shortJump = false;
createdParticles = false;
invincibleHitCooldown = 70;
landSoundPlayed = false;
slowmoSoundPlayed = false;
deathActivated = false;
deathSlowmo = false;
firstPosX = x;
firstPosY = y;
spriteAnimation = 0;
setMovAfterScreen = false;
selWeapon = 1;
scrollDelay = 20;
startScrollDelay = false;
playedSoundBowReadying = false;
laserAimImage = 0;
armSpriteShotgun = playerArmEmptyWalking_spr;
armSpriteCurvedShotgun = playerArmCurved_spr;
spriteShotgun = shotgun_spr;
spriteMP = silencedMP_spr;
pauseDelay = 200;
pauseDelayStart = false;

//Debug
forceSlowmo = false;

key_jump = noone;
key_shoot = noone;
key_lastWeapon = noone;
key_up_pressed = noone;
key_down = noone;
key_down_pressed = noone;

if (global.unlockedWeapon[0] == true || global.unlockedWeapon[1] == true || global.unlockedWeapon[2] == true)
{
	unarmed = false;
}
else
{
	unarmed = true;
}

//Create Dropshadow
if (!instance_exists(dropShadow_obj)) {
	instance_create_layer(x, y + 26, "BackgroundObjects", dropShadow_obj);
}

//Set Blackscreen Strength
blackscreenStartTimer = 300;
blackscreenDone = false;
camera_obj.blackscreenStrength = 1;

//Help Vars
damageFlickerTimerSave = damageFlickerTimer;
walljumpDustTimerSave = walljumpDustTimer;
dashDustTimerSave = dashDustTimer;
dashDustEndTimerSave = dashDustEndTimer;
damageCooldownSave = damageCooldown;
dashInvincibilitySave = dashInvincibility;
onSpringLadderDelaySave = onSpringLadderDelay;
fallJumpSafetySave = fallJumpSafety;
zombieTimerSave = zombieTimer;
wallJumpTimerSave = wallJumpTimer;
slowmoTimerSave = slowmoTimer;
wallJumpsSave = wallJumps;
enemySlowMotionTimerSave = enemySlowMotionTimer;
shotZoomTimerSave = shotZoomTimer;
groundCollisionTimerSave = groundCollisionTimer;
dashDelaySave = dashDelay;
gravityStrengthSave = gravityStrength;
scrollDelaySave = scrollDelay;
radiationHitTimerSave = radiationHitTimer;
blackborderPauseTimerSave = blackborderPauseTimer;
invincibleHitCooldownSave = invincibleHitCooldown;
trailDensitySave = trailDensity;
jumpspinAimTimerSave = jumpspinAimTimer;
crouchRollTimerSave = crouchRollTimer;
dashStartDelaySave = dashStartDelay;
boosterLockedMovementTimerSave = boosterLockedMovementTimer;
dashStandupDelaySave = dashStandupDelay;
otherDirWallHugTimerSave = otherDirWallHugTimer;
pauseDelaySave = pauseDelay;
flamethrowerTimerSave = flamethrowerTimer;
dodgeRewardTimerSave = dodgeRewardTimer;

partX = 0;
partY = 0;
partX2 = 0;
partY2 = 0;
flameSound1 = noone;
flameSound2 = noone;
flameSound3 = noone;

//Accessories
theta = 0;

originX = player_obj.x;
originY = player_obj.y;

radius = point_distance(originX, originY, x, y - 20);
radiusTop1 = point_distance(originX, originY, x, y);

//Second Dualbarettas arm
sprID = layer_sprite_create("BackgroundObjects", -1000, -1000, playerDualBarettas_spr);

//Audio
audio_listener_orientation(0,0,1000,0,-1,0);

//Create Light
if (!instance_exists(spotlightPlayer_obj))
{
	instance_create_layer(x, y, "GraphicsLayer", spotlightPlayer_obj);
}

//Debug
instance_create_layer(x + 4 * currDir, y - 8, "Instances", playerBulletLine_obj);

global.spawn = 0;

//Check for Spawnpoint
if (global.lastCheckpoint != noone) {
	if (instance_exists(global.lastCheckpoint)) {
		x = global.lastCheckpoint.x;
		y = global.lastCheckpoint.y - 64;
	}
}

if (global.cupyUpgrade1) {
	if (!instance_exists(cutieplusSteph_obj)) {
		instance_create_layer(x - 21, y - 21, "Instances", cutieplusSteph_obj);
	}
}

gravityStrength = 0;
dashDelay = 0;

//Particle System
partEmitterPlayer = part_emitter_create(global.partSystem);