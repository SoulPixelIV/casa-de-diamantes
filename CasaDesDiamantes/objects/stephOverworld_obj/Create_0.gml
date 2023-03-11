startSelectionTimer = false;
selectionDelay = 160;

selectionDelaySave = selectionDelay;

lastWorld = global.currentWorld;

if (global.currentWorld == 0) {
	overworldIcon0_obj.draw = true;
	dest = overworldTrigger1_obj
}
if (global.currentWorld == 1) {
	overworldIcon1_obj.draw = true;
	dest = overworldTrigger2_obj
}
if (global.currentWorld == 2) {
	overworldIcon2_obj.draw = true;
	dest = overworldTrigger3_obj
}

x = dest.x;
y = dest.y;




