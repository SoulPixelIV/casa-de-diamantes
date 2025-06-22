if (open && !createdCloud) {
	if (instance_exists(voidMonsterSpawnerFINAL_obj)) {
		voidMonsterSpawnerFINAL_obj.x = voidMonsterPos1_obj.x;
		voidMonsterSpawnerFINAL_obj.y = voidMonsterPos1_obj.y;
	}
	createdCloud = true;
}
