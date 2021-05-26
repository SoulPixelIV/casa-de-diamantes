/// @description Vars

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

lastBullet = bulletPistol_obj;
ammoSpawnCount = 4;
animationSpeed = 0.5;
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
hitboxDrill = noone;
points = 125;
movSpeed = 0.15;
movement = true;
gravityStrength = -0.05;
damageTint = false;
damageTintHeadshot = false;
damageTintTimer = 15;
headshot = false;
aggro = false;
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

headshotHitbox = instance_create_layer(x, y - 16, "Instances", headshotHitbox_obj);
with (headshotHitbox)
{
	body = instance_nearest(x, y, zombieGirl_obj);
}

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
