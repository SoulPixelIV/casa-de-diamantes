/// @description Vars

horspeed = 0;
verspeed = 0;
hp = 100;
syringes = 3;
movSpeed = 3.4;
gravityStrength = -0.42;
jumpStrength = 6.2;
shotJumpStrength = 9.2;
frictionStrength = 0.2; //Lower is more slippery
fallJumpSafety = 9;
damageCooldown = 30;
movement = true;

fullJump = false;
grounded = false;
crouching = false;
damageRecieved = false;
damageCooldownSave = damageCooldown;
fallJumpSafetySave = fallJumpSafety;
dirCursor = 0;
lightStrength = 0;
lightSize = 0;

tilemap = layer_tilemap_get_id("TilesCollider");

