if (hp < 0)
{
	parent.eyeKilled = true;
	instance_destroy();
}

x = parent.x + 4;
y = parent.y - 100 + parent.slamPos;