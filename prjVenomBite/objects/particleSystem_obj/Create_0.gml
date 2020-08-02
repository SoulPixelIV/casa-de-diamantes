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
part_type_colour_rgb(global.ledBluePart, 0, 0, 0, 0, 0, 50);
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
