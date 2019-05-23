/// @description Light

lightSize += choose(0.01, -0.01, 0);
lightSize = clamp(lightSize, lightSizeSave - (lightSizeSave / 1.3), lightSizeSave);
