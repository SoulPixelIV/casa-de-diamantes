//Particles

global.partSystem = part_system_create();

//Fire Sparks
global.fireSparkPart = part_type_create();
part_type_sprite(global.fireSparkPart, fireSpark_spr, true, true, true);
part_type_life(global.fireSparkPart, 300, 700);
part_type_size(global.fireSparkPart, 0.1, 0.2, 0, 0);
part_type_orientation(global.fireSparkPart, 0, 359, 1, 0, 1);
part_type_direction(global.fireSparkPart, 0, 359, 0, 3);
part_type_gravity(global.fireSparkPart, 0.0001, 270);

global.fireSparkBigPart = part_type_create();
part_type_sprite(global.fireSparkBigPart, fireSpark_spr, true, true, true);
part_type_life(global.fireSparkBigPart, 300, 700);
part_type_size(global.fireSparkBigPart, 0.2, 0.4, 0, 0);
part_type_orientation(global.fireSparkBigPart, 0, 359, 1, 0, 1);
part_type_direction(global.fireSparkBigPart, 0, 359, 0, 3);
part_type_gravity(global.fireSparkBigPart, 0.0001, 270);

//LED Particles
global.ledRedPart = part_type_create();
part_type_sprite(global.ledRedPart, fireSpark_spr, true, true, true);
part_type_colour_rgb(global.ledRedPart, 190, 255, 0, 0, 0, 0);
part_type_life(global.ledRedPart, 300, 700);
part_type_size(global.ledRedPart, 0.1, 0.2, 0, 0);
part_type_orientation(global.ledRedPart, 0, 359, 1, 0, 1);
part_type_direction(global.ledRedPart, 0, 359, 0, 3);
part_type_gravity(global.ledRedPart, 0.0001, 270);

//BROKEN
global.ledBluePart = part_type_create();
part_type_sprite(global.ledBluePart, fireSpark_spr, true, true, true);
part_type_colour_rgb(global.ledBluePart, 0, 0, 0, 0, 0, 300);
part_type_life(global.ledBluePart, 300, 700);
part_type_size(global.ledBluePart, 0.1, 0.2, 0, 0);
part_type_orientation(global.ledBluePart, 0, 359, 1, 0, 1);
part_type_direction(global.ledBluePart, 0, 359, 0, 3);
part_type_gravity(global.ledBluePart, 0.0001, 270);

global.bluePart = part_type_create();
part_type_sprite(global.bluePart, particleBlue_spr, true, true, true);
part_type_life(global.bluePart, 700, 1400);
part_type_size(global.bluePart, 0.1, 0.2, 0, 0);
part_type_orientation(global.bluePart, 0, 359, 1, 0, 1);
part_type_direction(global.bluePart, 180, 270, 0, 3);
part_type_speed(global.bluePart, 0.04, 0.1, 0, 0.1);

global.playerPart = part_type_create();
part_type_sprite(global.playerPart, fireSpark_spr, true, true, true);
part_type_colour_rgb(global.playerPart, 190, 255, 0, 0, 120, 255);
part_type_life(global.playerPart, 90, 140);
part_type_size(global.playerPart, 0.1, 0.2, 0, 0);
part_type_orientation(global.playerPart, 0, 359, 1, 0, 1);
part_type_direction(global.playerPart, 0, 359, 0, 3);
part_type_gravity(global.playerPart, 0.0001, 270);
part_type_speed(global.playerPart, 0.01, 0.02, 0, 0.003);

//Blood Particles
global.bloodPart = part_type_create();
part_type_sprite(global.bloodPart, fireSpark_spr, true, true, true);
part_type_colour_rgb(global.bloodPart, 140, 255, 0, 0, 0, 0);
part_type_life(global.bloodPart, 40, 110);
part_type_size(global.bloodPart, 0.3, 0.5, 0, 0);
part_type_orientation(global.bloodPart, 0, 359, 1, 0, 1);
part_type_direction(global.bloodPart, 60, 120, 0, 0);
part_type_gravity(global.bloodPart, 0.01, 270);
part_type_speed(global.bloodPart, 1, 2, 0, 0);

//Firework
global.fireworkGreenPart = part_type_create();
part_type_sprite(global.fireworkGreenPart, spark_spr, true, true, true);
part_type_colour_rgb(global.fireworkGreenPart, 0, 0, 200, 255, 0, 0);
part_type_life(global.fireworkGreenPart, 170, 230);
part_type_size(global.fireworkGreenPart, 0.5, 1, -0.0025, 0);
part_type_orientation(global.fireworkGreenPart, 0, 359, 1, 0, 1);
part_type_direction(global.fireworkGreenPart, 0, 360, 0, 0);
part_type_gravity(global.fireworkGreenPart, 0.0025, 270);
part_type_speed(global.fireworkGreenPart, 0.8, 1.3, -0.003, 0);

global.fireworkPinkPart = part_type_create();
part_type_sprite(global.fireworkPinkPart, spark_spr, true, true, true);
part_type_colour_rgb(global.fireworkPinkPart, 200, 255, 0, 0, 200, 255);
part_type_life(global.fireworkPinkPart, 170, 230);
part_type_size(global.fireworkPinkPart, 0.5, 1, -0.0025, 0);
part_type_orientation(global.fireworkPinkPart, 0, 359, 1, 0, 1);
part_type_direction(global.fireworkPinkPart, 0, 360, 0, 0);
part_type_gravity(global.fireworkPinkPart, 0.0025, 270);
part_type_speed(global.fireworkPinkPart, 0.8, 1.3, -0.003, 0);

global.fireworkBluePart = part_type_create();
part_type_sprite(global.fireworkBluePart, spark_spr, true, true, true);
part_type_colour_rgb(global.fireworkBluePart, 0, 0, 0, 0, 200, 255);
part_type_life(global.fireworkBluePart, 170, 300);
part_type_size(global.fireworkBluePart, 0.5, 1, -0.0015, 0);
part_type_orientation(global.fireworkBluePart, 0, 359, 1, 0, 1);
part_type_direction(global.fireworkBluePart, 0, 360, 0, 0);
part_type_gravity(global.fireworkBluePart, 0.0035, 270);
part_type_speed(global.fireworkBluePart, 1.2, 1.7, -0.004, 0);

//Coins

global.coinBluePart = part_type_create();
part_type_sprite(global.coinBluePart, particleBlue_spr, true, true, true);
part_type_life(global.coinBluePart, 100, 140);
part_type_size(global.coinBluePart, 0.1, 0.2, 0, 0);
part_type_orientation(global.coinBluePart, 0, 359, 1, 0, 1);
part_type_direction(global.coinBluePart, 0, 360, 0, 3);
part_type_speed(global.coinBluePart, 0.1, 0.16, 0, 0.1);

global.coinRedPart = part_type_create();
part_type_sprite(global.coinRedPart, particleBlue_spr, true, true, true);
part_type_colour_rgb(global.coinRedPart, 190, 255, 0, 0, 0, 0);
part_type_life(global.coinRedPart, 100, 140);
part_type_size(global.coinRedPart, 0.1, 0.2, 0, 0);
part_type_orientation(global.coinRedPart, 0, 359, 1, 0, 1);
part_type_direction(global.coinRedPart, 0, 360, 0, 3);
part_type_speed(global.coinRedPart, 0.1, 0.16, 0, 0.1);