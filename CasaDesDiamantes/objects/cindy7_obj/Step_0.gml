//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

if (global.tristramCindyQuestioningDialogueDone) {
	if (!global.dialogueDelayStart) {
		if (distance_to_object(player_obj) < 48 && !dialogueTriggered && player_obj.key_up_pressed && !global.pause && player_obj.grounded) {		
			part_emitter_destroy_all(global.partSystem);
			instance_destroy(player_obj);
			room_goto(upgrademenu);
		}
	}
}