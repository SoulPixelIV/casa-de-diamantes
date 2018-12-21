/// @description Movement

x += (hspeed / 10000) * (dt - delta_time);
y += (vspeed / 10000) * (dt - delta_time);

key_jump = keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(0, gp_face1);
key_jump_hold = keyboard_check(vk_space) || gamepad_button_check(0, gp_face1);
key_jump_release = keyboard_check_released(vk_space) || gamepad_button_check_released(0, gp_face1);
key_up = keyboard_check(vk_up);
key_down = keyboard_check(vk_down);
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);

//Movement
if (keyboard_check(ord("D")) && !keyboard_check(ord("A")))
{
	hspeed = movSpeed;
}
if (keyboard_check(ord("A")) && !keyboard_check(ord("D")))
{
	hspeed = -movSpeed;
}

if (hspeed > 0)
{
	hspeed -= frictionStrength;
	if (hspeed < 0.3)
	{
		hspeed = 0;
	}
}
else
{
	hspeed += frictionStrength;
	if (hspeed > -0.3)
	{
		hspeed = 0;
	}
}

//Gravity
if (vspeed < 14)
{
	vspeed = vspeed - gravityStrength;
}

//Jump
if (grounded && (key_jump) || fallJumpSafety > 0 && (key_jump))
{
    vspeed = -jumpStrength;
}
   
if (key_jump_release && fullJump == false)
{
    if (vspeed < 0)
    {
        vspeed = vspeed / 2;
    }
}

//Collision
//Hspeed
if (!place_free(x + hspeed, y))
{
    while (place_free(x + sign(hspeed), y))
    {
        x += sign(hspeed);
    }
    hspeed = 0;
} 
//Vspeed
if (!place_free(x, y + vspeed))
{
    while (place_free(x, y + sign(vspeed)))
    {
        y += sign(vspeed);
    }
    fullJump = false;
	fallJumpSafety = fallJumpSafetySave;
    vspeed = 0;   
}
else
{
	fallJumpSafety -= 1;
}

//###Weapon System###

//Crosshair Movement
if !(key_up && key_down && key_left && key_right)
{
	dirCursor = point_direction(x, y, mouse_x, mouse_y);
}
if (key_up)
{
	dirCursor = 90;
	display_mouse_set(player_obj.x, player_obj.y - 64);
}
if (key_down)
{
	dirCursor = 270;
	display_mouse_set(player_obj.x, player_obj.y + 64);
}
if (key_left)
{
	dirCursor = 180;
	display_mouse_set(player_obj.x - 64, player_obj.y);
}
if (key_right)
{
	dirCursor = 0;
	display_mouse_set(player_obj.x + 64, player_obj.y);
}

if (global.pickedWeapon[0])
{
	if !(instance_exists(playerPistol_obj))
	{
		instance_create_layer(x, y, "InstancesForeground", playerPistol_obj);
	}
	sprite_index = playerEquipped_spr;
}

if (mouse_check_button_pressed(mb_left) && global.pickedWeapon[0])
{
	audio_play_sound(pistolShot_snd, 1, false);
	if (image_xscale == 1)
	{
		instance_create_layer(playerPistol_obj.x + 25, playerPistol_obj.y - 1, "Instances", bullet_obj);
		instance_create_layer(playerPistol_obj.x + 25, playerPistol_obj.y - 1, "Instances", shotLight_obj);
	}
	else
	{
		instance_create_layer(playerPistol_obj.x - 25, playerPistol_obj.y - 1, "Instances", bullet_obj);
		instance_create_layer(playerPistol_obj.x - 25, playerPistol_obj.y - 1, "Instances", shotLight_obj);
	}
}

//Animation
if (dirCursor > 90 && dirCursor < 270)
{
	image_xscale = -1;
}
else
{
	image_xscale = 1;
}

