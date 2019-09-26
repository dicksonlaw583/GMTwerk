///@func te_exp_out(x0,x1,t)
///@param x0
///@param x1
///@param t
{
    var t = argument2;
    var b = argument0;
    var c = argument1-argument0;
    
    
    if (t == 1) {
        return b+c;
    }
    else {
        return c * (-power(2, -10*t/1)+1) + b;
    }
}
