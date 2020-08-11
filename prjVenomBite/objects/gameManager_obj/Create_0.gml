/// @description Variables

global.money = 0;
global.key = false;
global.scorepoints = 0;
global.multiplier = 1;
global.multiplierTimer = 300;
multiplierRun = false;

global.pistolAmmo = 0;
global.pistolMag = 0;
global.pistolCooldown = 1.3;
global.pistolCooldownSave = global.pistolCooldown;
global.pistolReload = 125;
global.pistolReloadSave = global.pistolReload;

global.dualBarettasCooldown = 2.2;
global.dualBarettasCooldownSave = global.dualBarettasCooldown;
global.dualBarettasReload = 160;
global.dualBarettasReloadSave = global.dualBarettasReload;

global.shotgunAmmo = 0;
global.shotgunMag = 0;
global.shotgunCooldown = 9;
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