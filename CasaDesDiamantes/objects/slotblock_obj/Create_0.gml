col = instance_create_layer(x, y, "TileCollider", colliderBulletFree_obj);
col.image_xscale = 0.6;
col.image_yscale = 0.6;
col.x = x - 8;
col.y = y - 8;

animationSpeed = 1;
spinTimer = 250;
if (activeLight) {
	boxLight = instance_create_layer(x, y, "GraphicsLayer", spotlightYellow_obj);
}

used = false;
spinDone = false;
spawned = false;
