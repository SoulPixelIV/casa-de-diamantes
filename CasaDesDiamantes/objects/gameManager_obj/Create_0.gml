/// @description Variables

global.spawn = 0;
global.money = 0;
global.key = false;
global.scorepoints = 0;
global.multiplier = 1;
global.multiplierTimer = 300;
multiplierRun = false;

global.pistolAmmo = 0;
global.pistolMag = 0;
global.pistolCooldown = 3;
global.pistolCooldownSave = global.pistolCooldown;
global.pistolReload = 300;
global.pistolReloadSave = global.pistolReload;

global.dualBarettasCooldown = 4;
global.dualBarettasCooldownSave = global.dualBarettasCooldown;
global.dualBarettasReload = 500;
global.dualBarettasReloadSave = global.dualBarettasReload;

global.shotgunAmmo = 0;
global.shotgunMag = 0;
global.shotgunCooldown = 14;
global.shotgunCooldownSave = global.shotgunCooldown;
global.shotgunReload = 750;
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