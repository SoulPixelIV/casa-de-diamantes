if (instance_exists(cutieplusSteph_obj)) {
	if (dialogue == 0) {
		if (!global.cupyDialogue1Done && !dialogueTriggered) {
			dialogueSystem_obj.scene12 = true;
			dialogueTriggered = true;
		}
	}
	if (dialogue == 1) {
		if (!global.cupyDialogue2Done && !dialogueTriggered) {
			dialogueSystem_obj.scene13 = true;
			dialogueTriggered = true;
		}
	}
	if (dialogue == 2) {
		if (!global.cupyDialogue3Done && !dialogueTriggered) {
			dialogueSystem_obj.scene14 = true;
			dialogueTriggered = true;
		}
	}
	if (dialogue == 3) {
		if (!global.cupyDialogue4Done && !dialogueTriggered) {
			dialogueSystem_obj.scene15 = true;
			dialogueTriggered = true;
		}
	}
	if (dialogue == 4) {
		if (!global.cupyDialogue5Done && !dialogueTriggered) {
			dialogueSystem_obj.scene16 = true;
			dialogueTriggered = true;
		}
	}
	if (dialogue == 5) {
		if (!global.cupyDialogue6Done && !dialogueTriggered) {
			dialogueSystem_obj.scene17 = true;
			dialogueTriggered = true;
		}
	}
}
