if (global.spawn == 0)
{
	instance_create_layer(Spawn1_obj.x, Spawn1_obj.y, "Instances", player_obj);
}
if (global.spawn == 1)
{
	instance_create_layer(Spawn2_obj.x, Spawn2_obj.y, "Instances", player_obj);
}
if (global.spawn == 2)
{
	instance_create_layer(Spawn3_obj.x, Spawn3_obj.y, "Instances", player_obj);
}