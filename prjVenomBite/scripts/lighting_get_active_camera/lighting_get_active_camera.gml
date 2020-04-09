/// @desc Gets the active camera
/// @returns The active camera port [X, Y, Width, Height]

if(global.worldCustomCamera == undefined) {
	// Get active view camera
	var camera = camera_obj.camera;
	var cameraX = player_obj.x - 500;
	var cameraY = player_obj.y - 300;
	var cameraW = 2000;
	var cameraH = 1700;
	return [cameraX, cameraY, cameraW, cameraH];
}

return global.worldCustomCamera;