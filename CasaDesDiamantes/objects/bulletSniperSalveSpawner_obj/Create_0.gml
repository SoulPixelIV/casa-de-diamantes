salveDelay = 22;
salveAmount = 1;

salveDelaySave = salveDelay;

instance_create_layer(playerBulletLine_obj.x, playerBulletLine_obj.y, "Instances", bulletSniper_obj);
			
instance_create_layer(playerBulletLine_obj.x, playerBulletLine_obj.y, "Instances", rifleBulletCase_obj);

if (global.bowAmmo > 0) {
	global.bowAmmo--;
}

if (global.bowAmmo > 2) {
	var rifleShot = audio_play_sound(sniperShot_snd, 1, false);
	audio_sound_pitch(rifleShot, random_range(0.9, 1.1));
	var pingSound = audio_play_sound(riflePing_snd, 1, false);
	audio_sound_pitch(pingSound, random_range(0.9, 1.1));
}
if (global.bowAmmo == 2) {
	var rifleShot = audio_play_sound(sniperShot_snd, 1, false);
	audio_sound_pitch(rifleShot, 1.2);
	var pingSound = audio_play_sound(riflePing_snd, 1, false);
	audio_sound_pitch(pingSound, 1.2);
}
if (global.bowAmmo <= 1) {
	var rifleShot = audio_play_sound(sniperShot_snd, 1, false);
	audio_sound_pitch(rifleShot, 1.4);
	var pingSound = audio_play_sound(riflePing_snd, 1, false);
	audio_sound_pitch(pingSound, 1.4);
}
		
var shotLightx = x + lengthdir_x(36, player_obj.dirCursor);
var shotLighty = y - 8 + lengthdir_y(36, player_obj.dirCursor);

instance_create_layer(shotLightx, shotLighty, "ForegroundObjects", shotLightShotgun_obj);
			
if (instance_exists(spotlightPlayer_obj)) {
	spotlightPlayer_obj.shotlight = true;
}
instance_create_layer(shotLightx, shotLighty, "ForegroundObjects", smokecloud_obj);

screenshake(160, 70, 0.6, id);