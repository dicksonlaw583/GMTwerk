///@func Repeater(timeUnits, payload, <...>)
///@param timeUnits Time units to delay
///@param payload A script ID; or a 2-tuple of a script ID and an argument to pass it

// Capture arguments
var args = (argument_count == 1) ? argument[0] : array_create(argument_count);
if (argument_count > 1) {
	for (var i = argument_count-1; i >= 0; i--) {
		args[i] = argument[i];
	}
}
var argc = array_length_1d(args);
var timeUnits = args[0];
var payload = args[1];
var times = -1;
var reloadTime = timeUnits;
var onInterrupt = undefined;
var runOnInterrupt = false;
var forceHelper = false;
for (var i = 2; i < argc; i++) {
	switch (args[i]) {
		case "times":
			times = args[++i];
		break;
		case "reloadTime":
			reloadTime = args[++i];
		break;
		case "onInterrupt":
			onInterrupt = args[++i];
		break;
		case "runOnInterrupt":
			runOnInterrupt = true;
		break;
		case "forceHelper":
			forceHelper = true;
		break;
	}
}

// Insert delayer made to order
__gmtwerk_insert__(__repeater_builder__(timeUnits, times, reloadTime, payload, onInterrupt, runOnInterrupt), forceHelper);
