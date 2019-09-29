///@func tk_flash([onTime; offTime], memory, mode, offValue, onValue, timeUnits)
///@param [onTime; offTime]
///@param memory
///@param mode
///@param offValue
///@param onValue
///@param timeUnit

switch (argument2) {
	case 0:
		argument1[@ 2] = 0; //flashes
		argument1[@ 1] = true; //on or off
		argument1[@ 0] = argument0[0]; //time left on current state
	break;
	case 1:
		var onOff = argument1[1];
		var t = argument1[0]-argument5;
		var result = onOff ? argument4 : argument3;
		while (t <= 0) {
			if (onOff) ++argument1[@ 2];
			onOff = onOff ? false : true; //Force-cast to satisfy tests
			t += onOff ? argument0[0] : argument0[1];
		}
		argument1[@ 0] = t;
		argument1[@ 1] = onOff;
		return result;
	break;
	case 2:
		return argument1[2];
	break;
}
