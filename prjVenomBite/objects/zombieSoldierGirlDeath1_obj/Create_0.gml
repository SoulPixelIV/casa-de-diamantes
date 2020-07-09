horspeed = 0;
verspeed = 2;

repeat(irandom_range(8, 14))
{
	instance_create_layer(x, y, "GraphicsLayer", fireSpark_obj);
}
