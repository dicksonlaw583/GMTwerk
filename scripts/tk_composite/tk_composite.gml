///@func tk_composite([...teN, timeUnitsN, valN..., <blend>, <blend_arg>], memory, mode, from, to, timeUnits);
///@param composition
///@param memory
///@param mode
///@param from
///@param to
///@param timeUnits
var siz = array_length_1d(argument0);
switch (argument2) {
	case 0:
		argument1[@ 2] = 0;
		argument1[@ 0] = 0;
		siz -= siz % 3;
		var totalTime = 0;
		for (var i = 1; i < siz; i += 3) {
			totalTime += argument0[i];
		}
		argument1[@ 1] = totalTime;
	break;
	case 1:
		var blend = undefined;
		var blendArg = undefined;
		switch (siz % 3) {
			case 1:
				blend = argument0[siz-1];
				blendArg = undefined;
				siz -= 1;
			break;
			case 2:
				blend = argument0[siz-2];
				blendArg = argument0[siz-1];
				siz -= 2;
			break;
		}
		var t = argument1[0];
		t += argument5;
		while (t >= argument1[1]) {
			t -= argument1[1];
			argument1[@ 2]++;
		}
		argument1[@ 0] = t;
		var i = 1;
		repeat (siz-1) {
			t -= argument0[i];
			if (t <= 0) {
				t += argument0[i];
				break;
			} else {
				i = (i+3) % siz;
			}
		}
		var fromVal = (i == 1) ? argument0[siz-1] : argument0[i-2];
		var toVal = argument0[i+1];
		return is_undefined(blend) ? script_execute(argument0[i-1], argument3, argument4, lerp(fromVal, toVal, t/argument0[i])) : script_execute(blend, argument3, argument4, blendArg, script_execute(argument0[i-1], 0, 1, lerp(fromVal, toVal, t/argument0[i])));
	break;
	case 2:
		return argument1[2];
	break;
}
