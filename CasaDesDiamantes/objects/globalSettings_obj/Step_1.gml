global.dt = clamp(((delta_time / 1000000) * 185) * realTimeScale, 0, 10);
global.dtNoSlowmo = clamp((delta_time / 1000000) * 185, 0, 10);