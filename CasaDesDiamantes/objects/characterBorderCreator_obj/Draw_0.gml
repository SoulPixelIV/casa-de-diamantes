//Draw Character Background
if (camera_obj.drawText) {
	if (backgroundRotVal > 15) {
		backgroundRotIndex = -1;
	}
	if (backgroundRotVal < -15) {
		backgroundRotIndex = 1;
	}
		
	if (backgroundRotIndex == 1) {
		backgroundRotVal += global.dt / 200;
	} else {
		backgroundRotVal -= global.dt / 200;
	}
		
	if (instance_exists(player_obj)) {
		draw_sprite_ext(playerBackground_spr, 0, player_obj.x, player_obj.y, 1, 1, backgroundRotVal, -1, 1);
	}
	if (instance_exists(cindy_obj)) {
		draw_sprite_ext(cindyBackground_spr, 0, cindy_obj.x, cindy_obj.y, 1, 1, backgroundRotVal, -1, 1);
	}
	if (instance_exists(cindy2_obj)) {
		draw_sprite_ext(cindyBackground_spr, 0, cindy2_obj.x, cindy2_obj.y, 1, 1, backgroundRotVal, -1, 1);
	}
	if (instance_exists(cindy3_obj)) {
		draw_sprite_ext(cindyBackground_spr, 0, cindy3_obj.x, cindy3_obj.y, 1, 1, backgroundRotVal, -1, 1);
	}
	if (instance_exists(komo_obj)) {
		draw_sprite_ext(komoBackground_spr, 0, komo_obj.x, komo_obj.y, 1, 1, backgroundRotVal, -1, 1);
	}
	if (instance_exists(tristram_obj)) {
		draw_sprite_ext(tristramBackground_spr, 0, tristram_obj.x, tristram_obj.y, 1, 1, backgroundRotVal, -1, 1);
	}
}