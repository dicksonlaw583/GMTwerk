///@func tn_fixed(rate|[rate, blend], memory, mode, from, to, timeUnitsInc)
///@param rate|[rate, blend]
///@param memory
///@param mode
///@param from
///@param to
///@param timeUnitsInc

switch (argument2) {
	case 0:
		argument1[@ 0] = argument3;
	break;
	case 1:
		var result, rate, pl, pl_scr, pl_args, dist;
		if (is_array(argument0)) {
			rate = argument0[0];
			if (array_length_1d(argument0) > 1) {
				pl = argument0[1];
				if (is_array(pl)) {
					pl_scr = pl[0];
					pl_args = pl[1];
				} else {
					pl_scr = pl;
					pl_args = undefined;
				}
			} else {
				pl = undefined;
			}
		} else {
			rate = argument0;
			pl = undefined;
		}
		if (is_undefined(pl)) {
			result = (abs(argument4-argument1[0]) <= rate) ? argument4 : argument1[0]+rate*sign(argument4-argument1[0]);
		} else {
			var dist = script_execute(pl_scr, argument1[0], argument4, pl_args, undefined);
			result = (dist <= rate) ? argument4 : script_execute(pl_scr, argument1[0], argument4, pl_args, rate/dist);
		}
		argument1[@ 0] = result;
		return result;
	break;
	case 2:
		return argument1[0] == argument4;
	break;
}

// Fixed rate is time-independent
var _inert = argument5;
