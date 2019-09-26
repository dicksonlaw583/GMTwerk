///@func tb_wrap(val0, val1, [min;max], t)
///@param val0
///@param val1
///@param [min;max] 2-tuple containing min and max range
///@param t
var _min = argument2[0];
var _max = argument2[1];
var _range = _max-_min;

var _d0 = argument0-_min;
var _d1 = argument1-_min;
while (_d0 < 0 || _d0 > _range) {
	_d0 -= sign(_d0)*_range;
}
while (_d1 < 0 || _d1 > _range) {
	_d1 -= sign(_d1)*_range;
}

var _c0 = abs(_d1-_d0); // |      x y     | or |    y x    |
var _c1 = _d0+_range-_d1; // | x       y |
var _c2 = _d1+_range-_d0; // | y       x |

if (is_undefined(argument3)) {
	return min(_c0, _c1, _c2);
} else {
	if (_c0 <= _c1 && _c0 <= _c2) {
		return _min+lerp(_d0, _d1, argument3);
	} else if (_c1 <= _c2) {
		var result = lerp(_d0+_range, _d1, argument3);
	} else {
		var result = lerp(_d1+_range, _d0, argument3);
	}
	return (result >= _range) ? result-_range : result;
}
