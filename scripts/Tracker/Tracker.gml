///@func Tracker(sourceSelector, targetSelector, ...)
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
var targetSelector = args[1];
var tweenKernel = [tn_normal, [te_swing, floor(room_speed/3)]];
var onNudge = undefined;
var onDone = undefined;
var onLost = undefined;
var onInterrupt = undefined;
var snapOnInterrupt = true;
var forceHelper = false;
for (var i = 2; i < argc; i++) {
	switch (args[i]) {
		case "eq": case "equation":
			tweenKernel = [tn_normal, [args[i+1], args[i+2]]];
			i += 2;
		break;
		case "z": case "zenos":
			tweenKernel = [tn_zenos, [args[i+1], args[i+2]]];
			i += 2;
		break;
		case "r": case "rate":
			tweenKernel = [tn_fixed, args[++i]];
		break;
		case "rr": case "rates":
			tweenKernel = [tn_flex, args[++i]];
		break;
		case "eqx": case "equationExt":
			tweenKernel = [tn_normal, [args[i+1], args[i+2], args[i+3]]];
			i += 3;
		break;
		case "zx": case "zenosExt":
			tweenKernel = [tn_zenos, [args[i+1], args[i+2], args[i+3]]];
			i += 3;
		break;
		case "rx": case "rateExt":
			tweenKernel = [tn_fixed, [args[i+1], args[i+2]]];
			i += 2;
		break;
		case "rrx": case "ratesExt":
			tweenKernel = [tn_flex, [args[i+1], args[i+2]]];
			i += 2;
		break;
		case "type":
			tweenKernel = args[++i];
		break;
		case "onNudge":
			onNudge = args[++i];
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
__gmtwerk_insert__(__tracker_builder__(sourceSelector, targetSelector, tweenKernel, onNudge, onDone, onLost, onInterrupt, snapOnInterrupt), forceHelper);
