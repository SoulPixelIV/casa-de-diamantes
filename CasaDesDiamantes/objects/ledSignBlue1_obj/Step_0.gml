/// @description Light

lightSize += choose(0.01, -0.01, 0) * global.dt / 3;
lightSize = clamp(lightSize, lightSizeSave - (lightSizeSave / 1.3), lightSizeSave);
