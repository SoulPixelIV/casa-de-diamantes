/// @desc Gets the active camera
/// @returns The active camera port [X, Y, Width, Height]
function lighting_get_active_camera() {

	if(global.worldCustomCamera == undefined) {
		// Get active view camera
		if (instance_exists(camera_obj))
		{
			var camera = camera_obj.camera;
			var cameraX = camera_obj.x - 432; //+200Px Safezone
			var cameraY = camera_obj.y - 230.5; //+100Px Safezone
			var cameraW = camera_obj.xScreenSize + 200; //+200Px Safezone
			var cameraH = camera_obj.yScreenSize + 100; //+100Px Safezone
		}

		return [cameraX, cameraY, cameraW, cameraH];
	}

	return global.worldCustomCamera;


}
