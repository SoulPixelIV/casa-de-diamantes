/// @description Initialize the verlet simulation
vertex = noone; // 0 = x, 1 = xOld, 2 = y, 3 = yOld, 4 = radius, 5 = fixed
stick = noone; // 0 = vertex1, 1 = vertex2, 2 = length, 3 = active
simulationMode = 0; // 0 = solid, 1 = cloth
maxTension = 0.35;
grav = 0.085;
frict = 0.9;

xx = 13; // Width
yy = 24; // Height
simulationMode = 1;
for (var i = 0; i < xx; i++) {
	for (var j = 0; j < yy; j++) {
		var cv = i * yy + j;
				
		vertex[cv, 0] = x + i * 12;
		vertex[cv, 1] = vertex[cv, 0] + irandom_range(-2, 2);
		vertex[cv, 2] = y + j * 12;
		vertex[cv, 3] = vertex[cv, 2] + irandom_range(-0.1, 0.1);
		vertex[cv, 4] = 4; // Radius
		vertex[cv, 5] = j == 0 && frac(i / 4) == 0; // Fixed
				
		if (j != yy - 1) {
			stick[cv - i, 0] = cv; // V1
			stick[cv - i, 1] = cv + 1; // V2
			stick[cv - i, 2] = 12; // Length
			stick[cv - i, 3] = true; // Active
		}
				
		if (i != xx - 1) {
			stick[xx * (yy - 1) + cv, 0] = cv; // V1
			stick[xx * (yy - 1) + cv, 1] = cv + yy; // V2
			stick[xx * (yy - 1) + cv, 2] = 12; // Length
			stick[xx * (yy - 1) + cv, 3] = true; // Active
		}
	}
}
