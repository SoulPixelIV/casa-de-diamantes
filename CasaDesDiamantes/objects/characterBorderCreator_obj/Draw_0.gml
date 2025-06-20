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
		
	if (instance_exists(player_obj) && room != level28) {
		draw_sprite_ext(playerBackground_spr, 0, player_obj.x, player_obj.y, 1, 1, backgroundRotVal, -1, 1);
	}
	if (instance_exists(steph2_obj)) {
		draw_sprite_ext(playerBackground_spr, 0, steph2_obj.x, steph2_obj.y, 1, 1, backgroundRotVal, -1, 1);
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
	if (instance_exists(cindy4_obj)) {
		draw_sprite_ext(cindyBackground_spr, 0, cindy4_obj.x, cindy4_obj.y, 1, 1, backgroundRotVal, -1, 1);
	}
	if (instance_exists(cindy5_obj)) {
		draw_sprite_ext(cindyBackground_spr, 0, cindy5_obj.x, cindy5_obj.y, 1, 1, backgroundRotVal, -1, 1);
	}
	if (instance_exists(cindy6_obj)) {
		draw_sprite_ext(cindyBackground_spr, 0, cindy6_obj.x, cindy6_obj.y, 1, 1, backgroundRotVal, -1, 1);
	}
	if (instance_exists(cindy7_obj)) {
		draw_sprite_ext(cindyBackground_spr, 0, cindy7_obj.x, cindy7_obj.y, 1, 1, backgroundRotVal, -1, 1);
	}
	if (instance_exists(cindy8_obj)) {
		draw_sprite_ext(cindyBackground_spr, 0, cindy8_obj.x, cindy8_obj.y, 1, 1, backgroundRotVal, -1, 1);
	}
	if (instance_exists(komo_obj)) {
		draw_sprite_ext(komoBackground_spr, 0, komo_obj.x, komo_obj.y, 1, 1, backgroundRotVal, -1, 1);
	}
	if (instance_exists(tristram_obj)) {
		draw_sprite_ext(tristramBackground_spr, 0, tristram_obj.x, tristram_obj.y, 1, 1, backgroundRotVal, -1, 1);
	}
	if (instance_exists(komo2_obj)) {
		draw_sprite_ext(komoBackground_spr, 0, komo2_obj.x, komo2_obj.y, 1, 1, backgroundRotVal, -1, 1);
	}
	if (instance_exists(komo3_obj)) {
		draw_sprite_ext(komoBackground_spr, 0, komo3_obj.x, komo3_obj.y, 1, 1, backgroundRotVal, -1, 1);
	}
	if (instance_exists(komo4_obj)) {
		draw_sprite_ext(komoBackground_spr, 0, komo4_obj.x, komo4_obj.y, 1, 1, backgroundRotVal, -1, 1);
	}
	if (instance_exists(komo5_obj)) {
		draw_sprite_ext(komoBackground_spr, 0, komo5_obj.x, komo5_obj.y, 1, 1, backgroundRotVal, -1, 1);
	}
	if (instance_exists(komo6_obj)) {
		draw_sprite_ext(komoBackground_spr, 0, komo6_obj.x, komo6_obj.y, 1, 1, backgroundRotVal, -1, 1);
	}
	if (instance_exists(komo7_obj)) {
		draw_sprite_ext(komoBackground_spr, 0, komo7_obj.x, komo7_obj.y, 1, 1, backgroundRotVal, -1, 1);
	}
	if (instance_exists(komo8_obj)) {
		draw_sprite_ext(komoBackground_spr, 0, komo8_obj.x, komo8_obj.y, 1, 1, backgroundRotVal, -1, 1);
	}
	if (instance_exists(tristram2_obj)) {
		draw_sprite_ext(tristramBackground_spr, 0, tristram2_obj.x, tristram2_obj.y, 1, 1, backgroundRotVal, -1, 1);
	}
	if (instance_exists(tristram3_obj)) {
		draw_sprite_ext(tristramBackground_spr, 0, tristram3_obj.x, tristram3_obj.y, 1, 1, backgroundRotVal, -1, 1);
	}
	if (instance_exists(tristram4_obj)) {
		draw_sprite_ext(tristramBackground_spr, 0, tristram4_obj.x, tristram4_obj.y, 1, 1, backgroundRotVal, -1, 1);
	}
	if (instance_exists(tristram5_obj)) {
		draw_sprite_ext(tristramBackground_spr, 0, tristram5_obj.x, tristram5_obj.y, 1, 1, backgroundRotVal, -1, 1);
	}
	if (instance_exists(tristram6_obj)) {
		draw_sprite_ext(tristramBackground_spr, 0, tristram6_obj.x, tristram6_obj.y, 1, 1, backgroundRotVal, -1, 1);
	}
	if (instance_exists(tristram7_obj)) {
		draw_sprite_ext(tristramBackground_spr, 0, tristram7_obj.x, tristram7_obj.y, 1, 1, backgroundRotVal, -1, 1);
	}
	if (instance_exists(vip_obj)) {
		draw_sprite_ext(VIPBackground_spr, 0, vip_obj.x, vip_obj.y, 1, 1, backgroundRotVal, -1, 1);
	}
	if (instance_exists(vip2_obj)) {
		draw_sprite_ext(VIPBackground_spr, 0, vip2_obj.x, vip2_obj.y, 1, 1, backgroundRotVal, -1, 1);
	}
	if (instance_exists(vip3_obj)) {
		draw_sprite_ext(VIPBackground_spr, 0, vip3_obj.x, vip3_obj.y, 1, 1, backgroundRotVal, -1, 1);
	}
}