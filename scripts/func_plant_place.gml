///func_plant_place(itemid,x,y);
var plantObject =-n1;
var pID=-n1;
switch(argument0){
    case 32: pID=n0; break;
    case 33: pID=n1; break;
    case 34: pID=n2; break;
    case 35: pID=n3; break;
    case 36: pID=n4; break;
    case 37: pID=n5; break;
    case 38: pID=n6; break;
    case 39: pID=n7; break;
    case 40: pID=n8; break;
    case 41: pID=n9; break;
    case 42: pID=n9+n1; break;
    case 43: pID=n9+n2; break;
    case 44: pID=n9+n3; break;
    case 45: pID=n9+n4; break;
    case 46: pID=n9+n5; break;
    case 47: pID=n9+n6; break;
    case 48: pID=n9+n7; break;
    case 49: pID=n9+n8; break;
    case 50: pID=n9+n9; break;
    case 51: pID=n2*n5+n9; break;
}
//create plant if exists
if(pID>-n1){
    plantObject = func_object_place(n4,argument1,argument2);
    plantObject.pid=pID;
    plantObject.day = n0; //day counter
    plantObject.growday=global.plant_grows [#pID,PLANT_GROW];
    plantObject.state=n0;
}
return plantObject;
