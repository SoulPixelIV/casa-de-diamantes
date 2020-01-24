switch (argument0)
{
	case 0:
		global.currentWeapon = gameManager_obj.pickedWeapon.pistol;
		
		global.unlockedWeapon[0] = true;
		//instance_create_layer(player_obj.x, player_obj.y, "Instances", spotLight_obj);
		break;
	case 1:
		global.currentWeapon = gameManager_obj.pickedWeapon.dualBarettas;
		
		global.unlockedWeapon[1] = true;
		//instance_create_layer(player_obj.x, player_obj.y, "Instances", spotLight_obj);
		break;
	case 2:
		global.currentWeapon = gameManager_obj.pickedWeapon.shotgun;
		
		global.unlockedWeapon[2] = true;
		//instance_create_layer(player_obj.x, player_obj.y, "Instances", spotLight_obj);
		break;
}
player_obj.unarmed = false;