/// @description Pickup

if (global.pistolMag < 31)
{
    global.pistolMag += 6;
    instance_destroy();
}
