/// @description Vars

lastBullet = bulletPistol_obj;
ammoSpawnCount = 4;
horspeed = 0;
verspeed = 0;
colliding = true;
hitable = true;
level = 1;
moneyDropMin = 3;
moneyDropMax = 7;
attackCooldown = 800;
damage = 0;
damageCollision = false;
points = 125;
knockback = 0;
movSpeed = 0.19;
turnDelay = 40;
turn = false;
playedSound = false;
movement = true;
gravityStrength = -0.05;
aggro = false;
aggroTimer = 130;
deaggroTimer = 800;
exclamationmarkTimer = 250;
turnDir = 1;
dir = 0;
defenseEnemy = noone;
gotSpawned = false;

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
damageTintHeadshot = false;
damageTintTimer = 15;
lineFlashTimer = 10;
lineColor = c_yellow;
animationSpeed = 1;
headshot = false;

aggroTimerSave = aggroTimer;
deaggroTimerSave = deaggroTimer;
exclamationmarkTimerSave = exclamationmarkTimer;
attackCooldownSave = attackCooldown;
damageTintTimerSave = damageTintTimer;
lineFlashTimerSave = lineFlashTimer;
turnDelaySave = turnDelay;
gravityStrengthSave = gravityStrength;

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

//Create shield hitboxes
shieldLeft = instance_create_layer(x - 32, y - 20, "Instances", colliderOnlyBullet_obj);
shieldRight = instance_create_layer(x + 32, y - 20, "Instances", colliderOnlyBullet_obj);
shieldLeft.image_xscale = 0.25;
shieldRight.image_xscale = 0.25;
shieldLeft.image_yscale = 1.5;
shieldRight.image_yscale = 1.5;
