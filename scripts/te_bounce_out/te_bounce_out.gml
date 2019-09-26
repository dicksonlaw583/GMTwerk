///@func te_bounce_out(x0,x1,t)
///@param x0
///@param x1
///@param t
{
    var t = argument2;
    var b = argument0;
    var c = argument1-argument0;

    return __te_bounce_kernel__(t, b, c);
}
