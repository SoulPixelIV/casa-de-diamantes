//Animation
image_speed = 0;
image_index += (global.dt / 15) * animationSpeed;

smoothness = clamp(smoothness + ((keyboard_check(vk_right) - keyboard_check(vk_left)) * 0.0025),0.0001,0.9999);