///@func InstanceVar(varname, <id>)
///@param varname
///@param <id>
return [
	__gmtwerk_selector_instance_variable__,
	(argument_count > 1) ? argument[1] : id,
	argument[0]
];
