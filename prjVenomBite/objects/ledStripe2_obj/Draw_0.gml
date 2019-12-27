/// @description Lensflare

draw_self();

for (i = 0; i < 10; i+=2)
{
	draw_sprite(lensflareRed_spr, 0, lensFlareXPos[i], lensFlareYPos[i]);
	draw_sprite(lensflareBlue_spr, 0, lensFlareXPos[i+1], lensFlareYPos[i+1]);
}
