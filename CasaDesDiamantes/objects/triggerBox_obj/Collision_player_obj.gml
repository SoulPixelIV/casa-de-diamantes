if (instance_exists(triggerBlock))
{
	object = instance_nearest(x, y, triggerBlock);
	object.trigger = true;
}