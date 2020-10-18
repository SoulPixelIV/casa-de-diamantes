/// @description Vars

//Movement
horspeed = 0;
verspeed = 0;
horspeedMax = 2.4;
verspeedMax = 7;
movSpeed = 0.82;
movSpeedSave = movSpeed;
movSpeedZombie = 0.54;
dashSpeed = 1.23;
wallJumps = 2;
dashDelay = 300;
animationSpeed = 1;
jumpType = 0;

//Physics
gravityStrength = -0.03; //Lower is lower gravity
jumpStrength = 2;
frictionActive = true;
frictionStrength = 0.02; //Lower is more slippery
shotJumpStrength = 4;
fallJumpSafety = 25;
flipUsed = false;

//Action
hp = 100;
syringes = 1;
zombieTimer = 1550;
slowmoTimer = 260;
damageCooldown = 400;
lastCheckpoint = noone;

//Effects
enemySlowMotionTimer = 65;
shotZoomTimer = 8.75;
walljumpDustTimer = 12;
damageFlickerTimer = 17;

colliding = true;
reloading = false;
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
firstPosX = x;
firstPosY = y;

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
enemySlowMotionTimerSave = enemySlowMotionTimer;
shotZoomTimerSave = shotZoomTimer;
groundCollisionTimerSave = groundCollisionTimer;
dashDelaySave = dashDelay;

//Second Dualbarettas arm
sprID = layer_sprite_create("BackgroundObjects", -1000, -1000, playerDualBarettas_spr);

//Audio
audio_listener_orientation(1,0,0,0,0,1);

//Create Light
if (!instance_exists(spotlightPlayer_obj))
{
	instance_create_layer(x, y, "GraphicsLayer", spotlightPlayer_obj);
}

//Debug
instance_create_layer(x + 1, y - 4, "Instances", playerBulletLine_obj);

