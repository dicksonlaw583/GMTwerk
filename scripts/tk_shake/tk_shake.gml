///@func tk_shake([length, positiveOnly, te_decay, <blend>, <blendArgs>], memory, mode, from, to, timeUnits)
///@param [length, positiveOnly, te_decay, <blend>, <blendArgs>]
///@param memory
///@param mode
///@param from
///@param to
///@param timeUnits

switch (argument2) {
	case 0:
		argument1[@ 1] = 0;
		argument1[@ 0] = 0;
	break;
	case 1:
		// Capture blend
		var blend = undefined;
		var blendArgs = undefined;
		switch (array_length_1d(argument0)) {
			case 5:
				blendArgs = argument0[4];
			case 4:
				blend = argument0[3];
		}
		// Generate shake
		var shakeLength = argument0[0];
		var t = argument1[0]+argument5;
		while (t >= shakeLength) {
			t -= shakeLength;
			++argument1[@ 1];
		}
		var shakeT = (t == 0) ? 0 : ((argument0[1] ? 1 : choose(-1, 1))*random(script_execute(argument0[2], 1, 0, t/shakeLength)));
		argument1[@ 0] = t;
		return is_undefined(blend) ? lerp(argument3, argument4, shakeT) : script_execute(blend, argument3, argument4, blendArgs, shakeT);
	break;
	case 2:
		return argument1[1];
	break;
}
