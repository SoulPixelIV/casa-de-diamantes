/// @description Vignette Effect

draw_set_alpha(0.15);
draw_ellipse_colour(camera_obj.xCoor - 120, camera_obj.yCoor - 120, camera_obj.xCoor + camera_obj.viewX + 120, camera_obj.yCoor + camera_obj.viewY + 120, c_black , c_red, false);

draw_set_alpha(1);
