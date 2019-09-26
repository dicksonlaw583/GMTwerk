///@func tb_angle(angle0, angle1, params, t)
///@param angle0
///@param angle1
///@param params
///@param t
var _ = argument2;
var _ad = angle_difference(argument1, argument0);
if (is_undefined(argument3)) {
	return abs(_ad);
}
var _na = argument0+_ad*argument3;
return (_na < 0) ? _na+360 : ((_na >= 360) ? _na-360 : _na);
