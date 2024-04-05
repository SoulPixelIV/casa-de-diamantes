createdHitbox = false;

gateDown = false;
collider = noone;

animationSpeed = 0.5;

bulletCol = instance_create_layer(x, y, "TileCollider", colliderOnlyBullet_obj);
bulletCol.image_xscale = 1.5;
bulletCol.image_yscale = 4;

if (global.keyBlue) {
	open = true;
}