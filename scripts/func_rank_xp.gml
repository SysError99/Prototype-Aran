///func_rank_xp(amount);
var _RXP = global.data[?EXP] + argument0; //GAIN
var _RLV = global.data[?RANK];
while(_RXP > _RLV*n2*n2*n5*n5){//100
    _RXP = _RXP - _RLV*n2*n5*n2*n5;
    _RLV = _RLV + n1;
}
//updater
global.data[?EXP]  = _RXP;
global.data[?RANK] = _RLV;
