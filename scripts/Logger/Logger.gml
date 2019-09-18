///@func Logger(subjectSelector, size, interval, ...)
///@param subjectSelector
///@param size
///@param interval

// Capture arguments
var args = (argument_count == 1) ? argument[0] : array_create(argument_count);
if (argument_count > 1) {
	for (var i = argument_count-1; i >= 0; i--) {
		args[i] = argument[i];
	}
}
var argc = array_length_1d(args);
var subjectSelector = args[0];
var size = args[1];
var interval = abs(args[2]);
var captureMode = sign(args[2]);
var startValue = gmtwerk_var_get(subjectSelector);
var onLog = undefined;
var onLost = undefined;
var onInterrupt = undefined;
var forceHelper = false;
for (var i = 2; i < argc; i++) {
	switch (args[i]) {
		case "startValue":
			startValue = args[++i];
		break;
		case "onLog":
			onLog = args[++i];
		break;
		case "onLost":
			onLost = args[++i];
		break;
		case "onInterrupt":
			onInterrupt = args[++i];
		break;
		case "forceHelper":
			forceHelper = true;
		break;
	}
}

// Insert worker made to order
__gmtwerk_insert__(__logger_builder__(captureMode, interval, subjectSelector, startValue, size, onLog, onLost, onInterrupt), forceHelper);

