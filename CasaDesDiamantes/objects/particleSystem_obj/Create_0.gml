//Particles

global.partSystem = part_system_create_layer("Particles", false);
global.partSystem2 = part_system_create_layer("Particles", false);

//Fire Sparks
global.fireSparkPart = part_type_create();
part_type_sprite(global.fireSparkPart, fireSpark_spr, true, true, true);
part_type_life(global.fireSparkPart, 300, 700);
part_type_size(global.fireSparkPart, 0.1, 0.2, 0, 0);
part_type_orientation(global.fireSparkPart, 0, 359, 1, 0, 1);
part_type_direction(global.fireSparkPart, 0, 359, 0, 3);
part_type_gravity(global.fireSparkPart, 0.0001, 270);

//Fog Cloud
global.fogPart = part_type_create();
part_type_sprite(global.fogPart, fogParticle_spr, true, true, true);
part_type_life(global.fogPart, 1300, 1800);
part_type_size(global.fogPart, 0.7, 1, 0, 0);
part_type_orientation(global.fogPart, 160, 200, 0, 0, 1);
part_type_alpha3(global.fogPart, 0, 0.02, 0);
part_type_colour2(global.fogPart, make_color_rgb(255, 204, 0), make_color_rgb(255, 245, 204));

//Grey Cloud
global.greyCloudPart = part_type_create();
part_type_sprite(global.greyCloudPart, fogParticle_spr, true, true, true);
part_type_life(global.greyCloudPart, 1300, 1800);
part_type_size(global.greyCloudPart, 0.7, 1, 0, 0);
part_type_orientation(global.greyCloudPart, 160, 200, 0, 0, 1);
part_type_alpha3(global.greyCloudPart, 0, 0.02, 0);
part_type_colour2(global.greyCloudPart, make_color_rgb(200, 200, 200), make_color_rgb(100, 100, 100));

//Flame Sparks
global.flameSparkPart = part_type_create();
part_type_sprite(global.flameSparkPart, flameSmall_spr, true, true, true);
part_type_life(global.flameSparkPart, 30, 100);
part_type_size(global.flameSparkPart, 0.5, 1, 0, 0.1);
part_type_orientation(global.flameSparkPart, 0, 359, 1, 0, 1);

//Flamethrower Sparks
global.flamethrowerSparkPart = part_type_create();
part_type_sprite(global.flamethrowerSparkPart, fireball_spr, true, false, true);
part_type_alpha3(global.flamethrowerSparkPart, 0, 0.8, 0);
part_type_life(global.flamethrowerSparkPart, 100, 140);
part_type_size(global.flamethrowerSparkPart, 0, 0, 0.01, 0.001);
part_type_orientation(global.flamethrowerSparkPart, 0, 359, 1, 0, 1);
part_type_speed(global.flamethrowerSparkPart, 0.8, 1.4, 0, 0.1);

//Glass Shards
global.glasShardsPart = part_type_create();
part_type_sprite(global.glasShardsPart, glasShard_spr, true, true, true);
part_type_life(global.glasShardsPart, 1000, 1500);
part_type_size(global.glasShardsPart, 0.1, 2.5, -0.015, 0);
part_type_orientation(global.glasShardsPart, 0, 359, 0.01, 0, 1);
part_type_direction(global.glasShardsPart, 220, 320, 0, 0);
part_type_speed(global.glasShardsPart, 0.8, 1.4, 0, 0.1);
part_type_gravity(global.glasShardsPart, 0.008, 270);

//Glass Shards Slowmo
global.glasShardsSlowmoPart = part_type_create();
part_type_sprite(global.glasShardsSlowmoPart, glasShard_spr, true, true, true);
part_type_life(global.glasShardsSlowmoPart, 10000, 10000);
part_type_size(global.glasShardsSlowmoPart, 0.1, 2.5, -0.015, 0);
part_type_orientation(global.glasShardsSlowmoPart, 0, 359, 0.01, 0, 1);
part_type_direction(global.glasShardsSlowmoPart, 120, 240, 0, 0);
part_type_speed(global.glasShardsSlowmoPart, 0.02, 0.03, 0, 0.005);

