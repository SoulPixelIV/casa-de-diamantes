if (open && !createdCloud) {
	if (instance_exists(voidMonsterSpawnerFINAL4_obj)) {
		voidMonsterSpawnerFINAL4_obj.x = voidMonsterPos4_obj.x;
		voidMonsterSpawnerFINAL4_obj.y = voidMonsterPos4_obj.y;
	}
	createdCloud = true;
}
