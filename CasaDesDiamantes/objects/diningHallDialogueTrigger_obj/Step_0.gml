/// @description Check Player
if (instance_exists(player_obj) && !global.dialogueDelayStart) {
	if (place_meeting(x, y, steph2_obj)) {
		if (!global.pause && !dialogueTriggered) {
			global.dialogueDelayStart = true;
			dialogueTriggered = true;
			dialogueSystem_obj.scene19 = true;
			player_obj.movement = false;
			camera_obj.drawBlackborders = true;
		}
	}
}
