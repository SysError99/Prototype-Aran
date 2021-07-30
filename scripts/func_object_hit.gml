///func_object_hit(x,y,dmg,attacker);
var _objHit = func_object_find(argument0,argument1);
if(_objHit > -n1){
    with(_objHit){
        ohp = ohp - argument2;
        atkb = argument3;
    }
}
