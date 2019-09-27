///@func tn_zenos([frac, tolerance; <blend>], memory, mode, from, to, timeUnitsInc)
///@param [frac, tolerance; <blend>]
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
		var result;
		if (array_length_1d(argument0) > 2) {
			var pl = argument0[2];
			var pl_scr, pl_args;
			if (is_array(pl)) {
				pl_scr = pl[0];
				pl_args = pl[1];
			} else {
				pl_scr = pl;
				pl_args = undefined;
			}
			result = (script_execute(pl_scr, argument1[0], argument4, pl_args, undefined) <= argument0[1]) ? argument4 : script_execute(pl_scr, argument1[0], argument4, pl_args, argument0[0]);
		} else {
			result = (abs(argument4-argument1[0]) <= argument0[1]) ? argument4 : (argument1[0]+argument0[0]*(argument4-argument1[0]));
		}
		argument1[@ 0] = result;
		return result;
	break;
	case 2:
		return argument1[0] == argument4;
	break;
}

// Zenos is time-independent
var _inert = argument5;
