/// @description Update the simulation

dt = (delta_time / 1000000) * globalSettings_obj.TARGET_FRAMERATE;

if (vertex != noone && stick != noone) {
	#region Update vertices
		for (var i = 0; i < array_height_2d(vertex); i++) {
		// Get vertex info
		var px = vertex[i, 0];
		var pxOld = vertex[i, 1];
		var py = vertex[i, 2];
		var pyOld = vertex[i, 3];
		var radius = vertex[i, 4];
		
		// Move vertex
		vx[i] = (px - pxOld) * 0.999;
		pxOld = px;
		if (py >= room_height - radius) {
			// Floor friction
			vx[i] *= frict * dt;
			vy[i] *= frict * dt;
		}
		px += vx[i];
		
		vy[i] = (py - pyOld) * 0.999 + grav;
		pyOld = py;
		py += vy[i];
		
		if (!vertex[i, 5]) {
			vertex[i, 0] = px;
			vertex[i, 1] = pxOld;
			vertex[i, 2] = py;
			vertex[i, 3] = pyOld;
		}
	}
	#endregion
	repeat(simulationMode == 0 ? 4 : 1) {
		#region Update sticks
		for (var i = 0; i < array_height_2d(stick); i++) {
			if (stick[i, 3]) {
				var v1 = stick[i, 0];
				var v2 = stick[i, 1];
				var dx = vertex[v1, 0] - vertex[v2, 0];
				var dy = vertex[v1, 2] - vertex[v2, 2];
				
				var d1 = stick[i, 2];
				var d2 = sqrt((dx * dx) + (dy * dy));
				
				var diff = d2 - d1;
				if (simulationMode == 0 || diff > 0) {
					var percent = (diff / d2) / 2;
					if (simulationMode == 1 && percent >= maxTension) {
						stick[i, 3] = false;
					} else {
						var offx = dx * percent;
						var offy = dy * percent;
						
						if (!vertex[v1, 5]) {
							vertex[v1, 0] -= offx;
							vertex[v1, 2] -= offy;
						}
						if (!vertex[v2, 5]) {
							vertex[v2, 0] += offx;
							vertex[v2, 2] += offy;
						}
					}
				}
			}
		}
		#endregion
		#region Constrain points
		for (var i = 0; i < array_height_2d(vertex); i++) {
			var px = vertex[i, 0];
			var pxOld = vertex[i, 1];
			var py = vertex[i, 2];
			var pyOld = vertex[i, 3];
			var radius = vertex[i, 4];
			
			// Bounce room end
			if (px > room_width - radius) {
				px = (room_width - radius);
				pxOld = px + vx[i] * 0.9 * dt;
			} else if (px < radius) {
				px = radius;
				pxOld = px + vx[i] * 0.9 * dt;
			}
			if (py > room_height - radius) {
				py = (room_height - radius);
				pyOld = py + vy[i] * 0.9 * dt;
			} else if (py < radius) {
				py = radius;
				pyOld = py + vy[i] * 0.9 * dt;
			}
			
			// Update coordinates
			if (!vertex[i, 5]) {
				vertex[i, 0] = px;
				vertex[i, 1] = pxOld;
				vertex[i, 2] = py;
				vertex[i, 3] = pyOld;
			}
		}
		#endregion
	}
}

/*
#region Wind
if (mouse_check_button(mb_left)) {
	for (var i = 0; i < array_height_2d(vertex); i++) {
		if (!vertex[i, 5] && point_distance(mouse_x, mouse_y, vertex[i, 0], vertex[i, 2]) <= 25) { // Wind distance
			var dir = point_direction(mouse_x, mouse_y, vertex[i, 0], vertex[i, 2]);
			vertex[i, 0] += lengthdir_x(3, dir) * dt;
			vertex[i, 2] += lengthdir_y(3, dir) * dt;
		}
	}
}
#endregion
*/
#region Cut
if (instance_exists(bulletPistol_obj))
{
	var closest = -1, dist = 5; // Cut distance
	for (var i = 0; i < array_height_2d(stick); i++) {
		if (stick[i, 3]) {
			var v1 = stick[i, 0];
			var v2 = stick[i, 1];
			var v1x = vertex[v1, 0];
			var v1y = vertex[v1, 2];
			var v2x = vertex[v2, 0];
			var v2y = vertex[v2, 2];
			
			var ndist = point_distance(bulletPistol_obj.x, bulletPistol_obj.y, v1x - (v1x - v2x) / 2, v1y - (v1y - v2y) / 2);
			
			if (ndist < dist) {
				dist = ndist;
				closest = i;
			}
		}
	}
	if (closest != -1) {
		stick[closest, 3] = false;
	}
}
#endregion
