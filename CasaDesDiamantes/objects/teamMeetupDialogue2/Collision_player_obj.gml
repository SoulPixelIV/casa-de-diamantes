/// @description Check Player

if (global.dinnerDialogue) {
	if (instance_exists(player_obj) && !global.dialogueDelayStart && !global.meeting2Dialogue) {
		if (!global.pause && !dialogueTriggered && player_obj.grounded) {
			global.dialogueDelayStart = true;
			dialogueTriggered = true;
			dialogueSystem_obj.scene23 = true;
			player_obj.movement = false;
			camera_obj.drawBlackborders = true;
		}
	}
}