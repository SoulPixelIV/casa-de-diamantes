/// @description Vars

//Movement
horspeed = 0;
verspeed = 0;

//Stats
hp = 0;
colliding = true;
hitable = true;
level = 1;
moneyDropMin = 2;
moneyDropMax = 3;
damage = 23;
knockback = 0;
gotSpawned = false;
lostArm = false;
spawnedArm = false;
playedSound = false;
idleSoundDelay = 1600;

lastBullet = bulletPistol_obj;
ammoSpawnCount = 4;
animationSpeed = 0.75;
savePosX = x;
savePosY = y;
attackCooldown = 250;
delay = false;
isDashing = false;
attackDelay = 50;
boostSpeed = 2.05;
attackInProg = false;
attackInProg2 = false;
startDrill = false;
dashed = false;
damageCollision = false;
spawnedHitbox = false;
hitboxFlowerAttack = noone;
points = 125;
movSpeed = 0.41;
movement = true;
gravityStrength = -0.05;
damageTint = false;
attackTint = false;
damageTintHeadshot = false;
damageTintTimer = 15;
attackTintTimer = 15;
attackTintDelay = 10;
headshot = false;
aggro = false;
aggroTimer = 130;
deaggroTimer = 3000;
exclamationmarkTimer = 250;
noCollision = false;
noGravity = false;
checkForPlayerPosTimer = 650; //Occasionally check for player pos for stage jumping
stageTeleportTimer = 120 + random_range(-30, 30); //Timer until stage jump starts
jumpToNewDest = false; //True while stage jumping happens
spawnedStageJumpAnimation = false;
newDestPosX = x;
newDestPosY = y;
attack1PrepareTimer = 100; //Timer before snap attack begins
attack1StopTimer = 100; //Timer after snap attack begins
snapAttack = false; //Snap Attack is happening
testX = 0;
testY = 0;
attack2PrepareTimer = 70; //Timer before snap attack begins
attack2StopTimer = 100; //Timer after snap attack begins
snapAttack2 = false; //Snap Attack is happening

snapHitboxDelay = 45; //Delay until damage hitbox spawns
snapHitbox2Delay = 45; //Delay until damage hitbox spawns

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
snapHitbox2DelaySave = snapHitbox2Delay;
idleSoundDelaySave = idleSoundDelay;

blend = image_blend;

checkPlayerTimer = 50;
checkPlayerTimerSave = checkPlayerTimer;
checkPlayerTimer = 0;
gravityStrength = 0;
