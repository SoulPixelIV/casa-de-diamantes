if (instance_exists(elevator_obj) && global.spawn != 0) {
	elevator_obj.target = 3;
	elevator_obj.used = true;
}

if (instance_exists(elevator_obj) && room == level_CasinoRoof) {
	elevator_obj.target = 4;
	elevator_obj.used = true;
}
