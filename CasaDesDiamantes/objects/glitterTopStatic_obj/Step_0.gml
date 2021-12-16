glitterTimer -= global.dt;
if (glitterTimer < 0) {
	instance_create_layer(random_range(x - 5, x + 5), random_range(y - 8, y + 8), "GraphicsLayer", blueSparkle_obj);
	glitterTimer = random_range(125,500);
}
