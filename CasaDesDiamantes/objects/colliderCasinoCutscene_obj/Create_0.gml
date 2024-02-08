/// @description Set visibility

event_inherited();
polygon = polygon_from_instance(id);

image_index = 1;

if (global.cutsceneCasinoIntroDone || global.storyAct != 0) {
	instance_destroy();
}