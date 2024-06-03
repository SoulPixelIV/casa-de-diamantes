image_alpha = 0.5;

//Create Emitter
emitter = audio_emitter_create();
audio_max_distance = 900;
audio_drop_start = 300;

audio_falloff_set_model(audio_falloff_linear_distance);
audio_emitter_position(emitter, x, y, 0);
audio_emitter_falloff(emitter, audio_drop_start, audio_max_distance, 1);

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

