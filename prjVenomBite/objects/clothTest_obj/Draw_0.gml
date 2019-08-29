/// @description Draw the simulation

draw_set_color(c_ltgray);
// Draw sticks
for (var i = 0; i < array_height_2d(stick); i++) {
	if (stick[i, 3]) {
		var v1 = stick[i, 0];
		var v2 = stick[i, 1];
		draw_line_width(vertex[v1, 0], vertex[v1, 2], vertex[v2, 0], vertex[v2, 2], 1);
	}
}

// Draw vertices
for (var i = 0; i < array_height_2d(vertex); i++) {
	if (vertex[i, 5]) {
		//draw_sprite(sCircle, 0, vertex[i, 0], vertex[i, 2]);
	}
}