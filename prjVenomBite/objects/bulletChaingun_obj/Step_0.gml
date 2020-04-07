/// @description Movement

speed = movSpeed * global.dt;

//Collision
if (!place_free(x, y))
{
	audio_play_sound(bulletHitGround_snd, 0.9, false);
	instance_change(bulletHit_obj, true);
}

if (place_meeting(x, y, player_obj) && !player_obj.isZombie && !player_obj.invincible)
{
	player_obj.hp -= 4;
	instance_change(bloodSpread_obj, true);
	bloodSpread2 = instance_create_layer(x, y, "Instances", bloodSpread2_obj);
	bloodSpread2.image_angle = image_angle;
}