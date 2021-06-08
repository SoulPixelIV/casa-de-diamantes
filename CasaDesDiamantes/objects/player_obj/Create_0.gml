/// @description Vars

//Movement
horspeed = 0;
verspeed = 0;
horspeedMax = 2.4;
verspeedMax = 8;
movSpeed = 0.82;
movSpeedSave = movSpeed;
movSpeedZombie = 0.54;
dashSpeed = 1.23;
wallJumps = 3;
wallJumpsMax = wallJumps;
dashDelay = 300;
stillInAir = false;
animationSpeed = 1;
jumpType = 0;
inputMethod = 0; //0 -> Keyboard | 1 -> Controller
controllerDeadzone = 0.3;
controllerDirLastInput = 0;
playerRotation = 0;

//Physics
gravityStrength = -0.03; //Lower is lower gravity
gravityOn = true;
jumpStrength = 2;
frictionStrength = 0.015; //Lower is more slippery
shotJumpStrength = 4;
fallJumpSafety = 25; //Coyote Time
flipUsed = false;
onMovingPlatform = false;
onBooster = false;

//Action
hp = 100;
hpOld = hp;
zombieTimer = 1550;
slowmoTimer = 260;
damageCooldown = 400;
lastCheckpoint = noone;

//Effects
enemySlowMotionTimer = 100;
shotZoomTimer = 8.75;
walljumpDustTimer = 12;
damageFlickerTimer = 17;

sniperDamageValue = 0;
sniperDamageValueMax = 500;
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
landSoundPlayed = false;
slowmoSoundPlayed = false;
deathActivated = false;
deathSlowmo = false;
firstPosX = x;
firstPosY = y;
spriteAnimation = 0;
setMovAfterScreen = false;

if (global.unlockedWeapon[0] == true || global.unlockedWeapon[1] == true || global.unlockedWeapon[2] == true)
{
	unarmed = false;
}
else
{
	unarmed = true;
}

//Help Vars
damageFlickerTimerSave = damageFlickerTimer;
walljumpDustTimerSave = walljumpDustTimer;
damageCooldownSave = damageCooldown;
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

//Accessories
theta = 0;

originX = player_obj.x;
originY = player_obj.y;

radius = point_distance(originX, originY, x, y - 20);

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
instance_create_layer(x + 1, y - 4, "Instances", playerBulletLine_obj);

global.spawn = 0;

gravityStrength = 0;