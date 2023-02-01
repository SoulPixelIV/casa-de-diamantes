/// @description Vars

//Movement
horspeed = 0;
verspeed = 0;
horspeedMax = 2;
verspeedMax = 8;
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
updowndir = 0; //Helper var for dircursor clamp

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
armSpriteShotgun = playerArmEmpty_spr;
armSpriteCurvedShotgun = playerArmCurved_spr;
spriteShotgun = shotgun_spr;

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

gravityStrength = 0;
dashDelay = 0;