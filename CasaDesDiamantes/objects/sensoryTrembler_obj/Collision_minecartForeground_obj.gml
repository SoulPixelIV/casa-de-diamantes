/// @description Crush

eyeKilled = true;
bloodSpread = instance_create_layer(x, y, "Instances", bloodSpread_obj);
bloodSpread.image_angle = other.image_angle;
bloodSpread2 = instance_create_layer(x, y, "Instances", bloodSpread2_obj);
bloodSpread2.image_angle = other.image_angle;
audio_play_sound(bulletHit_snd, 1, false);
