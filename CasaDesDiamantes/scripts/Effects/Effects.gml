/// @function                   screenshake(_time, _magnitude, _fade);
/// @param  {real}  _time       The length of time - in steps - to shake the screen
/// @param  {real}  _magnitude  The amount of screenshake to apply
/// @param  {real}  _fade       How quickly the screenshake effect will fade out
/// @description    Set the screenshake object variables.

function screenshake(_time, _magnitude, _fade, target)
{
   with (camera_obj)
   {
      shake = true;
      shake_time = _time;
      shake_magnitude = _magnitude / 30;
      shake_fade = _fade * 2;
	  shake_id = target;
	  snapCameraX = false;
   }
}