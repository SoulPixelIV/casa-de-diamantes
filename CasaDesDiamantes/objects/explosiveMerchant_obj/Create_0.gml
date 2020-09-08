/// @description Vars

//Movement
horspeed = 0;
verspeed = 0;
dir = 0;

//Stats
hp = 100;
level = 1;
movSpeed = 0.033;
moneyDropMin = 7;
moneyDropMax = 15;
damage = 0;
knockback = 2.1;
playerSightMax = 128;
playerSightMin = 8;

animationSpeed = 0.5;
savePosX = x;
savePosY = y;
movement = true;
gravityStrength = -0.05;
damageTint = false;
damageTintTimer = 15;
headshot = false;

//Help Vars
damageTintTimerSave = damageTintTimer;

headshotHitbox = instance_create_layer(x, y - 16, "Instances", headshotHitbox_obj);
with (headshotHitbox)
{
	body = instance_nearest(x, y, explosiveMerchant_obj);
}