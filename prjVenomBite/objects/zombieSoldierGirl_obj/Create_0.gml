/// @description Vars

horspeed = 0;
verspeed = 0;
playerSightMax = 72;
playerSightMin = 8;
hp = 85;
level = 1;
moneyDropMin = 3;
moneyDropMax = 7;
attackCooldown = 320;
damage = 15;
damageCollision = true;
points = 125;
knockback = 2.25;
movSpeed = 0.08;
playedSound = false;
movement = true;
gravityStrength = -0.05;
dir = 0;
playerPosX = player_obj.x;
playerPosY = player_obj.y;
savePosX = x;
savePosY = y;
randAttack = 1;
attackInProg1 = false;
attackInProg2 = false;
damageTint = false;
damageTintTimer = 15;
animationSpeed = 1;
headshot = false;

attackCooldownSave = attackCooldown;
damageTintTimerSave = damageTintTimer;

headshotHitbox = instance_create_layer(x, y - 16, "Instances", headshotHitbox_obj);
with (headshotHitbox)
{
	body = instance_nearest(x, y, zombieSoldierGirl_obj);
}

//Create Emitter
emitter = audio_emitter_create();
audio_max_distance = 500;
audio_drop_start = 180;

audio_falloff_set_model(audio_falloff_linear_distance);
audio_emitter_position(emitter, x, y, 0);
audio_emitter_falloff(emitter, audio_drop_start, audio_max_distance, 1);