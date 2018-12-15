/// @description Movement

if (image_angle < 0)
{
    dir = 0;
}
if (image_angle > 5)
{
    dir = 1;
}

if (dir == 0)
{
    image_angle += 0.0032;
}

if (dir == 1)
{
    image_angle -= 0.0032;
}
