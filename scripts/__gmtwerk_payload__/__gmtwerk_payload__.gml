///@func __gmtwerk_payload__(actor, index_of_scr)
///@param actor
///@param index_of_scr Position of the payload in the actor. Will use position after as argument.
var _scr = argument0[argument1];
if (!is_undefined(_scr)) {
	script_execute(_scr, argument0[argument1+1]);
}