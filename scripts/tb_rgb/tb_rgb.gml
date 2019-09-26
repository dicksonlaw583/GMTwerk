///@func tb_rgb(col0, col1, params, t)
///@param col0
///@param col1
///@param params
///@param t
var _ = argument2;
return is_undefined(argument3) ? max(abs(color_get_red(argument0)-color_get_red(argument1)), abs(color_get_green(argument0)-color_get_green(argument1)), abs(color_get_blue(argument0)-color_get_blue(argument1))) : merge_colour(argument0, argument1, argument3);
