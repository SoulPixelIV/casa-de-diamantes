speedMov = 0.5;
moving = false;
dir = 0;
goal = instance_nearest(x, y, elevatorCheckpoint_obj);
goal2 = instance_nearest(x, y, elevatorCheckpoint2_obj);

elevatorTrigger = instance_place(x, y, elevatorTrigger_obj);
background = instance_place(x, y, goldenElevatorDiryBackground_obj);

if (room == level_Casino)
{
	sprite_index = goldenElevatorForeground_spr;
	dir = 1;
}
