///@func twerk(<timeUnits>)
//IMPORTANT: If this script is modified, please also modify __gmtwerk_host__ Step event to match!

// Macros
#macro stepSeconds *room_speed
#macro deltaSeconds *1000000

// Capture parameters
var timeUnits = (argument_count == 0) ? 1 : argument[0],
		twerkQueueSize = array_length_1d(__gmtwerk__);

// For each actor
for (var i = 0; i < twerkQueueSize; i++) {
	var currentTwerkActor = __gmtwerk__[i];
	// Run only filled entries
	if (is_undefined(currentTwerkActor)) continue;
	// Run the actor if it's active (not paused, not dead or lost)
	if (currentTwerkActor[1]) {
		script_execute(currentTwerkActor[0], currentTwerkActor, timeUnits, GMTWERK_STATE.ACTIVE);
	}
	// Dereference dead actors
	if (currentTwerkActor[1] < 0) {
		__gmtwerk__[@ i] = undefined;
	}
}
