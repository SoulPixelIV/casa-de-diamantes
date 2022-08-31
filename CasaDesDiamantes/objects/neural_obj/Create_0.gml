animationSpeed = random_range(0.85, 1.25);
lifetime = random_range(250, 1000);
varX = random_range(-200, 200);
varY = random_range(-100, 200);
image_angle = choose(0, 90, 180, 270);
image_alpha = 0.5;
if (image_xscale == 1)
{
	image_xscale = choose(0.7, 1);
	image_yscale = choose(0.7, 1);
}
if (image_xscale == -1)
{
	image_xscale = choose(-0.7, -1);
	image_yscale = choose(-0.7, -1);
}
