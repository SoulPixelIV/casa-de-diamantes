dir = 0;

lightrayRotation = 0;
switchTimer = 75;
switchTimerSave = switchTimer;

horspeed = random_range(-2, 2);
verspeed = random_range(-1, -3.9);
gravityStrength = -0.12;

if (horspeed > -1.5 && horspeed < 1.5) {
	horspeed = choose(-1.5, 1.5);
}