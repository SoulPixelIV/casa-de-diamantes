for (var i = 0; i < instance_number(enemy_obj); ++i) {
    enemy[i] = instance_find(enemy_obj, i);
	
	if (instance_exists(enemy[i])) {
		enemy[i].buffTimer = 0;
	}
}
