/// @description Vars

event_inherited();
polygon = polygon_from_instance(id);

horspeed = 0;
verspeed = 0;
hp = 100;
infection = 0;
maxhp = hp;
syringes = 3;
syringesLost = 0;
movSpeed = 3.4;
dashSpeed = 5.6;
wallJumps = 3;
savePosX = x;
savePosY = y;
frictionActive = true;
movSpeedZombie = 1.8;
zombieTimer = 550;
slowmoTimer = 400;
gravityStrength = -0.42;
jumpStrength = 7.6;
shotJumpStrength = 9.2;
frictionStrength = 0.3; //Lower is more slippery
fallJumpSafety = 9;
damageCooldown = 60;
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
dashTimer = 12;
slowmo = false;
spinWeaponPos = 0;
spinWeaponDir = 0;
damageRecieved = false;
damageCooldownSave = damageCooldown;
fallJumpSafetySave = fallJumpSafety;
zombieTimerSave = zombieTimer;
wallJumpTimerSave = wallJumpTimer;
slowmoTimerSave = slowmoTimer;
wallJumpsSave = wallJumps;
dashTimerSave = dashTimer;
enemySlowmoTimer = 1.07;
enemySlowmoTimerSave = enemySlowmoTimer;
shotZoomTimer = 1.75;
shotZoomTimerSave = shotZoomTimer;
huggingWall = false;
dirCursor = 0;
lightStrength = 0;
lightSize = 0;

instance_create_layer(x + 1, y - 4, "Instances", playerBulletLine_obj);

