horspeed = random_range(-1.2, 1.2);
verspeed = random_range(-0.8, -1.5);
sprite_index = choose(zombieChunk_spr, zombieChunk2_spr, zombieChunk3_spr);
image_speed = 0;
image_angle = random_range(0, 359);
image_xscale = choose(random_range(1, 1.3), random_range(-1, -1.3));
image_yscale = choose(random_range(1, 1.3), random_range(-1, -1.3));
gravityStrength = -0.058;
destroyTimer = 1620;
