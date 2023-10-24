/// @description Crush

if (other.horspeed > 0.6 || other.horspeed < -0.6) {
	hp = -1;
	bloodSpread = instance_create_layer(x, y, "Instances", bloodSpread_obj);
	bloodSpread.image_angle = other.image_angle;
	bloodSpread2 = instance_create_layer(x, y, "Instances", bloodSpread2_obj);
	bloodSpread2.image_angle = other.image_angle;
	audio_play_sound(bulletHit_snd, 1, false);
}
