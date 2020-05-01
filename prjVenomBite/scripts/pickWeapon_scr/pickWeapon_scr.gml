switch (argument0)
{
	case 0:
		global.currentWeapon = gameManager_obj.pickedWeapon.pistol;	
		global.unlockedWeapon[0] = true;
		break;
	case 1:
		global.currentWeapon = gameManager_obj.pickedWeapon.dualBarettas;		
		global.unlockedWeapon[1] = true;
		break;
	case 2:
		global.currentWeapon = gameManager_obj.pickedWeapon.shotgun;	
		global.unlockedWeapon[2] = true;
		break;
}
player_obj.unarmed = false;
reload_scr();