/// @description Vars

hp = 100;
syringes = 3;
movSpeed = 3.4;
gravityStrength = -0.42;
jumpStrength = 6.2;
shotJumpStrength = 9.2;
frictionStrength = 0.2; //Lower is more slippery
fallJumpSafety = 9;

fullJump = false;
grounded = false;
crouching = false;
fallJumpSafetySave = fallJumpSafety;
dirCursor = 0;
lightStrength = 0;
lightSize = 0;

tilemap = layer_tilemap_get_id("TilesCollider");

