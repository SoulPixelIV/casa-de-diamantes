growSpeed = 1.25;

stopTimer = 700;
despawnTimer = 1700;

randNum = choose(0,1,2);

repeat(randNum) {
	instance_create_layer(x, y, "ForegroundObjects", plantBossFlower_obj);
}




