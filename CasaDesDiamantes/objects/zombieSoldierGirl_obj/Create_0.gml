/// @description Vars

horspeed = 0;
verspeed = 0;
playerSightMax = 256;
playerSightMin = 32;
hp = 85;
colliding = true;
level = 1;
moneyDropMin = 3;
moneyDropMax = 7;
attackCooldown = 140;
damage = 0;
damageCollision = false;
points = 125;
knockback = 0;
movSpeed = 0.08;
playedSound = false;
movement = true;
gravityStrength = -0.05;
dir = 0;
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

attackCooldownSave = attackCooldown;
damageTintTimerSave = damageTintTimer;
lineFlashTimerSave = lineFlashTimer;

headshotHitbox = instance_create_layer(x, y - 16, "Instances", headshotHitbox_obj);
with (headshotHitbox)
{
	body = instance_nearest(x, y, zombieSoldierGirl_obj);
}

//Create Emitter
emitter = audio_emitter_create();
audio_max_distance = 300;
audio_drop_start = 200;

audio_falloff_set_model(audio_falloff_linear_distance);
audio_emitter_position(emitter, x, y, 0);
audio_emitter_falloff(emitter, audio_drop_start, audio_max_distance, 1);

//snd = audio_play_sound_on(emitter, jetpack_snd, true, 1);