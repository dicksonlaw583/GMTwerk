///@description Run twerks if active
var timeUnits = (global.__gmtwerk_host_speed__ > 0) ? global.__gmtwerk_host_speed__ : delta_time,
		twerkQueueSize = array_length_1d(__gmtwerk__);
// For each actor
for (var i = 0; i < twerkQueueSize; i++) {
	var currentTwerkActor = __gmtwerk__[i],
			currentTwerkOwner = __gmtwerk_owner__[i];
	// Run only filled entries
	if (is_undefined(currentTwerkActor)) continue;
	// Run the actor if it's active (not paused, not dead or lost)
	if (instance_exists(currentTwerkOwner)) {
		if (currentTwerkActor[1]) {
			with (currentTwerkOwner) {
				script_execute(currentTwerkActor[0], currentTwerkActor, timeUnits, GMTWERK_STATE.ACTIVE);
			}
		}
	} else if (currentTwerkOwner != noone) {
		currentTwerkActor[1] = GMTWERK_STATE.INTERRUPTED;
	}
	// Dereference dead actors
	if (currentTwerkActor[1] < 0) {
		__gmtwerk__[@ i] = undefined;
		__gmtwerk_owner__[@ i] = noone;
	}
}
