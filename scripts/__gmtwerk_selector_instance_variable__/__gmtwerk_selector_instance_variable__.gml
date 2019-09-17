///@func __gmtwerk_selector_instance_variable__(subject, varname, mode, newValue)
///@param subject
///@param varname
///@param mode
///@param newValue
switch (argument2) {
	case 0:
		return instance_exists(argument0) && variable_instance_exists(argument0, argument1);
	case 1:
		return variable_instance_get(argument0, argument1);
	case 2:
		variable_instance_set(argument0, argument1, argument3);
}
