/// @description Vars

horspeed = 0;
verspeed = 0;
attackCooldown = 200;
attackDelay = 50;
colliding = true;
hitable = true;
level = 2;
damageAttack1 = 25;
moneyDropMin = 3;
moneyDropMax = 6;
knockback = 0;
randAttack = 1;
gotSpawned = false;

switchedSprite = false;

randAttack = 1;
lastBullet = bulletPistol_obj;
ammoSpawnCount = 7;
animationSpeed = 0.5;
bucketRemoved = false;
delay = false;
damageCollision = false;
attackInProg1 = false;
attackInProg2 = false;
hitboxFlowerAttack = noone;
points = 430;
movSpeed = 0.41;
playedSound = false;
gravityStrength = -0.05;
movement = true;
savePosX = x;
savePosY = y;
damageTint = false;
attackTint = false;
damageTintTimer = 15;
attackTintTimer = 15;
attackTintDelay = 10;
headshot = false;
aggro = false;
aggroTimer = 130;
deaggroTimer = 3000;
exclamationmarkTimer = 250;

checkForPlayerPosTimer = 650; //Occasionally check for player pos for stage jumping
stageTeleportTimer = 120 + random_range(-30, 30); //Timer until stage jump starts
jumpToNewDest = false; //True while stage jumping happens
spawnedStageJumpAnimation = false;
newDestPosX = x;
newDestPosY = y;

attack1PrepareTimer = 75; //Timer before snap attack begins
attack1StopTimer = 50; //Timer after snap attack begins
snapAttack = false; //Snap Attack is happening

attack2PrepareTimer = 150; //Timer before snap attack begins
attack2StopTimer = 125; //Timer after snap attack begins
roseAttack = false; //Rose Attack is happening

snapHitboxDelay = 35; //Delay until damage hitbox spawns

//Help Vars
aggroTimerSave = aggroTimer;
deaggroTimerSave = deaggroTimer;
exclamationmarkTimerSave = exclamationmarkTimer;
attackCooldownSave = attackCooldown;
attackDelaySave = attackDelay;
damageTintTimerSave = damageTintTimer;
attackTintTimerSave = attackTintTimer;
attackTintDelaySave = attackTintDelay;
attackTintDelay = -1;
gravityStrengthSave = gravityStrength;
checkForPlayerPosTimerSave = checkForPlayerPosTimer;
stageTeleportTimerSave = stageTeleportTimer;

attack1PrepareTimerSave = attack1PrepareTimer;
attack1StopTimerSave = attack1StopTimer;
snapHitboxDelaySave = snapHitboxDelay;

attack2PrepareTimerSave = attack2PrepareTimer;
attack2StopTimerSave = attack2StopTimer;

blend = image_blend;

checkPlayerTimer = 50;
checkPlayerTimerSave = checkPlayerTimer;
checkPlayerTimer = 0;
gravityStrength = 0;
