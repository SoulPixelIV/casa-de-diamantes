/// @description Movement

speed = movSpeed * global.dt;

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
		audio_play_sound_on(emitter, bulletHitGround_snd, false, 1);
		instance_change(bulletHit_obj, true);
	}
}

if (place_meeting(x, y, player_obj) && !player_obj.isZombie && !player_obj.invincible && !player_obj.damageRecieved)
{
	player_obj.hp -= 22;
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