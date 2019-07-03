/// @description Slope Collision

if (keyboard_check(ord("D")) || keyboard_check(ord("A")))
{
	verspeed = -3;
}
else
{
	resetJump_scr();
}
grounded = true;
frictionActive = false;
walkingActive = false;
