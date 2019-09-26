///@func te_quartic_inout(x0,x1,t)
///@param x0
///@param x1
///@param t
{
    var t = argument2;
    var b = argument0;
    var c = argument1-argument0;
    
    
    t /= 1/2;
    if (t < 1) {
        return c/2*t*t*t*t + b;
    }
    else {
        t -= 2;
        return -c/2 * (t*t*t*t - 2) + b;
    }
}
