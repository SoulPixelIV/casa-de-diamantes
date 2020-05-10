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

global.dualBarettasAmmo = 0;
global.dualBarettasMag = 0;
global.dualBarettasCooldown = 3;
global.dualBarettasCooldownSave = global.dualBarettasCooldown;

global.shotgunAmmo = 0;
global.shotgunMag = 0;
global.shotgunCooldown = 15;
global.shotgunCooldownSave = global.shotgunCooldown;

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