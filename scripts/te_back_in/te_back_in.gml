///@func te_back_in(x0,x1,t)
///@param x0
///@param x1
///@param t
{
    var t = argument2;
    var b = argument0;
    var c = argument1-argument0;

    var s = 1.70158;


    return c*t*t*((s+1)*t - s) + b;
}