//Toxic Particles
global.toxicPart = part_type_create();
part_type_sprite(global.toxicPart, toxicCloud_spr, true, true, true);
part_type_life(global.toxicPart, 300, 700);
part_type_size(global.toxicPart, 0.8, 4, 0, 0);
part_type_orientation(global.toxicPart, 0, 359, 0.02, 0, 1);
part_type_direction(global.toxicPart, 0, 359, 0, 3);
part_type_gravity(global.toxicPart, 0.0001, 270);
part_type_color1(global.toxicPart, c_purple);
part_type_alpha3(global.toxicPart, 0, 0.25, 0);

//Toxic Green Particles
global.toxicPartGreen = part_type_create();
part_type_sprite(global.toxicPartGreen, toxicCloud_spr, true, true, true);
part_type_life(global.toxicPartGreen, 600, 950);
part_type_size(global.toxicPartGreen, 0.6, 2.5, 0, 0);
part_type_orientation(global.toxicPartGreen, 0, 359, 0.02, 0, 1);
part_type_direction(global.toxicPartGreen, 0, 359, 0, 3);
part_type_gravity(global.toxicPartGreen, 0.0001, 270);
part_type_color1(global.toxicPartGreen, c_green);
part_type_alpha3(global.toxicPartGreen, 0, 0.25, 0);

//Void Particles
global.voidPart = part_type_create();
part_type_sprite(global.voidPart, voidMonster_spr, true, true, true);
part_type_life(global.voidPart, 300, 700);
part_type_size(global.voidPart, 0.7, 3, 0, 0);
part_type_orientation(global.voidPart, 0, 359, 0.02, 0, 1);
part_type_direction(global.voidPart, 0, 359, 0, 3);
part_type_gravity(global.voidPart, 0.0001, 270);
part_type_color1(global.voidPart, c_red);
part_type_alpha3(global.voidPart, 0, 0.8, 0);

//Void Particles
global.voidMonsterPart = part_type_create();
part_type_sprite(global.voidMonsterPart, voidMonster_spr, true, true, true);
part_type_life(global.voidMonsterPart, 300, 700);
part_type_size(global.voidMonsterPart, 0.7, 3, 0, 0);
part_type_orientation(global.voidMonsterPart, 0, 359, 0.02, 0, 1);
part_type_direction(global.voidMonsterPart, 0, 359, 0, 3);
part_type_gravity(global.voidMonsterPart, 0.0001, 270);
part_type_color1(global.voidMonsterPart, c_red);
part_type_alpha3(global.voidMonsterPart, 0, 0.8, 0);

//Eyes Particles
global.eyesPart = part_type_create();
part_type_sprite(global.eyesPart, voidMonsterEyes_spr, true, true, true);
part_type_life(global.eyesPart, 300, 700);
part_type_size(global.eyesPart, 0.5, 1.5, 0, 0);
part_type_orientation(global.eyesPart, 0, 359, 0.02, 0, 1);
part_type_direction(global.eyesPart, 0, 359, 0, 3);
part_type_gravity(global.eyesPart, 0.0001, 270);
part_type_color1(global.eyesPart, c_white);
part_type_alpha3(global.eyesPart, 0, 0.8, 0);

//Respawn Particles
global.infectionPart = part_type_create();
part_type_sprite(global.infectionPart, toxicCloud_spr, true, true, true);
part_type_life(global.infectionPart, 300, 700);
part_type_size(global.infectionPart, 0.7, 1, 0, 0);
part_type_orientation(global.infectionPart, 0, 359, 0.02, 0, 1);
part_type_direction(global.infectionPart, 0, 180, 0, 3);
part_type_speed(global.infectionPart, -0.3, 0.3, -0.001, 0);
part_type_gravity(global.infectionPart, 0.0001, 270);
part_type_alpha3(global.infectionPart, 0, 0.75, 0);
part_type_color1(global.infectionPart, c_purple);

