///@func __responder_runner__(responder, timeUnits, mode)
///@param responder
///@param timeUnits
///@param mode (1=run, 0=suspend, -2=interrupt)
var timeUnits = argument1; // Inert for this actor type

switch (argument2) {
	case GMTWERK_STATE.ACTIVE:
		var conditionResult = script_execute(argument0[GMTWERK_RESPONDER.CONDITION_PAYLOAD], argument0[GMTWERK_RESPONDER.CONDITION_PAYLOAD_ARGS]);
		if (conditionResult ^^ argument0[GMTWERK_RESPONDER.LAST_CONDITION]) {
			if (conditionResult) {
				if (!argument0[@ GMTWERK_RESPONDER.KEEP_ALIVE]) {
					argument0[@ GMTWERK_RESPONDER.STATE] = GMTWERK_STATE.DONE;
				}
				__gmtwerk_payload__(argument0, GMTWERK_RESPONDER.ON_TRIGGER);
			} else {
				__gmtwerk_payload__(argument0, GMTWERK_RESPONDER.ON_UNTRIGGER);
			}
		}
		argument0[@ GMTWERK_RESPONDER.LAST_CONDITION] = conditionResult;
	break;
	case GMTWERK_STATE.INACTIVE:
		argument0[@ GMTWERK_RESPONDER.STATE] = GMTWERK_STATE.INACTIVE;
	break;
	case GMTWERK_STATE.INTERRUPTED:
		__gmtwerk_payload__(argument0, GMTWERK_RESPONDER.ON_INTERRUPT);
		argument0[@ GMTWERK_RESPONDER.STATE] = GMTWERK_STATE.INTERRUPTED;
	break;
}
