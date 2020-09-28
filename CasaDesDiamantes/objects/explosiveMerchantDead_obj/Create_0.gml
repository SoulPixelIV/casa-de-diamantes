/// @description Vars

//Movement
horspeed = 0;
verspeed = 0;
dir = 0;

//Stats
hp = 90;
level = 1;
movSpeed = 0;
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
damageCollision = false;
damageTintTimer = 15;
headshot = false;

//Help Vars
damageTintTimerSave = damageTintTimer;

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