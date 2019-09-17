///@func gmtwerk_var_exists(selector)
///@param selector
enum GMTWERK_SELECTOR {
	KERNEL,
	SUBJECT,
	INDEX
}
enum GMTWERK_SELECTOR_MODE {
	EXISTS,
	GET,
	SET
}

return script_execute(argument0[GMTWERK_SELECTOR.KERNEL], argument0[GMTWERK_SELECTOR.SUBJECT], argument0[GMTWERK_SELECTOR.INDEX], GMTWERK_SELECTOR_MODE.EXISTS, undefined);
