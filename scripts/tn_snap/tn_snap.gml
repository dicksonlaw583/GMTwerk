///@func tn_snap(undefined, memory, mode, from, to, timeUnitsInc)
///@param undefined
///@param memory
///@param mode
///@param from
///@param to
///@param timeUnitsInc

switch (argument2) {
	case 0:
		argument1[@ 0] = false;
		exit;
	break;
	case 1:
		argument1[@ 0] = true;
		return argument4;
	break;
	case 2:
		return argument1[0];
	break;
}

// Argument, from and time arguments are inert
var _inert;
_inert = argument0;
_inert = argument3;
_inert = argument5;
