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
if (global.spawn == 3)
{
	instance_create_layer(Spawn4_obj.x, Spawn4_obj.y, "Instances", player_obj);
}
if (global.spawn == 4)
{
	instance_create_layer(Spawn5_obj.x, Spawn5_obj.y, "Instances", player_obj);
}
if (global.spawn == 5)
{
	instance_create_layer(Spawn6_obj.x, Spawn6_obj.y, "Instances", player_obj);
}
if (global.spawn == 6)
{
	instance_create_layer(Spawn7_obj.x, Spawn7_obj.y, "Instances", player_obj);
}
if (global.spawn == 7)
{
	instance_create_layer(Spawn8_obj.x, Spawn8_obj.y, "Instances", player_obj);
}
if (global.spawn == 8)
{
	instance_create_layer(Spawn9_obj.x, Spawn9_obj.y, "Instances", player_obj);
}

if (instance_exists(camera_obj)) {
	camera_obj.hazeEffect = true;
}