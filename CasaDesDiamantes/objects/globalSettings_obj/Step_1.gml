realTimeScale = global.timeScale;
global.dt = clamp(((delta_time / 1000000) * 185) * realTimeScale, 0, 5);
global.dtNoSlowmo = clamp((delta_time / 1000000) * 185, 0, 5);