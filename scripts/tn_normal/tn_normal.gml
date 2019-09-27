///@func tn_normal([tweenEquation; timeUnits; <blend>], memory, mode, from, to, timeUnitsInc)
///@param [tweenEquation; timeUnits; <blend>]
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
		var mt = argument0[1];
		var t = clamp(argument1[0]+argument5, 0, mt);
		argument1[@ 0] = t;
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
			return script_execute(pl_scr, argument3, argument4, pl_args, script_execute(argument0[0], 0, 1, t/mt));
		} else {
			return script_execute(argument0[0], argument3, argument4, t/mt);
		}
	break;
	case 2:
		return argument1[0] >= argument0[1];
	break;
}
