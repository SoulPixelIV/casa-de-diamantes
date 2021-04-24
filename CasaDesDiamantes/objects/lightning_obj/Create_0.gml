animationSpeed = random_range(0.25, 1);
varX = random_range(-200, 200);
varY = random_range(-20, 40);
image_xscale = choose(1, -1);
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
