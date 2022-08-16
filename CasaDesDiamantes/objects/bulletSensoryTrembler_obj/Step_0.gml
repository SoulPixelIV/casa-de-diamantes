/// @description Movement

if (instance_exists(player_obj) && dirChange)
{
	image_angle = clamp(point_direction(x, y, player_obj.x, player_obj.y), dir - 30, dir + 30);
	dirChange = false;
}

speedMov = movSpeed * global.dt;
x += lengthdir_x(speedMov, image_angle)
y += lengthdir_y(speedMov, image_angle)

//Invincibility
if (invincibilityTimer > 0)
{
	invincibilityTimer -= global.dt;
}

//Collision
if (invincibilityTimer <= 0)
{
	if (!place_free(x, y) && !place_meeting(x, y, colliderBulletFree_obj) && !place_meeting(x, y, colliderOneWay_obj))
	{
		audio_play_sound(bulletHitGround_snd, 0.9, false);
		instance_change(bulletHit_obj, true);
	}
}

if (place_meeting(x, y, player_obj) && !player_obj.isZombie && !player_obj.invincible && !player_obj.damageRecieved)
{
	player_obj.hpOld = player_obj.hp;
	player_obj.hp -= 15;
	instance_change(bloodSpread_obj, true);
	player_obj.damageRecieved = true;
	player_obj.damageCooldown = player_obj.damageCooldownSave;
	camera_obj.hitVignette = true;
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