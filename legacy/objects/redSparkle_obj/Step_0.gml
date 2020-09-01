/// @description Light

dt = (delta_time / 1000000) * globalSettings_obj.TARGET_FRAMERATE;
lightSize += choose(0.01, -0.01, 0) * dt;
lightSize = clamp(lightSize, lightSizeSave - (lightSizeSave / 1.3), lightSizeSave);
