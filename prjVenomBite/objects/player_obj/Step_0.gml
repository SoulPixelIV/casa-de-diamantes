/// @description Movement

x += (hspeed / 10000) * (dt - delta_time);
y += (vspeed / 10000) * (dt - delta_time);

key_jump = keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(0, gp_face1);
key_jump_hold = keyboard_check(vk_space) || gamepad_button_check(0, gp_face1);
key_jump_release = keyboard_check_released(vk_space) || gamepad_button_check_released(0, gp_face1);

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
		

