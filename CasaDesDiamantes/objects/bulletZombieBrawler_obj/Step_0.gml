/// @description Movement

//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

lifetime -= global.dt;

if (lifetime < 0) {
	image_alpha -= global.dt / 50;
}

if (image_alpha < 0.05) {
	instance_destroy();
}

if (!playedSound) {
	switch (dir) {
		case 0:
			x += movSpeed * global.dt;
			break;
		case 1:
			x += movSpeed * global.dt;
			y -= movSpeed * global.dt;
			break;
		case 2:
			y -= movSpeed * global.dt;
			break;
		case 3:
			x -= movSpeed * global.dt;
			y -= movSpeed * global.dt;
			break;
		case 4:
			x -= movSpeed * global.dt;
			break;
		case 5:
			x -= movSpeed * global.dt;
			y += movSpeed * global.dt;
			break;
		case 6:
			y += movSpeed * global.dt;
			break;
		case 7:
			x += movSpeed * global.dt;
			y += movSpeed * global.dt;
			break;
	}
}

//Invincibility
if (invincibilityTimer > 0)
{
	invincibilityTimer -= global.dt;
}

//Collision
if (invincibilityTimer <= 0)
{
	if (!place_free(x, y) && (!place_meeting(x, y, colliderBulletFree_obj) || place_meeting(x, y, colliderEnemyOnly_obj)) && !place_meeting(x, y, colliderOneWay_obj))
	{
		if (!playedSound) {
			audio_play_sound_on(emitter, bulletHitGround_snd, false, 1);
			noMovement = true;
			playedSound = true;
		}
	}
}

if (place_meeting(x, y, player_obj) && !player_obj.isZombie && !player_obj.invincible && !player_obj.damageRecieved && !noMovement && !player_obj.inChamber)
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