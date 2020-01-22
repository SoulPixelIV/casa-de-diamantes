/// @description Vars

//Movement
horspeed = 0;
verspeed = 0;
movSpeed = 3.4;
movSpeedZombie = 1.8;
dashSpeed = 5.6;
wallJumps = 3;

//Physics
gravityStrength = -0.22; //Lower is lower gravity
jumpStrength = 8;
frictionActive = true;
frictionStrength = 0.3; //Lower is more slippery
shotJumpStrength = 9.2;
fallJumpSafety = 9;

//Action
hp = 100;
syringes = 3;
zombieTimer = 550;
slowmoTimer = 400;
damageCooldown = 60;

//Effects
enemySlowmoTimer = 1.12;
shotZoomTimer = 1.75;


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
grounded = false;
crouching = false;
unarmed = true;
stoppedDashing = false;
flip = false;
spin = false;
wallJumping = false;
wallJumpingInAir = false;
wallJumpTimer = 12;
groundCollisionTimer = 20;
groundCollisionTimerOn = false;
dashTimer = 12;
slowmo = false;
spinWeaponPos = 0;
spinWeaponDir = 0;
damageRecieved = false;
huggingWall = false;
dirCursor = 0;
lightStrength = 0;
lightSize = 0;

//Help Vars
damageCooldownSave = damageCooldown;
fallJumpSafetySave = fallJumpSafety;
zombieTimerSave = zombieTimer;
wallJumpTimerSave = wallJumpTimer;
slowmoTimerSave = slowmoTimer;
wallJumpsSave = wallJumps;
dashTimerSave = dashTimer;
enemySlowmoTimerSave = enemySlowmoTimer;
shotZoomTimerSave = shotZoomTimer;
groundCollisionTimerSave = groundCollisionTimer;

//Debug
instance_create_layer(x + 1, y - 4, "Instances", playerBulletLine_obj);

