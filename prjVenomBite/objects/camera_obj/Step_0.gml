if (follow != noone)
{
	xTo = follow.x;
	yTo = follow.y - 24;
}

x += (xTo - x) / (global.dt / 1);
y += (yTo - y - 24) / (global.dt / 1);

var vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0);
camera_set_view_mat(camera,vm);