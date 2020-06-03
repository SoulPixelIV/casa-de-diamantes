/// @description Vars

//Movement
horspeed = 0;
verspeed = 0;
movSpeed = 0.82;
movSpeedZombie = 0.54;
dashSpeed = 1.57;
wallJumps = 2;
dashDelay = 300;
animationSpeed = 1;

//Physics
gravityStrength = -0.03; //Lower is lower gravity
jumpStrength = 2.2;
frictionActive = true;
frictionStrength = 0.02; //Lower is more slippery
shotJumpStrength = 5;
fallJumpSafety = 3;
flipTiming = 10;
flipAvail = false;
flipUsed = false;

//Action
hp = 10;
syringes = 0;
zombieTimer = 1550;
slowmoTimer = 600;
damageCooldown = 400;
lastCheckpoint = noone;

//Effects
vignetteFlashTimer = 90;
shotZoomTimer = 8.75;
walljumpDustTimer = 12;
damageFlickerTimer = 17;

colliding = true;
infection = 0;
maxhp = hp;
syringesLost = 0;
savePosX = x;
savePosY = y;
movement = true;
invincible = false;
onLadder = false;
isZombie = false;
isDashing = false;
plagueTransformation = false;
shotZoom = false;
enemySlowmo = false;
enemyFlash = false;
currDir = 0;
fullJump = false;
jumping = false;
grounded = false;
crouching = false;
unarmed = true;
stoppedDashing = false;
flip = false;
spin = false;
wallJumping = false;
wallJumpingInAir = false;
wallJumpTimer = 45;
groundCollisionTimer = 20;
groundCollisionTimerOn = false;
dashTimer = 20;
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
landSoundPlayed = false;
deathActivated = false;
deathSlowmo = false;

//Help Vars
damageFlickerTimerSave = damageFlickerTimer;
walljumpDustTimerSave = walljumpDustTimer;
damageCooldownSave = damageCooldown;
fallJumpSafetySave = fallJumpSafety;
zombieTimerSave = zombieTimer;
wallJumpTimerSave = wallJumpTimer;
slowmoTimerSave = slowmoTimer;
wallJumpsSave = wallJumps;
dashTimerSave = dashTimer;
vignetteFlashTimerSave = vignetteFlashTimer;
shotZoomTimerSave = shotZoomTimer;
groundCollisionTimerSave = groundCollisionTimer;
flipTimingSave = flipTiming;
dashDelaySave = dashDelay;

//Second Dualbarettas arm
sprID = layer_sprite_create("BackgroundObjects", -1000, -1000, playerDualBarettas_spr);

//Debug
instance_create_layer(x + 1, y - 4, "Instances", playerBulletLine_obj);

