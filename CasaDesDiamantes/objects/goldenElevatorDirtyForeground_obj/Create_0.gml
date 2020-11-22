speedMov = 0.5;
moving = false;
dir = 0;
goal = instance_nearest(x, y, elevatorCheckpoint_obj);
goal2 = instance_nearest(x, y, elevatorCheckpoint2_obj);

_list = ds_list_create();
_num = instance_position_list(x, y, collider_obj, _list, false);
elevatorTrigger = instance_place(x, y, elevatorTrigger_obj);
background = instance_place(x, y, goldenElevatorDiryBackground_obj);
