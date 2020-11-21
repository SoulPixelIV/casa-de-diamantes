moving = false;
dir = 0;
goal = noone;

_list = ds_list_create();
_num = instance_position_list(x, y, all, _list, false);
elevatorTrigger = instance_place(x, y, elevatorTrigger_obj);
background = instance_place(x, y, goldenElevatorDiryBackground_obj);
