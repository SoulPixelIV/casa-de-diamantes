//Movement
horspeed = 0;
verspeed = 0;
gravityStrength = -0.05;

hp = 35;
colliding = false;
hitable = true;
knockback = 0;
movSpeed = 0.85;
movSpeedGrad = 0;
moneyDropMin = 1;
moneyDropMax = 2;
damage = 16;
aggro = false;
damageCollision = false;
dir = 0;
checkedWaypoint = true;
usedLever = false;
useDelayTimer = 200;
gotSpawned = false;
playedSound = false;
flameSound = noone;
points = 75;

lastBullet = bulletPistol_obj;
ammoSpawnCount = 2;
attackInProg1 = false;
startFire = false;
attackInProg2 = false;
fireballInstance = noone;
attackCooldown = 180;
attackDelay1 = 450;
attackDelay2 = 700;
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

aggroTimerSave = aggroTimer;
deaggroTimerSave = deaggroTimer;
exclamationmarkTimerSave = exclamationmarkTimer;
useDelayTimerSave = useDelayTimer;
gravityStrengthSave = gravityStrength;

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