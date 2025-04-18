/// @description Check Player
if (instance_exists(player_obj) && !global.dialogueDelayStart && !global.komoTristramConsumedDialogueDone) {
	if (!global.pause && !dialogueTriggered && player_obj.grounded) {
		global.dialogueDelayStart = true;
		dialogueTriggered = true;
		dialogueSystem_obj.scene43 = true;
		player_obj.movement = false;
		camera_obj.drawBlackborders = true;
	}
}
