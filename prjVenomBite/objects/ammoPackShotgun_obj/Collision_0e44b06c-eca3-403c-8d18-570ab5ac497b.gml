/// @description Pickup

if (global.shotgunMag < 12)
{
    global.shotgunMag += 4;
    instance_destroy();
}
