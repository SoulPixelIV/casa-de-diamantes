if (image_index == 3)
{
	var colliderTarget = instance_place(x, y, collider_obj);
	instance_destroy(colliderTarget);
	instance_destroy();
}
