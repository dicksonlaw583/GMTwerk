///@func gmtwerk_var_set(selector, value)
///@param selector
///@param value
var selector, value;
if (argument_count == 1) {
	var temp = argument[0];
	selector = temp[0];
	value = temp[1];
} else {
	selector = argument[0];
	value = argument[1];
}
return script_execute(selector[GMTWERK_SELECTOR.KERNEL], selector[GMTWERK_SELECTOR.SUBJECT], selector[GMTWERK_SELECTOR.INDEX], GMTWERK_SELECTOR_MODE.SET, value);
