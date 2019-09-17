///@func __gmtwerk_selector_global_variable__(undefined, varname, mode, newValue)
///@param undefined
///@param varname
///@param mode
///@param newValue
var _ = argument0; //Inert for this selector
switch (argument2) {
	case 0:
		return variable_global_exists(argument1);
	case 1:
		return variable_global_get(argument1);
	case 2:
		variable_global_set(argument1, argument3);
}
