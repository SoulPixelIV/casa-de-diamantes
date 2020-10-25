// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function RoundTo(value, dec){
	var mult = power(10, dec);
	return floor(value * mult) / mult
}