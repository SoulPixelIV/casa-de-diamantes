/// @description Vars

reflectionList = ds_list_create();
target = noone;

reflectionListRealtime = ds_list_create();
targetRealtime = noone;

target = instance_position_list(x, y - 8, all, reflectionList, false) + 
instance_position_list(x, y - 16, all, reflectionList, false) + 
instance_position_list(x, y - 32, all, reflectionList, false) +

instance_position_list(x + 8, y - 8, all, reflectionList, false) + 
instance_position_list(x + 8, y - 16, all, reflectionList, false) + 
instance_position_list(x + 8, y - 32, all, reflectionList, false) +

instance_position_list(x + 16, y - 8, all, reflectionList, false) + 
instance_position_list(x + 16, y - 16, all, reflectionList, false) + 
instance_position_list(x + 16, y - 32, all, reflectionList, false) +

instance_position_list(x - 8, y - 8, all, reflectionList, false) + 
instance_position_list(x - 8, y - 16, all, reflectionList, false) + 
instance_position_list(x - 8, y - 32, all, reflectionList, false) +

instance_position_list(x - 16, y - 8, all, reflectionList, false) + 
instance_position_list(x - 16, y - 16, all, reflectionList, false) + 
instance_position_list(x - 16, y - 32, all, reflectionList, false);