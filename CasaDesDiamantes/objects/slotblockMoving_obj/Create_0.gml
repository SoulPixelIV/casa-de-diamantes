dir = 0;
animationSpeed = 1;
spinTimer = 250;
delayTimer = 100;
delayOn = false;
if (activeLight) {
	boxLight = instance_create_layer(x, y, "GraphicsLayer", spotlightYellow_obj);
}

used = false;
spinDone = false;
spawned = false;
