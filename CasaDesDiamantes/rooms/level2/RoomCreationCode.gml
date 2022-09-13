camera_obj.showStartscreen = true;
camera_obj.showStartTitle1 = true;

if (global.spawn == 0)
{
	instance_create_layer(Spawn1_obj.x, Spawn1_obj.y, "Instances", player_obj);
}
if (global.spawn == 1)
{
	instance_create_layer(Spawn2_obj.x, Spawn2_obj.y, "Instances", player_obj);
}