if (hp < 0)
{
	parent.eyeKilled = true;
	instance_destroy();
}

x = parent.x + 8;
y = parent.y - 94 + parent.slamPos;