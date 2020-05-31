/// @desc Gets the active camera
/// @returns The active camera port [X, Y, Width, Height]

if(global.worldCustomCamera == undefined) {
	// Get active view camera
	var camera = camera_obj.camera;
	var cameraX = camera_obj.x - 242; //+10Px Safezone
	var cameraY = camera_obj.y - 140.5; //+10Px Safezone
	var cameraW = camera_obj.xScreenSize + 10; //+10Px Safezone
	var cameraH = camera_obj.yScreenSize + 10; //+10Px Safezone
	return [cameraX, cameraY, cameraW, cameraH];
}

return global.worldCustomCamera;