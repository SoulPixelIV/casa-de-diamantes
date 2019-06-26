/// @description Slope Collision

if (keyboard_check(ord("D")) || keyboard_check(ord("A")))
{
	verspeed = -3;
}
else
{
	fullJump = false;
	fallJumpSafety = fallJumpSafetySave;
    verspeed = 0;
}
grounded = true;
onSlope = true;
