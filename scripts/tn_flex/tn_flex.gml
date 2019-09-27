///@func tn_flex(rates[]|[rates[], blend], memory, mode, from, to, timeUnitsInc)
///@param rates[]|[rates[], blend]
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
		var result, rate, rates, pl, pl_scr, pl_args, dist;
		if (is_array(argument0[0])) {
			rates = argument0[0];
			if (array_length_1d(argument0[0]) > 1) {
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
			rates = argument0;
			pl = undefined;
		}
		dist = is_undefined(pl) ? abs(argument4-argument1[0]) : script_execute(pl_scr, argument1[0], argument4, pl_args, undefined);
		for (var i = array_length_1d(rates)-1; i > 0 && rates[i] > dist; i--) continue;
		rate = rates[i];
		if (is_undefined(pl)) {
			result = (dist <= rate) ? argument4 : argument1[0]+rate*sign(argument4-argument1[0]);
		} else {
			result = (dist <= rate) ? argument4 : script_execute(pl_scr, argument1[0], argument4, pl_args, rate/dist);
		}
		argument1[@ 0] = result;
		return result;
	break;
	case 2:
		return argument1[0] == argument4;
	break;
}

// Flex rate is time-independent
var _inert = argument5;
