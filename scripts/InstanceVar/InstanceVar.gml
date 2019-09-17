///@func InstanceVar(varname, <id>)
///@param varname
///@param <id>
return [
	__gmtwerk_selector_instance_variable__,
	argument[0],
	(argument_count > 1) ? argument[1] : id
];
