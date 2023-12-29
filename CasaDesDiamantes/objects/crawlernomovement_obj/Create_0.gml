//Movement
horspeed = 0;
verspeed = 0;
gravityStrength = -0.05;

hp = 99999999;
damageRes = 1;
colliding = false;
hitable = true;
frozen = false;
freezeRes = 1;
knockback = 0;
movSpeed = 1.21;
movSpeedGrad = 0;
moneyDropMin = 1;
moneyDropMax = 2;
damage = 16;
aggro = false;
damageCollision = false;
damageTint = false;
damageTintTimer = 15;
dir = 0;
checkedWaypoint = true;
usedLever = false;
useDelayTimer = 200;
gotSpawned = false;
playedSound = false;
flameSound = noone;
points = 75;
icecicleAttackTimer = 200;

damageTint = false;
attackTint = false;
damageTintTimer = 15;
attackTintTimer = 15;
attackTintDelay = 10;

attack1PrepareTimer = 100; //Timer before snap attack begins

checkForPlayerPosTimer = 650; //Occasionally check for player pos for stage jumping
stageTeleportTimer = 120 + random_range(-30, 30); //Timer until stage jump starts
jumpToNewDest = false; //True while stage jumping happens
spawnedStageJumpAnimation = false;
newDestPosX = x;
newDestPosY = y;

lastBullet = bulletPistol_obj;
ammoSpawnCount = 2;
attackInProg1 = false;
attackInProg2 = false;
fireballInstance = noone;
attackCooldown = 320;
attackDelay1 = 800;
attackDelay2 = 350;
delay1 = false;
delay2 = false;
aggro = false;
aggroTimer = 130;
deaggroTimer = 3000;
exclamationmarkTimer = 250;
dmgHitbox = noone;

light = noone;
hitbox = noone;

attackCooldownSave = attackCooldown;
attackDelay1Save = attackDelay1;
attackDelay2Save = attackDelay2;

damageTintTimerSave = damageTintTimer;
aggroTimerSave = aggroTimer;
deaggroTimerSave = deaggroTimer;
exclamationmarkTimerSave = exclamationmarkTimer;
useDelayTimerSave = useDelayTimer;
gravityStrengthSave = gravityStrength;
checkForPlayerPosTimerSave = checkForPlayerPosTimer;
stageTeleportTimerSave = stageTeleportTimer;
movSpeedSave = movSpeed;

attack1PrepareTimerSave = attack1PrepareTimer;

damageTintTimerSave = damageTintTimer;
attackTintTimerSave = attackTintTimer;
attackTintDelaySave = attackTintDelay;
attackTintDelay = -1;

blend = image_blend;

animationSpeed = 0.5;

if (instance_exists(waypoint))
{
	checkedWaypoint = false;
}

checkPlayerTimer = 50;
checkPlayerTimerSave = checkPlayerTimer;
checkPlayerTimer = 0;
gravityStrength = 0;

savePosX = x;
savePosY = y;

//Create Emitter
emitter = audio_emitter_create();
audio_max_distance = 500;
audio_drop_start = 180;

audio_falloff_set_model(audio_falloff_linear_distance);
audio_emitter_position(emitter, x, y, 0);
audio_emitter_falloff(emitter, audio_drop_start, audio_max_distance, 1);