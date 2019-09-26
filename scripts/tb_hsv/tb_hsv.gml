///@func tb_hsv(col0, col1, params, t)
///@param col0
///@param col1
///@param params
///@param t
var _ = argument2;
var _hd0 = floor(color_get_hue(argument0)*360/256);
var _hd1 = floor(color_get_hue(argument1)*360/256);
var _s0 = color_get_saturation(argument0);
var _s1 = color_get_saturation(argument1);
var _v0 = color_get_value(argument0);
var _v1 = color_get_value(argument1);
var _ad = angle_difference(_hd1, _hd0);
if (is_undefined(argument3)) {
	return max(abs(ceil(_ad*256/360)), abs(_s1-_s0), abs(_v1-_v0));
}
var _na = _hd0+_ad*argument3;
return make_color_hsv(round(((_na < 0) ? _na+360 : ((_na >= 360) ? _na-360 : _na))*256/360), round(lerp(_s0, _s1, argument3)), round(lerp(_v0, _v1, argument3)));
