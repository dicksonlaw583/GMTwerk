///@func te_sine_in(x0,x1,t)
///@param x0
///@param x1
///@param t
{
    var t = argument2;
    var b = argument0;
    var c = argument1-argument0;


    return -c * cos(t * pi/2) + c + b;
}
