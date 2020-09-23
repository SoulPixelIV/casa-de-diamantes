image_xscale = 1;
image_yscale = 1;
instance_change(explosionBig_obj, true);
if (instance_exists(body))
{
	body.hp = 0;
}
