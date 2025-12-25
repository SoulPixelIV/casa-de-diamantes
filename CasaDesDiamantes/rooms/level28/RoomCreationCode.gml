if (global.spawn == 0)
{
	instance_create_layer(Spawn1_obj.x, Spawn1_obj.y, "Instances", player_obj);
}
if (global.spawn == 1)
{
	instance_create_layer(Spawn2_obj.x, Spawn2_obj.y, "Instances", player_obj);
}
if (global.spawn == 2)
{
	instance_create_layer(Spawn3_obj.x, Spawn3_obj.y, "Instances", player_obj);
}

if (instance_exists(camera_obj)) {
	camera_obj.hazeEffect = true;
	camera_obj.drawBlackborders = true;
	camera_obj.follow = player_obj;
	camera_obj.noHUD = true;
}

if (instance_exists(cutieplusSteph_obj)) {
	instance_destroy(cutieplusSteph_obj);
}

if (instance_exists(player_obj)) {
	player_obj.movement = false;
	player_obj.gravityOn = false;
	player_obj.image_alpha = 0;
	player_obj.shootingAllowed = false;
}

if (steam_initialised()) {
	if (steam_stats_ready()) {
		if (!steam_get_achievement("ACH_FINISH_GAME")) {
			steam_set_achievement("ACH_FINISH_GAME");
			steam_update();
		}
		
		if (global.playtime > 600 && global.playtime <= 7200) {
			if (!steam_get_achievement("ACH_FINISH_1HOUR")) {
				steam_set_achievement("ACH_FINISH_1HOUR");
				steam_update();
			}
		}
	}
}