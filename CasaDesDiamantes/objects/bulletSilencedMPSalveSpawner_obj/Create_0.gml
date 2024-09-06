salveDelay = 9;
salveAmount = 2;

salveDelaySave = salveDelay;

instance_create_layer(playerBulletLine_obj.x, playerBulletLine_obj.y, "Instances", bulletSilencedMP_obj);
		
instance_create_layer(playerBulletLine_obj.x, playerBulletLine_obj.y, "Instances", pistolBulletCase_obj);

var silencedMPShot = audio_play_sound(pistolShot_snd, 1, false);
audio_sound_pitch(silencedMPShot, random_range(0.9, 1.1));
		
var shotLightx = x + 2 + lengthdir_x(24, player_obj.dirCursor);
var shotLighty = y - 3 + lengthdir_y(24, player_obj.dirCursor);

instance_create_layer(shotLightx, shotLighty, "ForegroundObjects", shotLightPistol_obj);
instance_create_layer(shotLightx, shotLighty, "ForegroundObjects", smokecloud_obj);

screenshake(150, 2.5, 0.4, id);
