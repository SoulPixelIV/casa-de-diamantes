/// @description Vars

horspeed = 0;
verspeed = 0;
hp = 100;
maxhp = hp;
syringes = 3;
syringesLost = 0;
movSpeed = 3.4;
movSpeedZombie = 1.8;
zombieTimer = 550;
gravityStrength = -0.42;
jumpStrength = 6.2;
shotJumpStrength = 9.2;
frictionStrength = 0.2; //Lower is more slippery
fallJumpSafety = 9;
damageCooldown = 60;
movement = true;
invincible = false;
isZombie = false;

fullJump = false;
grounded = false;
crouching = false;
damageRecieved = false;
damageCooldownSave = damageCooldown;
fallJumpSafetySave = fallJumpSafety;
zombieTimerSave = zombieTimer;
dirCursor = 0;
lightStrength = 0;
lightSize = 0;

tilemap = layer_tilemap_get_id("TilesCollider");
instance_create_layer(x + 1, y - 4, "Instances", playerBulletLine_obj);

