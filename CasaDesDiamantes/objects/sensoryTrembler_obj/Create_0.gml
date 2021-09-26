sprite_index = sensoryTremblerBase_spr;

//Movement
horspeed = 0;
verspeed = 0;

//Stats
colliding = true;
hitable = true;
level = 1;
moneyDropMin = 1;
moneyDropMax = 4;
damage = 23;
knockback = 0;
gotSpawned = false;
points = 1500;

alarmLight = noone;
turretRotDir = 0;
randMovDir = 1;
randDirChangeTimer = 150;
shootDelay = 5;
smokeDelay = 4;
smokeDelay2 = 3;
walkspeedSound = 28;
eyeKilled = false;
explosionCount = 0;
explosionDelay = 2;
secondPhase = false;
slamDelay = 200;
pauseDelay = 100;
pause = false;
slamPos = 0;
slam = false;
slamSprite = false;
initialShootDelay = 100;
lastBullet = bulletPistol_obj;
ammoSpawnCount = 4;
animationSpeed = 0.75;
baseRotation = 0;
rotDir = 0;
savePosX = x;
savePosY = y;
attackCooldown = 700;
delay = false;
isDashing = false;
attackDelay = 50;
boostSpeed = 2.05;
attackInProg = false;
attackInProg2 = false;
attackInProg3 = false;
startDrill = false;
dashed = false;
damageCollision = false;
spawnedHitbox = false;
points = 125;
movSpeed = 0.41;
movement = true;
gravityStrength = -0.05;
damageTint = false;
damageTintHeadshot = false;
damageTintTimer = 15;
headshot = false;
aggro = false;
aggroTimer = 130;
deaggroTimer = 2000;
exclamationmarkTimer = 250;

//Help Vars
aggroTimerSave = aggroTimer;
deaggroTimerSave = deaggroTimer;
exclamationmarkTimerSave = exclamationmarkTimer;
attackCooldownSave = attackCooldown;
attackDelaySave = attackDelay;
damageTintTimerSave = damageTintTimer;
gravityStrengthSave = gravityStrength;
randDirChangeTimerSave = randDirChangeTimer;
initialShootDelaySave = initialShootDelay;
slamDelaySave = slamDelay;
pauseDelaySave = pauseDelay;

//Create Emitter
emitter = audio_emitter_create();
audio_max_distance = 800;
audio_drop_start = 400;

audio_falloff_set_model(audio_falloff_linear_distance);
audio_emitter_position(emitter, x, y, 0);
audio_emitter_falloff(emitter, audio_drop_start, audio_max_distance, 1);

checkPlayerTimer = 50;
checkPlayerTimerSave = checkPlayerTimer;
checkPlayerTimer = 0;
gravityStrength = 0;

shieldLeft = noone;
shieldRight = noone;
