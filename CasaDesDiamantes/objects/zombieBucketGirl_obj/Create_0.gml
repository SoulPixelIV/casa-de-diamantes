/// @description Vars

horspeed = 0;
verspeed = 0;
attackCooldown = 200;
attackDelay = 50;
colliding = true;
hitable = true;
frozen = false;
freezeRes = 12;
burnt = false;
burnRes = 4;
burnTimer = 75;
level = 2;
damageRes = 1;
damageAttack1 = 25;
moneyDropMin = 8;
moneyDropMax = 14;
knockback = 0;
randAttack = 1;
gotSpawned = false;
icecicleAttackTimer = 200;

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
buffed = false;
buffApplied = false;
buffTimer = 3200;
buffScale = 1;
buffDir = 1;
buffTimerSave = buffTimer;
randBuffDelay = choose(20, 300);
hpSave = hp;

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
movSpeedSave = movSpeed;
freezeResSave = freezeRes;
damageSave = damageAttack1;
randBuffDelaySave = randBuffDelay;
burnTimerSave = burnTimer;

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

//Create Emitter
emitter = audio_emitter_create();
audio_max_distance = 400;
audio_drop_start = 150;

audio_falloff_set_model(audio_falloff_linear_distance);
audio_emitter_position(emitter, x, y, 0);
audio_emitter_falloff(emitter, audio_drop_start, audio_max_distance, 1);

//Particle System
partEmitter = part_emitter_create(global.partSystem);