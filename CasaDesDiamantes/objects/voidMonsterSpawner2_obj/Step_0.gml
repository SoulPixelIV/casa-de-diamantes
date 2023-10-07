if (open && !createdCloud) {
	instance_create_layer(voidMonsterPos2_obj.x, voidMonsterPos2_obj.y, "ForegroundObjects", voidMonster2_obj);
	instance_create_layer(voidMonsterPos3_obj.x, voidMonsterPos3_obj.y, "ForegroundObjects", voidMonster3_obj);
	createdCloud = true;
}
