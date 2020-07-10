/// @description Variables

global.money = 0;
global.key = false;
global.scorepoints = 0;
global.multiplier = 1;
global.multiplierTimer = 300;
multiplierRun = false;

global.pistolAmmo = 0;
global.pistolMag = 0;
global.pistolCooldown = 2;
global.pistolCooldownSave = global.pistolCooldown;
global.pistolReload = 125;
global.pistolReloadSave = global.pistolReload;

global.dualBarettasCooldown = 3;
global.dualBarettasCooldownSave = global.dualBarettasCooldown;
global.dualBarettasReload = 160;
global.dualBarettasReloadSave = global.dualBarettasReload;

global.shotgunAmmo = 0;
global.shotgunMag = 0;
global.shotgunCooldown = 15;
global.shotgunCooldownSave = global.shotgunCooldown;
global.shotgunReload = 360;
global.shotgunReloadSave = global.shotgunReload;

enum pickedWeapon {
	unarmed,
	pistol,
	dualBarettas,
	shotgun
	}
	
global.currentWeapon = pickedWeapon.unarmed;

global.unlockedWeapon[0] = false;
global.unlockedWeapon[1] = false;
global.unlockedWeapon[2] = false;

//Particles
global.partSystem = part_system_create();
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

global.ledRedPart = part_type_create();
part_type_sprite(global.ledRedPart, fireSpark_spr, true, true, true);
part_type_colour_rgb(global.ledRedPart, 190, 255, 0, 0, 0, 0);
part_type_life(global.ledRedPart, 300, 700);
part_type_size(global.ledRedPart, 0.1, 0.2, 0, 0);
part_type_orientation(global.ledRedPart, 0, 359, 1, 0, 1);
part_type_direction(global.ledRedPart, 0, 359, 0, 3);
part_type_gravity(global.ledRedPart, 0.0001, 270);

global.bluePart = part_type_create();
part_type_sprite(global.bluePart, particleBlue_spr, true, true, true);
part_type_life(global.bluePart, 700, 1400);
part_type_size(global.bluePart, 0.1, 0.2, 0, 0);
part_type_orientation(global.bluePart, 0, 359, 1, 0, 1);
part_type_direction(global.bluePart, 180, 270, 0, 3);
part_type_speed(global.bluePart, 0.04, 0.1, 0, 0.1);


