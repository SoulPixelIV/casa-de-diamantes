done = false;

initialDelay = 300;
openFloor = false;

floorStartPos1 = 0;
floorStartPos2 = 0;

if (instance_exists(basementFloor_obj)) {
	floorStartPos1 = basementFloor_obj.x;
}
if (instance_exists(basementFloor2_obj)) {
	floorStartPos2 = basementFloor2_obj.x;
}