/// @description Vars

movSpeed = 3.4;
gravityStrength = -0.42;
jumpStrength = 9.2;
frictionStrength = 0.2; //Lower is more slippery
fallJumpSafety = 9;

fullJump = false;
grounded = false;
fallJumpSafetySave = fallJumpSafety;

tilemap = layer_tilemap_get_id("TilesCollider");

