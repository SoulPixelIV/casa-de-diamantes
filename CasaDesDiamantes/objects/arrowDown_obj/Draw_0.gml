if (open) {
	draw_self();
}

if (storyAct != global.storyAct) {
	instance_destroy();
}

if (storyAct == 0) {
	if (arrowNumber == 0) {
		if (global.arrowLevel2Done) {
			instance_destroy();
		}
	}

	if (arrowNumber == 1) {
		if (global.arrowVIPDone) {
			instance_destroy();
		}
	}

	if (arrowNumber == 2) {
		if (global.arrowCindyDone) {
			instance_destroy();
		}
	}
}

if (storyAct == 1) {
	if (arrowNumber == 0) {
		if (global.firstmeetingDialogue) {
			instance_destroy();
		}
	}
	
	if (arrowNumber == 1) {
		if (global.dinnerDialogue) {
			instance_destroy();
		}
		if (!global.firstmeetingDialogue) {
			instance_destroy();
		}
	}
}