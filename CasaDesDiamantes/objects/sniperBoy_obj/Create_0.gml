/// @description Vars

//Movement
horspeed = 0;
verspeed = 0;

//Stats
hp = 110;
colliding = true;
hitable = true;
frozen = false;
freezeRes = 1;
moneyDropTimer = 95;
level = 1;
damageRes = 1;
damage = 0;
knockback = 0;
playerSightMax = 128;
playerSightMin = 32;
gotSpawned = false;
turnDelay = 130;
turnDelayStart = false;
icecicleAttackTimer = 200;

lastBullet = bulletPistol_obj;
ammoSpawnCount = 8;
animationSpeed = 0.5;
savePosX = x;
savePosY = y;
attackCooldown = 300;
delay = false;
isDashing = false;
attackDelay = 50;
boostSpeed = 2.05;
attackInProg = false;
attackInProg2 = false;
dashed = false;
damageCollision = false;
spawnedHitbox = false;
points = 500;
movSpeed = 0.4;
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
moneyDropTimerSave = moneyDropTimer;
turnDelaySave = turnDelay;
movSpeedSave = movSpeed;

checkPlayerTimer = 50;
checkPlayerTimerSave = checkPlayerTimer;
checkPlayerTimer = 0;
gravityStrength = 0;

blend = image_blend;

//Create Emitter
emitter = audio_emitter_create();
audio_max_distance = 400;
audio_drop_start = 150;

audio_falloff_set_model(audio_falloff_linear_distance);
audio_emitter_position(emitter, x, y, 0);
audio_emitter_falloff(emitter, audio_drop_start, audio_max_distance, 1);

spawnDelay = 54;
alarm[0] = spawnDelay;

alarmLight = instance_create_layer(x, y, "GraphicsLayer", spotlightYellowSmall_obj); 

with (alarmLight)
{
	body = instance_nearest(x, y, sniperBoy_obj);
}
