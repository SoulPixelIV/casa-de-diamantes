audio_play_sound(bulletHitGround_snd, 1, false);
instance_change(bulletHit_obj, true);
other.used = true;

if (global.sniperUpgrade2 && !instance_exists(healingCloud_obj)) {
	instance_create_layer(x, y, "Instances", healingCloud_obj);
}