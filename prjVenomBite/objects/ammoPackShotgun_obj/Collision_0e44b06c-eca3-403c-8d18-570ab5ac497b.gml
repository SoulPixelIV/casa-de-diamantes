/// @description Pickup

if (global.shotgunMag < 11)
{
    global.shotgunMag += 4;
    instance_destroy();
}