//Smoke Particles
global.smokePart = part_type_create();
part_type_sprite(global.smokePart, toxicCloud_spr, true, true, true);
part_type_life(global.smokePart, 300, 700);
part_type_size(global.smokePart, 0.7, 1, 0, 0);
part_type_orientation(global.smokePart, 0, 359, 0.02, 0, 1);
part_type_direction(global.smokePart, 0, 180, 0, 3);
part_type_speed(global.smokePart, -0.3, 0.3, -0.001, 0);
part_type_gravity(global.smokePart, 0.0001, 270);
part_type_alpha3(global.smokePart, 0, 0.75, 0);

global.smokePinkPart = part_type_create();
part_type_sprite(global.smokePinkPart, toxicCloud_spr, true, true, true);
part_type_life(global.smokePinkPart, 2500, 2500);
part_type_size(global.smokePinkPart, 1, 1.5, 0, 0);
part_type_orientation(global.smokePinkPart, 0, 359, 0.02, 0, 1);
part_type_direction(global.smokePinkPart, 0, 180, 0, 3);
part_type_speed(global.smokePinkPart, -0.3, 0.3, -0.001, 0);
part_type_color2(global.smokePinkPart, make_color_rgb(195, 111, 237), make_color_rgb(235, 0, 117));
part_type_gravity(global.smokePinkPart, 0.0001, 270);
part_type_alpha3(global.smokePinkPart, 0, 0.6, 0);

//Health
global.healthPart = part_type_create();
part_type_sprite(global.healthPart, healthSmall_spr, true, true, true);
part_type_life(global.healthPart, 2600, 1600);
part_type_size(global.healthPart, 0.5, 1, 0, 0);
part_type_orientation(global.healthPart, 0, 359, 0.02, 0, 1);
part_type_direction(global.healthPart, 0, 180, 0, 3);
part_type_speed(global.healthPart, -0.3, 0.3, -0.001, 0);
//part_type_color2(global.healthPart, make_color_rgb(195, 111, 237), make_color_rgb(235, 0, 117));
part_type_gravity(global.healthPart, 0.0001, 270);
part_type_alpha3(global.healthPart, 0, 1, 0);

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

global.ledYellowPart = part_type_create();
part_type_sprite(global.ledRedPart, fireSpark_spr, true, true, true);
part_type_colour_rgb(global.ledRedPart, 190, 255, 190, 255, 0, 0);
part_type_life(global.ledRedPart, 300, 700);
part_type_size(global.ledRedPart, 0.1, 0.2, 0, 0);
part_type_orientation(global.ledRedPart, 0, 359, 1, 0, 1);
part_type_direction(global.ledRedPart, 0, 359, 0, 3);
part_type_gravity(global.ledRedPart, 0.0001, 270);



global.ledBluePart = part_type_create();
part_type_sprite(global.ledBluePart, spark_spr, true, true, true);
part_type_colour_rgb(global.ledBluePart, 10, 40, 0, 0, 200, 255);
part_type_life(global.ledBluePart, 300, 700);
part_type_size(global.ledBluePart, 0.1, 0.4, 0, 0);
part_type_orientation(global.ledBluePart, 0, 359, 1, 0, 1);
part_type_direction(global.ledBluePart, 0, 359, 0, 3);
part_type_gravity(global.ledBluePart, 0.0001, 270);

global.bluePart = part_type_create();
part_type_sprite(global.bluePart, spark_spr, true, false, true);
part_type_life(global.bluePart, 12000, 12200);
part_type_size(global.bluePart, 0.2, 0.5, 0, 0);
part_type_colour_rgb(global.bluePart, 255, 255, 255, 255, 70, 90);
part_type_orientation(global.bluePart, 0, 359, 1, 0, 1);
part_type_direction(global.bluePart, 210, 240, 0, 3);
part_type_speed(global.bluePart, 0.04, 0.1, 0, 0.1);

