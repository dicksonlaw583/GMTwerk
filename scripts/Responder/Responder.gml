///@func Responder(conditionPayload, onTrigger, ...)
///@param conditionPayload
///@param onTrigger

// Capture arguments
var args = (argument_count == 1) ? argument[0] : array_create(argument_count);
if (argument_count > 1) {
	for (var i = argument_count-1; i >= 0; i--) {
		args[i] = argument[i];
	}
}
var argc = array_length_1d(args);

// IMPLEMENT THIS
var conditionPayload = args[0];
var onTrigger = args[1];
var onUntrigger = undefined;
var onInterrupt = undefined;
var forceHelper = false;
var keepAlive = false;
for (var i = 2; i < argc; i++) {
	switch (args[i]) {
		case "onUntrigger":
			onUntrigger = args[++i];
		break;
		case "onInterrupt":
			onInterrupt = args[++i];
		break;
		case "keepAlive":
			keepAlive = true;
		break;
		case "forceHelper":
			forceHelper = true;
		break;
	}
}

// Insert worker made to order
__gmtwerk_insert__(__responder_builder__(conditionPayload, onTrigger, keepAlive, onUntrigger, onInterrupt), forceHelper);
