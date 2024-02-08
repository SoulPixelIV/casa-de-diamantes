animationSpeed = 0.5;
dialogueTriggered = false;

if (global.storyAct != 0 || global.cutsceneCasinoIntroDone) {
	instance_destroy();
}