switch (argument0)
{
	case 0:
		global.pickedWeapon[0] = true;
		global.pickedWeapon[1] = false;
		global.pickedWeapon[2] = false;
		
		global.unlockedWeapon[0] = true;
		//instance_create_layer(player_obj.x, player_obj.y, "Instances", spotLight_obj);
		break;
	case 1:
		global.pickedWeapon[1] = true;
		global.pickedWeapon[0] = false;
		global.pickedWeapon[2] = false;
		
		global.unlockedWeapon[1] = true;
		//instance_create_layer(player_obj.x, player_obj.y, "Instances", spotLight_obj);
		break;
	case 2:
		global.pickedWeapon[1] = false;
		global.pickedWeapon[0] = false;
		global.pickedWeapon[2] = true;
		
		global.unlockedWeapon[2] = true;
		//instance_create_layer(player_obj.x, player_obj.y, "Instances", spotLight_obj);
		break;
}