/// @description Vars

//Movement
horspeed = 0;
verspeed = 0;
movSpeed = 3.4 / 3.3;
movSpeedZombie = 1.8 / 3.3;
dashSpeed = 5.6 / 3.3;
wallJumps = 3;
animationSpeed = 1;

//Physics
gravityStrength = -0.05; //Lower is lower gravity
jumpStrength = 2.75;
frictionActive = true;
frictionStrength = 0.02; //Lower is more slippery
shotJumpStrength = 9.2 / 3.3;
fallJumpSafety = 9 / 3.3;

//Action
hp = 100;
syringes = 3;
zombieTimer = 550 * 3.3;
slowmoTimer = 400 * 3.3;
damageCooldown = 60 * 3.3;

//Effects
enemySlowmoTimer = 1.12 * 3.3;
shotZoomTimer = 1.75 * 3.3;

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
wallJumpTimer = 12 * 3.3;
groundCollisionTimer = 20 * 3.3;
groundCollisionTimerOn = false;
dashTimer = 12 * 3.3;
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

