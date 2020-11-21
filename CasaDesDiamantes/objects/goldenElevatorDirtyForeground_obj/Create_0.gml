/// @description Insert description here
var _list = ds_list_create();
var _num = instance_position_list(x, y, all, _list, false);
if _num > 0
{
	for (var i = 0; i < _num; ++i;)
	{
		//instance_destroy(_list[| i]);
	}
}
//ds_list_destroy(_list);