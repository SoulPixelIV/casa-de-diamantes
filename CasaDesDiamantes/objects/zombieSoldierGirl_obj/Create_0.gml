/// @description Vars

lastBullet = bulletPistol_obj;
ammoSpawnCount = 4;
horspeed = 0;
verspeed = 0;
DistFromPlayer = 150;
colliding = true;
hitable = true;
frozen = false;
freezeRes = 2;
burnt = false;
burnRes = 4;
burnTimer = 75;
level = 1;
damageRes = 1;
moneyDropMin = 3;
moneyDropMax = 6;
attackCooldown = 350;
damage = 0;
damageCollision = false;
points = 215;
knockback = 0;
movSpeed = 0.43;
turnDelay = 7;
turn = false;
playedSound = false;
movement = true;
gravityStrength = -0.05;
aggro = false;
aggroTimer = 130;
deaggroTimer = 800;
groundSafeZone = 48;
exclamationmarkTimer = 250;
turnDir = 1;
dir = 0;
gotSpawned = false;
playerPosRandOffsetX = random_range(-148, 148);
playerPosRandOffsetY = random_range(-148, 148);
icecicleAttackTimer = 200;
changeFlyPosTimer = random_range(345, 655);
changeFlyPosTimerSave = changeFlyPosTimer;
buffed = false;
buffApplied = false;
buffTimer = 3200;
buffScale = 1;
buffDir = 1;
buffTimerSave = buffTimer;
randBuffDelay = choose(20, 300);
damageSave = damage;

if (instance_exists(player_obj))
{
	playerPosX = player_obj.x;
	playerPosY = player_obj.y;
}
else
{
	playerPosX = 0;
	playerPosY = 0;
}
savePosX = x;
savePosY = y;
randAttack = 1;
attackInProg1 = false;
attackInProg2 = false;
damageTint = false;
attackTint = false;
damageTintHeadshot = false;
damageTintTimer = 15;
attackTintTimer = 15;
attackTintDelay = 10;
lineFlashTimer = 10;
lineColor = c_yellow;
animationSpeed = 1;
headshot = false;

aggroTimerSave = aggroTimer;
deaggroTimerSave = deaggroTimer;
exclamationmarkTimerSave = exclamationmarkTimer;
attackCooldownSave = attackCooldown;
damageTintTimerSave = damageTintTimer;
attackTintTimerSave = attackTintTimer;
attackTintDelaySave = attackTintDelay;
attackTintDelay = -1;
lineFlashTimerSave = lineFlashTimer;
turnDelaySave = turnDelay;
gravityStrengthSave = gravityStrength;
movSpeedSave = movSpeed;
hpSave = hp;
freezeResSave = freezeRes;
burnTimerSave = burnTimer;
randBuffDelaySave = randBuffDelay;

image_yscale = -1;
blend = image_blend;
initalDir = image_xscale;

//Create Emitter
emitter = audio_emitter_create();
audio_max_distance = 800;
audio_drop_start = 400;

audio_falloff_set_model(audio_falloff_linear_distance);
audio_emitter_position(emitter, x, y, 0);
audio_emitter_falloff(emitter, audio_drop_start, audio_max_distance, 1);

//snd = audio_play_sound_on(emitter, jetpack_snd, true, 1);

checkPlayerTimer = 50;
checkPlayerTimerSave = checkPlayerTimer;
checkPlayerTimer = 0;
gravityStrength = 0;

//Particle System
partEmitter = part_emitter_create(global.partSystem);