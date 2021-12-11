function instanceNearest(x, y, obj, number){
	var pointx,pointy,object,n,list,nearest;
    pointx = argument0;
    pointy = argument1;
    object = argument2;
    number = argument3;
    number = min(max(1,number),instance_number(object));
    list = ds_priority_create();
    nearest = noone;
    with (object) ds_priority_add(list,id,distance_to_point(pointx,pointy));
    repeat (number) nearest = ds_priority_delete_min(list);
    ds_priority_destroy(list);
    return nearest;
}