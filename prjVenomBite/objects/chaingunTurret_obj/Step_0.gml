//Animation
image_speed = 0;
image_index += global.dt / 15;

if (instance_exists(player_obj) && distance_to_object(player_obj) < 256)
{
    image_angle = point_direction(x, y, player_obj.x, player_obj.y) + 90;
}
else
{
    image_angle = 90;
}