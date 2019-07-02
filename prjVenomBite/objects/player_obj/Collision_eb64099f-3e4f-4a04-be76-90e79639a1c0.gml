/// @description Slope Collision

if (keyboard_check(ord("D")) || keyboard_check(ord("A")) || verspeed > 0)
{
	verspeed = -3;
}
else
{
	resetJump_scr();
}
onSlope = true;
