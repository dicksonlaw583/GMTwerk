///@func tk_flicker([chanceOn; period], memory, mode, offValue, onValue, timeUnits)
///@param [chanceOn; period]
///@param memory
///@param mode
///@param offValue
///@param onValue
///@param timeUnit

switch (argument2) {
	case 0:
		argument1[@ 2] = 0; //flashes
		argument1[@ 1] = true; //on or off
		argument1[@ 0] = argument0[1]; //time until next flicker
	break;
	case 1:
		var onOff = argument1[1];
		var t = argument1[0]-argument5;
		var result = onOff ? argument4 : argument3;
		while (t <= 0) {
			var oldOnOff = onOff;
			onOff = (random(1) < argument0[0]) ? true : false; //Force-cast to satisfy tests
			if (oldOnOff && !onOff) ++argument1[@ 2];
			t += argument0[1];
		}
		argument1[@ 0] = t;
		argument1[@ 1] = onOff;
		return result;
	break;
	case 2:
		return argument1[2];
	break;
}
