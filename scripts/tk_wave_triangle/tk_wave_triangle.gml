///@func tk_wave_triangle([wavelength, positiveOnly, <blend>, <blendArgs>], memory, mode, from, to, timeUnits)
///@param [wavelength, positiveOnly, <blend>, <blendargs>]
///@param memory
///@param mode
///@param from
///@param to
///@param timeUnits
switch (argument2) {
	case 0:
		argument1[@ 1] = 0; //times
		argument1[@ 0] = 0; //time units elapsed
	break;
	case 1:
		// Capture blend
		var blend = undefined;
		var blendArgs = undefined;
		switch (array_length_1d(argument0)) {
			case 4:
				blendArgs = argument0[3];
			case 3:
				blend = argument0[2];
		}
		// Time and phase
		var t = argument1[0]+argument5;
		var phase = t/argument0[0];
		if (phase >= 1) {
			var completedIterations = floor(phase);
			argument1[@ 1] += completedIterations;
			t -= argument0[0]*completedIterations;
			phase -= completedIterations;
		}
		argument1[@ 0] = t;
		// Wave
		var waveHeight = (argument0[1]) ? ((phase <= 0.5) ? (2*phase) : (2-2*phase)) : ((phase <= 0.25) ? (4*phase) : ((phase <= 0.75) ? (2-4*phase) : (4*phase-4)));
		return is_undefined(blend) ? lerp(argument3, argument4, waveHeight) : script_execute(blend, argument3, argument4, blendArgs, waveHeight);
	break;
	case 2:
		return argument1[1];
	break;
}
