if (open && !createdCloud) {
	if (instance_exists(voidMonsterSpawnerFINAL2_obj)) {
		voidMonsterSpawnerFINAL2_obj.x = voidMonsterPos3_obj.x;
		voidMonsterSpawnerFINAL2_obj.y = voidMonsterPos3_obj.y;
	}
	if (instance_exists(voidMonsterSpawnerFINAL3_obj)) {
		voidMonsterSpawnerFINAL3_obj.x = voidMonsterPos2_obj.x;
		voidMonsterSpawnerFINAL3_obj.y = voidMonsterPos2_obj.y;
	}
	createdCloud = true;
}
