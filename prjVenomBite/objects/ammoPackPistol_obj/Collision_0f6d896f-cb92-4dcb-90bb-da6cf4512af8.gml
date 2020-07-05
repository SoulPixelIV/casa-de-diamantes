/// @description Pickup

if (global.pistolMag < 39)
{
    global.pistolMag += 8;
    instance_destroy();
}
