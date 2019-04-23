/// @description Vars

reflectionList = ds_list_create();
target = noone;

reflectionListRealtime = ds_list_create();
targetRealtime = noone;

target = instance_position_list(x, y - 2, static_obj, reflectionList, true) +
instance_position_list(x, y - 8, static_obj, reflectionList, true) + 
instance_position_list(x, y - 16, static_obj, reflectionList, true) + 
instance_position_list(x, y - 32, static_obj, reflectionList, true) +

instance_position_list(x + 8, y - 2, static_obj, reflectionList, true) +
instance_position_list(x + 8, y - 8, static_obj, reflectionList, true) + 
instance_position_list(x + 8, y - 16, static_obj, reflectionList, true) + 
instance_position_list(x + 8, y - 32, static_obj, reflectionList, true) +

instance_position_list(x + 16, y - 2, static_obj, reflectionList, true) +
instance_position_list(x + 16, y - 8, static_obj, reflectionList, true) + 
instance_position_list(x + 16, y - 16, static_obj, reflectionList, true) + 
instance_position_list(x + 16, y - 32, static_obj, reflectionList, true) +

instance_position_list(x - 8, y - 2, static_obj, reflectionList, true) +
instance_position_list(x - 8, y - 8, static_obj, reflectionList, true) + 
instance_position_list(x - 8, y - 16, static_obj, reflectionList, true) + 
instance_position_list(x - 8, y - 32, static_obj, reflectionList, true) +

instance_position_list(x - 16, y - 2, static_obj, reflectionList, true) +
instance_position_list(x - 16, y - 8, static_obj, reflectionList, true) + 
instance_position_list(x - 16, y - 16, static_obj, reflectionList, true) + 
instance_position_list(x - 16, y - 32, static_obj, reflectionList, true);