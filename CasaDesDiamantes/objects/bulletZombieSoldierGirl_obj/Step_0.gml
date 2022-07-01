/// @description Movement

if (!playedSound) {
	speed = movSpeed * global.dt;
}

//Invincibility
if (invincibilityTimer > 0)
{
	invincibilityTimer -= global.dt;
}

//Collision
if (invincibilityTimer <= 0)
{
	if (!place_free(x, y) && !place_meeting(x, y, colliderBulletFree_obj))
	{
		if (!playedSound) {
			audio_play_sound_on(emitter, bulletHitGround_snd, false, 1);
			speed = 0;
			playedSound = true;
		}
	}
}

if (place_meeting(x, y, player_obj) && !player_obj.isZombie && !player_obj.invincible && !player_obj.damageRecieved && speed != 0)
{
	player_obj.hpOld = player_obj.hp;
	player_obj.hp -= 28;
	player_obj.damageRecieved = true;
	player_obj.damageCooldown = player_obj.damageCooldownSave;
	camera_obj.hitVignette = true;
	instance_change(bloodSpread_obj, true);
	bloodSpread2 = instance_create_layer(x, y, "Instances", bloodSpread2_obj);
	bloodSpread2.image_angle = image_angle;
}

if (dealtDamage)
{
	penetrationTime -= global.dt;
}
if (penetrationTime < 0)
{
	dealtDamage = false;
	penetrationTime = 3;
}