sprite_index = sensoryTremblerBase_spr;

//Movement
horspeed = 0;
verspeed = 0;

//Stats
colliding = true;
level = 1;
moneyDropMin = 1;
moneyDropMax = 4;
damage = 23;
knockback = 0;

turretRotation = 90;
turretRotationDest = turretRotation;
turretRotDir = 0;
randMovDir = 1;
randDirChangeTimer = 150;
lastBullet = bulletPistol_obj;
ammoSpawnCount = 4;
animationSpeed = 0.75;
baseRotation = 0;
rotDir = 0;
savePosX = x;
savePosY = y;
attackCooldown = 800;
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
points = 125;
movSpeed = 0.32;
movement = true;
gravityStrength = -0.05;
damageTint = false;
damageTintHeadshot = false;
damageTintTimer = 15;
headshot = false;
aggro = true;
aggroTimer = 130;
deaggroTimer = 3000;
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

//Create Emitter
emitter = audio_emitter_create();
audio_max_distance = 800;
audio_drop_start = 400;

audio_falloff_set_model(audio_falloff_linear_distance);
audio_emitter_position(emitter, x, y, 0);
audio_emitter_falloff(emitter, audio_drop_start, audio_max_distance, 1);

//Create Collider
//colHitbox = instance_create_layer(x - 48, y - 126, "Instances", colliderNoEnemy_obj);
//colHitbox.image_xscale = 2.5;
//colHitbox.image_yscale = 2;

checkPlayerTimer = 50;
checkPlayerTimerSave = checkPlayerTimer;
checkPlayerTimer = 0;
gravityStrength = 0;

