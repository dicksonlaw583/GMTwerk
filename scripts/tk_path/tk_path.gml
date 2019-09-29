///@func tk_path([path, y0, y1, timeUnits, <blend>, <blend_arg>], memory, mode, from, to, timeUnits);
///@param [path, y0, y1, timeUnits, <blend>, <blend_arg>]
///@param memory
///@param mode
///@param from
///@param to
///@param timeUnits
var siz = array_length_1d(argument0);
switch (argument2) {
	case 0:
		argument1[@ 1] = 0;
		argument1[@ 0] = 0;
	break;
	case 1:
		var blend = undefined;
		var blendArg = undefined;
		switch (siz) {
			case 6:
				blendArg = argument0[5];
			case 5:
				blend = argument0[4];
		}
		var t = argument1[0];
		var duration = argument0[3];
		t += argument5;
		while (t >= duration) {
			t -= duration;
			argument1[@ 1]++;
		}
		argument1[@ 0] = t;
		var tt = (path_get_y(argument0[0], t/duration)-argument0[1])/(argument0[2]-argument0[1]);
		return is_undefined(blend) ? lerp(argument3, argument4, tt) : script_execute(blend, argument3, argument4, blendArg, tt);
	break;
	case 2:
		return argument1[1];
	break;
}
