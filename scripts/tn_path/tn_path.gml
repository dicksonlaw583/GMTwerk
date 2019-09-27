///@func tn_path([path; y0; y1; timeUnits; <blend>], memory, mode, from, to, timeUnitsInc)
///@param [path; y0; y1; timeUnits; <blend>]
///@param memory
///@param mode
///@param from
///@param to
///@param timeUnitsInc

switch (argument2) {
	case 0:
		argument1[@ 0] = 0;
	break;
	case 1:
		var mt = argument0[3];
		var t = clamp(argument1[0]+argument5, 0, mt);
		argument1[@ 0] = t;
		var tt = (path_get_y(argument0[0], t/mt)-argument0[1])/(argument0[2]-argument0[1]);
		if (array_length_1d(argument0) > 4) {
			var pl = argument0[4];
			var pl_scr, pl_args;
			if (is_array(pl)) {
				pl_scr = pl[0];
				pl_args = pl[1];
			} else {
				pl_scr = pl;
				pl_args = undefined;
			}
			return script_execute(pl_scr, argument3, argument4, pl_args, tt);
		} else {
			return lerp(argument3, argument4, tt);
		}
	break;
	case 2:
		return argument1[0] >= argument0[3];
	break;
}
