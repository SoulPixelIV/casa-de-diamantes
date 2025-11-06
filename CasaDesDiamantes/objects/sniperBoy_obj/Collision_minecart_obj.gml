/// @description Crush

hp = -1;
bloodSpread = instance_create_layer(x, y, "Instances", bloodSpread_obj);
bloodSpread.image_angle = other.image_angle;
bloodSpread2 = instance_create_layer(x, y, "Instances", bloodSpread2_obj);
bloodSpread2.image_angle = other.image_angle;
audio_play_sound(bulletHit_snd, 1, false);

if (steam_initialised()) {
	if (steam_stats_ready()) {
		if (!steam_get_achievement("ACH_MINECART_ROADKILL")) {
			steam_set_achievement("ACH_MINECART_ROADKILL");
			steam_update();
		}
	}
}
