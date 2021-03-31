/// @description Check Player

if (place_meeting(x, y, player_obj))
{			
	if (instance_exists(objectAccess))
	{
		if (objectCount == 1)
		{
			object = instance_nearest(x, y, objectAccess);
			object.open = true;
		}
		else
		{
			var i;
			object[0] = noone;
			for (i = 0; i < objectCount; i++)
			{
				object[i] = noone;
				if (distance_to_object(instance_find(objectAccess, i)) < objectMaxDistance)
				{
					object[i] = instance_find(objectAccess, i);
				}
				
				if (object[i] != noone)
				{
					if (object[i].open == false)
					{
						object[i].open = true;
					}
				}
			}
		}
	}
}