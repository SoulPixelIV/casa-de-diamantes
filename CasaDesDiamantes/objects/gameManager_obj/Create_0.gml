/// @description Variables

global.spawn = 0;
global.money = 3000;
global.syringes = 0;
global.key = false;
global.scorepoints = 0;
global.multiplier = 1;
global.multiplierTimer = 300;
global.timer = 0;
multiplierRun = false;

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

global.hat = choose(beret_spr, noone);
global.top1 = choose(smokingTop_spr, noone);
global.top2 = choose(smokingJacketEquipped_spr, warmJacketEquipped_spr, noone);
global.bottom = choose(smokingBottom_spr, noone);
global.shoes = noone;
global.arm = choose(smokingJacketArm_spr, warmJacketArm_spr, noone);

enum pickedWeapon {
	unarmed,
	pistol,
	dualBarettas,
	shotgun,
	sniper
	}
	
global.currentWeapon = pickedWeapon.unarmed;

global.unlockedWeapon[0] = false;
global.unlockedWeapon[1] = false;
global.unlockedWeapon[2] = false;
global.unlockedWeapon[3] = false;