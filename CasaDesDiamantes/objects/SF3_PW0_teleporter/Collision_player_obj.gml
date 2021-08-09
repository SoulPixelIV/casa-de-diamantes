part_emitter_destroy_all(global.partSystem);
instance_destroy(player_obj);
global.spawn = 0;
removeAllWeapons_scr();
room_goto(level0_Powerplant);
