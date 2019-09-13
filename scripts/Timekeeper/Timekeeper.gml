///@func Timekeeper(startTimeUnits, payloads, <...>)
///@param startTimeUnits Time units to start at
///@param payloads 1D array alternating between time marks and payloads

// Capture arguments
var args = (argument_count == 1) ? argument[0] : array_create(argument_count);
if (argument_count > 1) {
	for (var i = argument_count-1; i >= 0; i--) {
		args[i] = argument[i];
	}
}
var argc = array_length_1d(args);
var timeUnits = args[0];
var payloads = args[1];
var keepGoing = false;
var countup = timeUnits <= 0 ? true : false; // Bad form, but needed to make true/false comparisons match
var onInterrupt = undefined;
var forceHelper = false;
for (var i = 2; i < argc; i++) {
	switch (args[i]) {
		case "keepGoing":
			keepGoing = true;
		break;
		case "forceCountup":
			countup = true;
		break;
		case "onInterrupt":
			onInterrupt = args[++i];
		break;
		case "forceHelper":
			forceHelper = true;
		break;
	}
}

// Insert delayer made to order
__gmtwerk_insert__(__timekeeper_builder__(timeUnits, countup, payloads, keepGoing, onInterrupt), forceHelper);
