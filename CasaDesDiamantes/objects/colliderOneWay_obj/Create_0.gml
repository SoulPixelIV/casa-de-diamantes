yScale = image_yscale;
xScale = image_xscale;

//Spawn enemy only collider at same position
colEnemy = instance_create_layer(x, y, "TileCollider", colliderEnemyOnly_obj);
colEnemy.image_xscale = xScale;
colEnemy.image_yscale = yScale;

sprite_index = -1;