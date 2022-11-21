glasShardEmitter = part_emitter_create(global.partSystem);
part_emitter_region(global.partSystem, glasShardEmitter, x - 36, x + 36, y - 14, y + 14, ps_shape_ellipse, ps_distr_gaussian);

col = instance_create_layer(x - 16, y, "TileCollider", colliderBulletFree_obj);
col.image_yscale = 0.5;

if (activateWallSprite) {
	sprite_index = glasPlaneForestWall_spr;
}
if (activateWallEndingSprite) {
	sprite_index = glasPlaneForestWallEnding_spr;
}

