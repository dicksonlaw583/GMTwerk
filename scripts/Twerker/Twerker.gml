///@func Twerker(sourceSelector, targetSelector, ...)
///@param sourceSelector
///@param targetSelector

// Capture arguments
var args = (argument_count == 1) ? argument[0] : array_create(argument_count);
if (argument_count > 1) {
	for (var i = argument_count-1; i >= 0; i--) {
		args[i] = argument[i];
	}
}
var argc = array_length_1d(args);
var sourceSelector = args[0];
var targetValue = args[1];
var times = undefined;
var twerkKernel = undefined;
var onDone = undefined;
var onLost = undefined;
var onInterrupt = undefined;
var snapOnInterrupt = true;
var forceHelper = false;
for (var i = 2; i < argc; i++) {
	switch (args[i]) {
		case "times":
			times = args[++i];
		break;
		case "rt": case "roundtrip":
			twerkKernel = [tk_composite, [args[i+1], args[i+3]/2, 1, args[i+2], args[i+3], 0]];
			i += 3;
		break;
		case "rtx": case "roundtripExt":
			var blendPayload = args[i+4];
			twerkKernel = [tk_composite, [args[i+1], args[i+3]/2, 1, args[i+2], args[i+3], 0, is_array(blendPayload) ? blendPayload[0] : blendPayload, is_array(blendPayload) ? blendPayload[1] : undefined]];
			i += 4;
		break;
		case "blink":
			++i;
			twerkKernel = [tk_flash, [args[i], args[i]]];
		break;
		case "shake":
			twerkKernel = [tk_shake, [args[++i], false, te_quadratic_out]];
		break;
		case "type":
			twerkKernel = args[++i];
		break;
		case "onDone":
			onDone = args[++i];
		break;
		case "onLost":
			onLost = args[++i];
		break;
		case "onInterrupt":
			onInterrupt = args[++i];
		break;
		case "stayOnInterrupt":
			snapOnInterrupt = false;
		break;
		case "forceHelper":
			forceHelper = true;
		break;
	}
}

// Insert worker made to order
if (is_undefined(twerkKernel)) {
	twerkKernel = [tk_wave_sinusoid, [room_speed/2, true]];
}
__gmtwerk_insert__(__twerker_builder__(sourceSelector, targetValue, times, twerkKernel, onDone, onLost, onInterrupt, snapOnInterrupt), forceHelper);
