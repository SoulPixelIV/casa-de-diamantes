/// @description Pickup

if (global.pistolMag < 36)
{
    global.pistolMag += 6;
    instance_destroy();
}