global.yellowFallingPart = part_type_create();
part_type_sprite(global.yellowFallingPart, fireSpark_spr, true, true, true);
part_type_life(global.yellowFallingPart, 2000, 2600);
part_type_size(global.yellowFallingPart, 0.1, 0.2, 0, 0);
part_type_orientation(global.yellowFallingPart, 0, 359, 1, 0, 1);
part_type_direction(global.yellowFallingPart, 270, 359, 0, 3);
part_type_speed(global.yellowFallingPart, 0.07, 0.11, 0, 0.02);

global.goldenPart = part_type_create();
part_type_sprite(global.goldenPart, fireSpark_spr, true, true, true);
part_type_life(global.goldenPart, 2000, 2600);
part_type_size(global.goldenPart, 0.1, 0.2, 0, 0);
part_type_alpha3(global.goldenPart, 0, 0.2, 1);
part_type_orientation(global.goldenPart, 0, 359, 1, 0, 1);

global.greenPart = part_type_create();
part_type_sprite(global.greenPart, spark_spr, true, false, true);
part_type_life(global.greenPart, 6000, 6200);
part_type_size(global.greenPart, 0.2, 0.5, 0, 0);
part_type_colour_rgb(global.greenPart, 130, 170, 255, 255, 70, 90);
part_type_orientation(global.greenPart, 0, 359, 1, 0, 1);
part_type_direction(global.greenPart, 0, 180, 0, 3);
part_type_speed(global.greenPart, 0.08, 0.12, 0, 0.03);

global.greenStillPart = part_type_create();
part_type_sprite(global.greenStillPart, spark_spr, true, false, true);
part_type_life(global.greenStillPart, 6000, 6200);
part_type_size(global.greenStillPart, 0.2, 0.5, 0, 0);
part_type_colour_rgb(global.greenStillPart, 70, 90, 255, 255, 70, 90);
part_type_orientation(global.greenStillPart, 0, 359, 1, 0, 1);
part_type_direction(global.greenStillPart, 0, 359, 0, 3);
part_type_speed(global.greenStillPart, 0.001, 0.002, 0, 0.0005);

global.whiteStillPart = part_type_create();
part_type_sprite(global.whiteStillPart, spark_spr, true, false, true);
part_type_life(global.whiteStillPart, 6000, 6200);
part_type_size(global.whiteStillPart, 0.2, 0.5, 0, 0);
part_type_orientation(global.whiteStillPart, 0, 359, 1, 0, 1);
part_type_direction(global.whiteStillPart, 0, 359, 0, 3);
part_type_speed(global.whiteStillPart, 0.0002, 0.0005, 0, 0.0002);

global.whiteMovingLeftPart = part_type_create();
part_type_sprite(global.whiteMovingLeftPart, spark_spr, true, false, true);
part_type_life(global.whiteMovingLeftPart, 6000, 6200);
part_type_size(global.whiteMovingLeftPart, 0.2, 0.5, 0, 0);
part_type_orientation(global.whiteMovingLeftPart, 0, 359, 1, 0, 1);
part_type_direction(global.whiteMovingLeftPart, 175, 185, 0, 3);
part_type_speed(global.whiteMovingLeftPart, 0.5, 1, 0, 0.0002);

global.radiationStillPart = part_type_create();
part_type_sprite(global.radiationStillPart, spark_spr, true, false, true);
part_type_life(global.radiationStillPart, 6000, 6200);
part_type_size(global.radiationStillPart, 0.2, 0.5, 0, 0);
part_type_orientation(global.radiationStillPart, 0, 359, 1, 0, 1);
part_type_direction(global.radiationStillPart, 0, 359, 0, 3);
part_type_speed(global.radiationStillPart, 0.0002, 0.0005, 0, 0.0002);
part_type_colour_rgb(global.radiationStillPart, 0, 00, 255, 255, 0, 0);

