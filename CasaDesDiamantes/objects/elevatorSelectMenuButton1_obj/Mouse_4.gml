if (instance_exists(elevator_obj) && global.spawn != 3 && room == level_Casino) {
	elevator_obj.target = 0;
	elevator_obj.used = true;
}

if (instance_exists(elevator_obj) && room == level_CasinoRoof) {
	elevator_obj.target = 2;
	elevator_obj.used = true;
}
