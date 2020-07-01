if (image_index == 2)
{
	var colliderTarget = instance_place(x, y, collider_obj);
	instance_destroy(colliderTarget);
	instance_destroy();
}