global.playerPart = part_type_create();
part_type_sprite(global.playerPart, fireSpark_spr, true, true, true);
part_type_colour_rgb(global.playerPart, 55, 120, 0, 0, 120, 155);
part_type_life(global.playerPart, 90, 140);
part_type_size(global.playerPart, 0.7, 1, 0, 0);
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
part_type_life(global.fireworkGreenPart, 800, 1200);
part_type_size(global.fireworkGreenPart, 0.5, 1, -0.0025, 0);
part_type_orientation(global.fireworkGreenPart, 0, 359, 1, 0, 1);
part_type_direction(global.fireworkGreenPart, 0, 360, 0, 0);
part_type_gravity(global.fireworkGreenPart, 0.0025, 270);
part_type_speed(global.fireworkGreenPart, 0.2, 0.35, -0.003, 0);

global.fireworkPinkPart = part_type_create();
part_type_sprite(global.fireworkPinkPart, spark_spr, true, true, true);
part_type_colour_rgb(global.fireworkPinkPart, 200, 255, 0, 0, 200, 255);
part_type_life(global.fireworkPinkPart, 800, 1200);
part_type_size(global.fireworkPinkPart, 0.5, 1, -0.0025, 0);
part_type_orientation(global.fireworkPinkPart, 0, 359, 1, 0, 1);
part_type_direction(global.fireworkPinkPart, 0, 360, 0, 0);
part_type_gravity(global.fireworkPinkPart, 0.0025, 270);
part_type_speed(global.fireworkPinkPart, 0.2, 0.35, -0.003, 0);

global.fireworkBluePart = part_type_create();
part_type_sprite(global.fireworkBluePart, spark_spr, true, true, true);
part_type_colour_rgb(global.fireworkBluePart, 0, 0, 0, 0, 200, 255);
part_type_life(global.fireworkBluePart, 800, 1200);
part_type_size(global.fireworkBluePart, 0.5, 1, -0.0025, 0);
part_type_orientation(global.fireworkBluePart, 0, 359, 1, 0, 1);
part_type_direction(global.fireworkBluePart, 0, 360, 0, 0);
part_type_gravity(global.fireworkBluePart, 0.0025, 270);
part_type_speed(global.fireworkBluePart, 0.2, 0.35, -0.003, 0);

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

global.coinGreenPart = part_type_create();
part_type_sprite(global.coinGreenPart, particleBlue_spr, true, true, true);
part_type_colour_rgb(global.coinGreenPart, 0, 0, 190, 255, 0, 0);
part_type_life(global.coinGreenPart, 100, 140);
part_type_size(global.coinGreenPart, 0.1, 0.2, 0, 0);
part_type_orientation(global.coinGreenPart, 0, 359, 1, 0, 1);
part_type_direction(global.coinGreenPart, 0, 360, 0, 3);
part_type_speed(global.coinGreenPart, 0.1, 0.16, 0, 0.1);

//Leaves

global.pinkLeaves = part_type_create();
part_type_sprite(global.pinkLeaves, pinkLeave_spr, false, false, true);
part_type_life(global.pinkLeaves, 1400, 2600);
part_type_size(global.pinkLeaves, 0.5, 1, 0, 0);
part_type_orientation(global.pinkLeaves, 0, 359, 1, 0, 1);
part_type_direction(global.pinkLeaves, 180, 270, 0, 3);
part_type_speed(global.pinkLeaves, 0.04, 0.1, 0, 0.1);

//Laser
global.lasergatePart = part_type_create();
part_type_sprite(global.lasergatePart, spark_spr, true, true, true);
part_type_colour_rgb(global.lasergatePart, 200, 255, 0, 0, 0, 0);
part_type_life(global.lasergatePart, 9999945, 9999990);
part_type_size(global.lasergatePart, 0.1, 0.2, 0, 0);
part_type_orientation(global.lasergatePart, 0, 359, 1, 0, 1);
part_type_direction(global.lasergatePart, 0, 180, 0, 0);
part_type_gravity(global.lasergatePart, 0.03, 270);
part_type_speed(global.lasergatePart, 0.4, 0.8, 0, 0);