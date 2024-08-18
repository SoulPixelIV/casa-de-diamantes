/// @description Check Player
if (instance_exists(player_obj) && !global.dialogueDelayStart && !global.tristramDialogue) {
	if (!global.pause && !dialogueTriggered && player_obj.grounded) {
		global.dialogueDelayStart = true;
		dialogueTriggered = true;
		dialogueSystem_obj.scene21 = true;
		player_obj.movement = false;
		camera_obj.drawBlackborders = true;
	}
}
