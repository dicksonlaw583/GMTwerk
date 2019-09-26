///@func te_exp_inout(x0,x1,t)
///@param x0
///@param x1
///@param t
{
    var t = argument2;
    var b = argument0;
    var c = argument1-argument0;
    
    
    if (t == 0) {
        return b;
    }
    if (t == 1) {
        return b+c;
    }
    
    t /= 1/2;
    if (t < 1) {
        return c/2 * power(2, 10*(t-1)) + b;
    }
    else {
        t -= 1;
        return c/2 * (-power(2, -10*t)+2) + b;
    }
}
