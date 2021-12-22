/// @description Variables

global.spawn = 0;
global.money = 0;
global.syringes = 0;
global.hasWarpzoneKey = false;
global.key = false;
global.scorepoints = 0;
global.multiplier = 1;
global.multiplierTimer = 700;
global.multiplierTimerSave = global.multiplierTimer;
global.timer = 0;
multiplierRun = false;

global.pwlevel2UnlockedElevator = false;
global.pwlevel3UnlockedElevator = false;

global.pistolAmmo = 0;
global.pistolAmmoMax = 16;
global.pistolCooldown = 3;
global.pistolCooldownSave = global.pistolCooldown;
global.pistolReload = 300;
global.pistolReloadSave = global.pistolReload;

global.dualBarettasCooldown = 4;
global.dualBarettasCooldownSave = global.dualBarettasCooldown;
global.dualBarettasReload = 500;
global.dualBarettasReloadSave = global.dualBarettasReload;

global.shotgunAmmo = 0;
global.shotgunAmmoMax = 6;
global.shotgunCooldown = 14;
global.shotgunCooldownSave = global.shotgunCooldown;
global.shotgunReload = 750;
global.shotgunReloadSave = global.shotgunReload;

global.sniperAmmo = 0;
global.sniperAmmoMax = 8;
global.sniperCooldown = 25;
global.sniperCooldownSave = global.sniperCooldown;
global.sniperReload = 600;
global.sniperReloadSave = global.sniperReload;

global.bowAmmo = 0;
global.bowAmmoMax = 8;
global.bowCooldown = 5;
global.bowCooldownSave = global.bowCooldown;
global.bowReload = 600;
global.bowReloadSave = global.bowReload;

global.hat = choose(beret_spr, marcusHat_spr, noone);
global.top1 = choose(smokingTop_spr, glitterTop_spr, noone);
global.top2 = choose(smokingJacketEquipped_spr, warmJacketEquipped_spr, noone);
global.bottom = choose(smokingBottom_spr, glitterBottom_spr, noone);
global.shoes = noone;
global.arm = choose(smokingJacketArm_spr, warmJacketArm_spr, noone);

global.hatlist = ["Beret", "Marcus Hat", "Nothing"];
global.top1list = ["Smoking Top", "Glitter Top", "Nothing"];
global.top2list = ["Smoking Jacket", "Warm Jacket", "Nothing"];
global.bottomlist = ["Smoking Bottom", "Glitter Bottom", "Nothing"];
global.shoeslist = ["Nothing"];
global.armlist = ["Smoking Jacket Arms", "Warm Jacket Arms", "Nothing"];

global.hatName = [beret_spr, marcusHat_spr, noone];
global.top1Name = [smokingTop_spr, glitterTop_spr, noone];
global.top2Name = [smokingJacket_spr, warmJacket_spr, noone];
global.bottomName = [smokingBottom_spr, glitterBottom_spr, noone];
global.shoesName = [noone];
global.armName = [smokingJacketArm_spr, warmJacketArm_spr, noone];

enum pickedWeapon {
	unarmed,
	pistol,
	dualBarettas,
	shotgun,
	sniper,
	bow
	}
	
global.currentWeapon = pickedWeapon.unarmed;

global.unlockedWeapon[0] = false;
global.unlockedWeapon[1] = false;
global.unlockedWeapon[2] = false;
global.unlockedWeapon[3] = false;
global.unlockedWeapon[4] = false;