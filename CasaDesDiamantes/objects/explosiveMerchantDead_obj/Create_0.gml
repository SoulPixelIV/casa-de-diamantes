/// @description Vars

//Movement
horspeed = 0;
verspeed = 0;
if (image_xscale == 1)
{
	dir = 0;
}
else
{
	dir = 1;
}

//Stats
hp = 90;
colliding = true;
level = 1;
movSpeed = 0;
moneyDropMin = 7;
moneyDropMax = 15;
damage = 0;
knockback = 0;
playerSightMax = 128;
playerSightMin = 8;
gravityStrength = 0;

animationSpeed = 0.5;
savePosX = x;
savePosY = y;
movement = true;
damageTint = false;
damageCollision = false;
damageTintTimer = 15;
headshot = false;
open = false;

//Help Vars
damageTintTimerSave = damageTintTimer;
gravityStrengthSave = gravityStrength;

barrelHitbox = instance_create_layer(x + 24, y + 4, "ForegroundObjects", barrelHitbox_obj);
alarmLight = instance_create_layer(x, y, "GraphicsLayer", spotlightRed_obj); 
with (barrelHitbox)
{
	image_yscale = 2.2;
	image_angle = -24;
	body = instance_nearest(x, y, explosiveMerchantDead_obj);
}
with (alarmLight)
{
	body = instance_nearest(x, y, explosiveMerchantDead_obj);
}

checkPlayerTimer = 50;
checkPlayerTimerSave = checkPlayerTimer;
checkPlayerTimer = 0;
gravityStrength = 0;
