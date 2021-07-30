///GAME_DB_CONSTRUCTOR();
// This is a game database constructor, 
// for the actual release you must comment the whole commands and only use an encrypted string!
//data amount
db_blocks=24;
db_items=60;
db_objects=13;
db_tools=5;
db_craft_pages=2;
db_plants=20;
db_plant_data=8;

//start block codes here
var db = ds_map_create();

//block change (after being destroyed)
var bc = ds_list_create();
    bc[|0]  = 15; //grass to dirt
    bc[|4]  = 15; //stone grass to dirt
    bc[|6]  = 6; //water to water (fishing) 
    bc[|10] = 11; //stone block to stone floor
    bc[|12] = 15; //sand to dirt
    bc[|14] = 15; //ground to dirt
    bc[|15] = 14; //dirt to ground
    bc[|16] = 6; //watered dirt to water
db[?DB_BLOCK_CHANGE] = ds_list_write(bc); ds_list_destroy(bc);

//block item pick (pickable blocks);
var bip = ds_list_create(); for(i=0;i<db_items;i++){bip[|i]=-1;}
    //[|item id] = block id
    bip[|0] = 4;//pebbles
    bip[|52] = 18;//bed
    bip[|60] = 24;//shelf
db[?DB_BLOCK_PICK] = ds_list_write(bip); ds_list_destroy(bip);

//block health
var bhp = ds_list_create();
    bhp[|0] = 500;//grassy ground
    bhp[|1] = 500;//stone
    bhp[|2] = 400;//tree
    bhp[|3] = 300;//dead tree
    bhp[|4] = 500;//stone grass
    bhp[|5] = 300;//flower bush
    bhp[|6] = 1500;//water
    bhp[|7] = 300;//wood wall
    bhp[|8] = 300;//wood floor
    bhp[|9] = 300;//wood door
    bhp[|10]= 700;//stone block
    bhp[|12]= 200;//sand
    bhp[|13]= 250;//wet ground
    bhp[|14]= 250;//ground
    bhp[|15]= 250;//dirt
    bhp[|16]= 500;//watered dirt
    bhp[|17]= 250;//fine dirt
    bhp[|18]= 400;//bed
    bhp[|19]= 300;//tree1
    bhp[|20]= 400; //table
    bhp[|21]= 200; //sit place
    bhp[|22]= 650; //coal block
    bhp[|23]= 300; //tree2
    bhp[|24]= 300; //shelf
db[?DB_BLOCK_HEALTH] = ds_list_write(bhp); ds_list_destroy(bhp);

//block item drops
var bid = ds_list_create(); for(i=0;i<db_items;i++){bid[|i]=-1;}
var b = ds_list_create();
    //1: stone
        //drop: stone
        b[|0] = 0;//id
        b[|1] = 8;//min
        b[|2] = 16;//max
        b[|3] = 100;//chance
    bid[|1] = ds_list_write(b);
    //2: tree
    ds_list_clear(b);
        //drop: wood log
        b[|0] = 1;
        b[|1] = 4;
        b[|2] = 8;
        b[|3] = 100;
    bid[|2] = ds_list_write(b);
    //3: dead tree
    ds_list_clear(b);
        //drop: wood log
        b[|0] = 1;
        b[|1] = 3;
        b[|2] = 6;
        b[|3] = 100;
    bid[|3] = ds_list_write(b);
    //6: water (fishing);
    ds_list_clear(b);
        b[|0] = 1;//wood log
        b[|1] = 1;
        b[|2] = 1;
        b[|3] = 25;
        b[|4] = 7;//iron ore
        b[|5] = 1;
        b[|6]= 1;
        b[|7]= 5;
        b[|8]= 11; //coal
        b[|9]= 1;
        b[|10]= 1;
        b[|11]= 35;
        b[|12] = 56;//tnt
        b[|13] = 1;
        b[|14]= 1;
        b[|15]= 5;
        b[|16] = 57;//normal fish
        b[|17] = 1;
        b[|18] = 1;
        b[|19] = 40;
    bid[|6] = ds_list_write(b);
    //7: wooden wall
    ds_list_clear(b);
        //drop: wooden wall
        b[|0] = 2;
        b[|1] = 1;
        b[|2] = 1;
        b[|3] = 100;
    bid[|7] = ds_list_write(b);
    //8: wooden floor
    ds_list_clear(b);
        //drop: wooden floor
        b[|0] = 4;
        b[|1] = 1;
        b[|2] = 1;
        b[|3] = 100;
    bid[|8] = ds_list_write(b);
    //9: wooden door
    ds_list_clear(b);
        //drop: wooden wall
        b[|0] = 5;
        b[|1] = 1;
        b[|2] = 1;
        b[|3] = 100;
    bid[|9] = ds_list_write(b);
    //10: stone block
    ds_list_clear(b);
        //drop: iron ore (15 %)
        b[|0] = 7
        b[|1] = 1;
        b[|2] = 2;
        b[|3] = 15;
        //drop: stone
        b[|4] = 0;
        b[|5] = 9;
        b[|6] = 18;
        b[|7] = 100;
    bid[|10] = ds_list_write(b);
    //12: sand
    ds_list_clear(b);
        //drop: sand
        b[|0] = 10;
        b[|1] = 1;
        b[|2] = 1;
        b[|3] = 100;
    bid[|12] = ds_list_write(b);
    //21: tree 1
    ds_list_clear(b);
        //drop: wood log
        b[|0] = 1;
        b[|1] = 4;
        b[|2] = 8;
        b[|3] = 100;
    bid[|21] = ds_list_write(b);
    //22: coal block
    ds_list_clear(b);
        //drop: coal
        b[|0] = 11;
        b[|1] = 1;
        b[|2] = 1;
        b[|3] = 100;
    bid[|22] = ds_list_write(b);
    //23: tree 2
    ds_list_clear(b);
        //drop: wood log
        b[|0] = 1;
        b[|1] = 4;
        b[|2] = 8;
        b[|3] = 100;
    bid[|23] = ds_list_write(b);
db[?DB_BLOCK_ITEM_DROP] = ds_list_write(bid); ds_list_destroy(bid);

//block_xp_gain
var bxg = ds_list_create();
    //stones
    bxg[|0] = 30;
    bxg[|10]= 30;
    //trees
    bxg[|1] = 35;
    bxg[|2] = 35;
    //sand
    bxg[|0] = 15;
    bxg[|4] = 20;
    bxg[|5] = 20;
    bxg[|12]= 10;
    bxg[|15]= 15;
db[?DB_BLOCK_XP] = ds_list_write(bxg); ds_list_destroy(bxg);
    
//crafting requirements
var cr = ds_grid_create(db_craft_pages,20);//page, n
ds_grid_set_region(cr,0,0,ds_grid_width(cr)-1,ds_grid_height(cr)-1,-1);
var c = ds_grid_create(11,2);
    // [9,0] item type (item or tool)
    // [9,1] item id
    // [10,0] amount (for items)
    // [10,1] empty (don't know what to use
    // [n,0] item id required [n,1] item amount required
    //page 0 : Buildings
        //0: Wooden Wall
        ds_grid_set_region(c,0,0,ds_grid_width(c)-1,ds_grid_height(c)-1,-1);
        c[#9,0] = 0; c[#9,1] = 2; c[#10,0]= 1;
        c[#0,0] = 1; c[#0,1] = 16; //wood log, 16
        cr[#0,0] = ds_grid_write(c);
        //1: Wooden Floor
        ds_grid_set_region(c,0,0,ds_grid_width(c)-1,ds_grid_height(c)-1,-1);
        c[#9,0] = 0; c[#9,1] = 4; c[#10,0]= 1;
        c[#0,0] = 1; c[#0,1] = 4; //wood log, 4
        cr[#0,1] = ds_grid_write(c);
        //2: Wooden Door
        ds_grid_set_region(c,0,0,ds_grid_width(c)-1,ds_grid_height(c)-1,-1);
        c[#9,0] = 0; c[#9,1] = 5; c[#10,0]= 1;
        c[#0,0] = 1; c[#0,1] = 4; //wood log, 4
        c[#1,0] = 0; c[#1,1] = 2; //stone, 2
        cr[#0,2] = ds_grid_write(c);
        //3: Smelter
        ds_grid_set_region(c,0,0,ds_grid_width(c)-1,ds_grid_height(c)-1,-1);
        c[#9,0] = 0; c[#9,1] = 8; c[#10,0]= 1;
        c[#0,0] = 0; c[#0,1] = 99; //stone, 99
        cr[#0,3] = ds_grid_write(c);
        //4: Bed
        ds_grid_set_region(c,0,0,ds_grid_width(c)-1,ds_grid_height(c)-1,-1);
        c[#9,0] = 0; c[#9,1] = 52; c[#10,0]= 1;
        c[#0,0] = 1; c[#0,1] = 40; //wood log: 40
        c[#1,0] = 6; c[#1,1] = 49; //coin: 49
        cr[#0,4] = ds_grid_write(c);
        //5: Table
        ds_grid_set_region(c,0,0,ds_grid_width(c)-1,ds_grid_height(c)-1,-1);
        c[#9,0] = 0; c[#9,1] = 53; c[#10,0]= 1;
        c[#0,0] = 1; c[#0,1] = 60; //wood log: 60
        c[#1,0] = 6; c[#1,1] = 39; //coin: 39
        cr[#0,5] = ds_grid_write(c);
        //6: small table
        ds_grid_set_region(c,0,0,ds_grid_width(c)-1,ds_grid_height(c)-1,-1);
        c[#9,0] = 0; c[#9,1] = 63; c[#10,0]= 1;
        c[#0,0] = 1; c[#0,1] = 40; //wood log: 40
        c[#1,0] = 6; c[#1,1] = 89; //coin: 89
        cr[#0,6] = ds_grid_write(c);
        //7: sit place
        ds_grid_set_region(c,0,0,ds_grid_width(c)-1,ds_grid_height(c)-1,-1);
        c[#9,0] = 0; c[#9,1] = 54; c[#10,0]= 1;
        c[#0,0] = 1; c[#0,1] = 20; //wood log: 20
        c[#1,0] = 10;c[#1,1] = 10; //sand: 10
        c[#2,0] = 6; c[#2,1] = 19; //coin: 19
        cr[#0,7] = ds_grid_write(c);
        //8: Shelf
        ds_grid_set_region(c,0,0,ds_grid_width(c)-1,ds_grid_height(c)-1,-1);
        c[#9,0] = 0; c[#9,1] = 60; c[#10,0]= 1;
        c[#0,0] = 1; c[#0,1] = 100; //wood log: 100
        c[#1,0] = 6; c[#1,1] = 49; //coin: 49
        cr[#0,8] = ds_grid_write(c);
        //9: lamp
        ds_grid_set_region(c,0,0,ds_grid_width(c)-1,ds_grid_height(c)-1,-1);
        c[#9,0] = 0; c[#9,1] = 61; c[#10,0]= 1;
        c[#0,0] = 1; c[#0,1] = 100; //wood log: 10
        c[#1,0] = 55;c[#1,1] = 1; //gunpowder: 1
        c[#2,0] = 6; c[#2,1] = 49; //coin: 49
        cr[#0,9] = ds_grid_write(c);
    //page 1: Common Tools
        //0: axe
        ds_grid_set_region(c,0,0,ds_grid_width(c)-1,ds_grid_height(c)-1,-1);
        c[#9,0] = 1; c[#9,1] = 1;
        c[#0,0] = 0; c[#0,1] = 30; //stone, 30
        c[#1,0] = 1; c[#1,1] = 20; //wood log, 20
        cr[#1,0] = ds_grid_write(c);
        //1: pickaxe
        ds_grid_set_region(c,0,0,ds_grid_width(c)-1,ds_grid_height(c)-1,-1);
        c[#9,0] = 1; c[#9,1] = 0;
        c[#0,0] = 0; c[#0,1] = 30; //stone, 30
        c[#1,0] = 1; c[#1,1] = 20; //wood log, 20
        cr[#1,1] = ds_grid_write(c);
        //2: shovel
        ds_grid_set_region(c,0,0,ds_grid_width(c)-1,ds_grid_height(c)-1,-1);
        c[#9,0] = 1; c[#9,1] = 2;
        c[#0,0] = 0; c[#0,1] = 10; //stone, 10
        c[#1,0] = 1; c[#1,1] = 20; //wood log, 20
        cr[#1,2] = ds_grid_write(c);
        //3: sword
        ds_grid_set_region(c,0,0,ds_grid_width(c)-1,ds_grid_height(c)-1,-1);
        c[#9,0] = 1; c[#9,1] = 3;
        c[#0,0] = 9; c[#0,1] = 30; //iron bar, 30
        c[#1,0] = 1; c[#1,1] = 10; //wood log, 10
        cr[#1,3] = ds_grid_write(c);
        //4: fishing rod
        ds_grid_set_region(c,0,0,ds_grid_width(c)-1,ds_grid_height(c)-1,-1);
        c[#9,0] = 1; c[#9,1] = 4;
        c[#0,0] = 59; c[#0,1] = 30; //spider web, 30
        c[#1,0] = 1; c[#1,1] = 1; //wood log, 1
        cr[#1,4] = ds_grid_write(c);
        //5: watering
        ds_grid_set_region(c,0,0,ds_grid_width(c)-1,ds_grid_height(c)-1,-1);
        c[#9,0] = 1; c[#9,1] = 5;
        c[#0,0] = 1; c[#0,1] = 50; //wood log, 50
        c[#1,0] = 6; c[#1,1] = 49; //coin, 49
        cr[#1,5] = ds_grid_write(c);
        //6: TNT
        ds_grid_set_region(c,0,0,ds_grid_width(c)-1,ds_grid_height(c)-1,-1);
        c[#9,0] = 0; c[#9,1] = 56; c[#10,0] = 1;
        c[#0,0] = 55; c[#0,1] = 4; //gunpowder, 4
        c[#1,0] = 10; c[#1,1] = 5; //sand, 5
        c[#2,0] = 6;  c[#2,1] = 10;//coin, 10
        cr[#1,6] = ds_grid_write(c);
        //7: balloon
        ds_grid_set_region(c,0,0,ds_grid_width(c)-1,ds_grid_height(c)-1,-1);
        c[#9,0] = 0; c[#9,1] = 62; c[#10,0] = 1;
        c[#0,0] = 1; c[#0,1] = 400; //wood log, 400
        c[#1,0] = 59; c[#1,1] = 999; //spider web, 999
        c[#2,0] = 6;  c[#2,1] = 499; //coin, 499
        cr[#1,7] = ds_grid_write(c);
db[?DB_CRAFT_REQUIREMENT] = ds_grid_write(cr); ds_grid_destroy(cr); ds_grid_destroy(c);

//item sell price
var isp = ds_list_create();
    isp[|2] = 1; //wooden wall
    isp[|4] = 1; //wooden floor
    isp[|5] = 1; //wooden door
    isp[|7] = 2; //iron ore
    isp[|9] = 3; //iron ingot
    //plants
    isp[|12] = 3;//sunflower
    isp[|13] = 1;//corn
    isp[|14] = 2;//avocado
    isp[|15] = 1;//orange
    isp[|16] = 1;//coffee
    isp[|17] = 1;//potato
    isp[|18] = 1;//cassava
    isp[|19] = 2;//strawberry
    isp[|20] = 1;//grapes
    isp[|21] = 1;//wheat
    
    isp[|22] = 2;//rice
    isp[|23] = 3;//pineapple
    isp[|24] = 2;//lemon
    isp[|25] = 1;//eggplant
    isp[|26] = 1;//melon
    isp[|27] = 1;//tomato
    isp[|28] = 4;//tulip
    isp[|29] = 1;//cucumber
    isp[|30] = 2;//Rose
    isp[|31] = 1;//Turnip
db[?DB_ITEM_SELL_PRICE] = ds_list_write(isp); ds_list_destroy(isp);

//object item drops
var oid = ds_list_create();for(i=0;i<ds_s;i++){oip[|i]=-1;}
var o = ds_list_create();
    //6: spider
        //drop: web
        o[|0] = 59;
        o[|1] = 1;
        o[|2] = 2;
        o[|3] = 50;
    oid[|6] = ds_list_write(o);
db[?DB_OBJECT_ITEM_DROP] = ds_list_write(oid); ds_list_destroy(oid); ds_list_destroy(o);

//object item pick
var oip = ds_list_create(); for(i=0;i<db_items;i++){oip[|i]=-1;}
    //[|item id] = object id
    oip[|8] = 1; //smelter
    oip[|53]= 10;//table
    oip[|54]= 11;//sit place
    oip[|61]= 2; //lamp
    oip[|62]= 12;//small table
db[?DB_OBJECT_PICK] = ds_list_write(oip); ds_list_destroy(oip);

//object XP gain
var oxg = ds_list_create();
    oxg [|4] = 25;
    oxg [|5] = 15;
    oxg [|6] = 80;
    oxg [|7] = 50;
db[?DB_OBJECT_XP] = ds_list_write(oxg); ds_list_destroy(oxg);

//plant grows
var pg = ds_grid_create(db_plants,db_plant_data);
    //[x,0] = plant id (from texture position in spr_plant_tile multiplied by 5)
    //[x,1] = days to grow (multiplied by 4)
    //[x,2] = ground requirement (0: grassy, 1: dry, 2: wet, 3: fine (manually watered)
    //[x,3] = weather suitable (spring, summer, fall, winter)
    //[x,4] = item id (outcome) to give
    //[x,5] = item amount to give
    //[x,6] = collision
    
    //actual growing time divided by 16 = calculated days to grow
    
    //sunflower
    pg[#0,PLANT_ID] = 0;
    pg[#0,PLANT_GROW] = 5;
    pg[#0,PLANT_GROUND] = 3;
    pg[#0,PLANT_WEATHER] = 1;
    pg[#0,PLANT_PRODUCT] = 12;
    pg[#0,PLANT_AMOUNT] = 1;
    pg[#0,PLANT_SEED] = 32;
    
    //corn
    pg[#1,PLANT_ID] = 5;
    pg[#1,PLANT_GROW] = 3;
    pg[#1,PLANT_GROUND] = 1;
    pg[#1,PLANT_WEATHER] = 1;
    pg[#1,PLANT_PRODUCT] = 13;
    pg[#1,PLANT_AMOUNT] = 1;
    pg[#1,PLANT_SEED] = 33;
    
    //avocado
    pg[#2,PLANT_ID] = 10;
    pg[#2,PLANT_GROW] = 5;
    pg[#2,PLANT_GROUND] = 1;
    pg[#2,PLANT_WEATHER] = -1; //-signed means permanent, but only specified weather will give an item at first day of month, starts by spring at 1 to winter at 4, 5 means every month
    pg[#2,PLANT_PRODUCT] = 14;
    pg[#2,PLANT_AMOUNT] = 9;
    pg[#2,PLANT_SEED] = 34;
    
    //orange
    pg[#3,PLANT_ID] = 15;
    pg[#3,PLANT_GROW] = 5;
    pg[#3,PLANT_GROUND] = 1;
    pg[#3,PLANT_WEATHER] = -2;
    pg[#3,PLANT_PRODUCT] = 15;
    pg[#3,PLANT_AMOUNT] = 18;
    pg[#3,PLANT_SEED] = 35;
    
    //coffee
    pg[#4,PLANT_ID] = 20;
    pg[#4,PLANT_GROW] = 4;
    pg[#4,PLANT_GROUND] = 1;
    pg[#4,PLANT_WEATHER] = -1;
    pg[#4,PLANT_PRODUCT] = 16;
    pg[#4,PLANT_AMOUNT] = 21;
    pg[#4,PLANT_SEED] = 36;
    
    //potato
    pg[#5,PLANT_ID] = 25;
    pg[#5,PLANT_GROW] = 3;
    pg[#5,PLANT_GROUND] = 2;
    pg[#5,PLANT_WEATHER] = 0;
    pg[#5,PLANT_PRODUCT] = 17;
    pg[#5,PLANT_AMOUNT] = 1;
    pg[#5,PLANT_SEED] = 37;
    
    //cassava
    pg[#6,PLANT_ID] = 30;
    pg[#6,PLANT_GROW] = 4;
    pg[#6,PLANT_GROUND] = 1;
    pg[#6,PLANT_WEATHER] = 1;
    pg[#6,PLANT_PRODUCT] = 18;
    pg[#6,PLANT_AMOUNT] = 3;
    pg[#6,PLANT_SEED] = 38;
    
    //strawberry
    pg[#7,PLANT_ID] = 35;
    pg[#7,PLANT_GROW] = 3;
    pg[#7,PLANT_GROUND] = 3;
    pg[#7,PLANT_WEATHER] = 0;
    pg[#7,PLANT_PRODUCT] = 19;
    pg[#7,PLANT_AMOUNT] = 1;
    pg[#7,PLANT_SEED] = 39;
    
    //grape
    pg[#8,PLANT_ID] = 40;
    pg[#8,PLANT_GROW] = 2;
    pg[#8,PLANT_GROUND] = 2;
    pg[#8,PLANT_WEATHER] = 0;
    pg[#8,PLANT_PRODUCT] = 20;
    pg[#8,PLANT_AMOUNT] = 1;
    pg[#9,PLANT_SEED] = 40;
    
    //wheat
    pg[#9,PLANT_ID] = 45;
    pg[#9,PLANT_GROW] = 3;
    pg[#9,PLANT_GROUND] = 2;
    pg[#9,PLANT_WEATHER] = 0;
    pg[#9,PLANT_PRODUCT] = 21;
    pg[#9,PLANT_AMOUNT] = 1;
    pg[#9,PLANT_SEED] = 41;
    
    //rice
    pg[#10,PLANT_ID] = 50;
    pg[#10,PLANT_GROW] = 3;
    pg[#10,PLANT_GROUND] = 2;
    pg[#10,PLANT_WEATHER] = 2;
    pg[#10,PLANT_PRODUCT] = 22;
    pg[#10,PLANT_AMOUNT] = 1;
    pg[#10,PLANT_SEED] = 42;
    
    //pineapple
    pg[#11,PLANT_ID] = 55;
    pg[#11,PLANT_GROW] = 3;
    pg[#11,PLANT_GROUND] = 2;
    pg[#11,PLANT_WEATHER] = 1;
    pg[#11,PLANT_PRODUCT] = 23;
    pg[#11,PLANT_AMOUNT] = 1;
    pg[#11,PLANT_SEED] = 43;
    
    //lemon
    pg[#12,PLANT_ID] = 60;
    pg[#12,PLANT_GROW] = 5;
    pg[#12,PLANT_GROUND] = 1;
    pg[#12,PLANT_WEATHER] = -1;
    pg[#12,PLANT_PRODUCT] = 24;
    pg[#12,PLANT_AMOUNT] = 12;
    pg[#12,PLANT_SEED] = 44;
    
    //eggplant
    pg[#13,PLANT_ID] = 65;
    pg[#13,PLANT_GROW] = 5;
    pg[#13,PLANT_GROUND] = 2;
    pg[#13,PLANT_WEATHER] = -3;
    pg[#13,PLANT_PRODUCT] = 25;
    pg[#13,PLANT_AMOUNT] = 12;
    pg[#13,PLANT_SEED] = 45;
    
    //melon
    pg[#14,PLANT_ID] = 70;
    pg[#14,PLANT_GROW] = 3;
    pg[#14,PLANT_GROUND] = 2;
    pg[#14,PLANT_WEATHER] = 0;
    pg[#14,PLANT_PRODUCT] = 26;
    pg[#14,PLANT_AMOUNT] = 1;
    pg[#14,PLANT_SEED] = 46;
    
    //tomato
    pg[#15,PLANT_ID] = 75;
    pg[#15,PLANT_GROW] = 3;
    pg[#15,PLANT_GROUND] = 2;
    pg[#15,PLANT_WEATHER] = 0;
    pg[#15,PLANT_PRODUCT] = 27;
    pg[#15,PLANT_AMOUNT] = 10;
    pg[#15,PLANT_SEED] = 47;
    
    //tulip
    pg[#16,PLANT_ID] = 80;
    pg[#16,PLANT_GROW] = 5;
    pg[#16,PLANT_GROUND] = 2;
    pg[#16,PLANT_WEATHER] = -1;
    pg[#16,PLANT_PRODUCT] = 28;
    pg[#16,PLANT_AMOUNT] = 1;
    pg[#16,PLANT_SEED] = 48;
    
    //cucumber
    pg[#17,PLANT_ID] = 85;
    pg[#17,PLANT_GROW] = 4;
    pg[#17,PLANT_GROUND] = 2;
    pg[#17,PLANT_WEATHER] = 1;
    pg[#17,PLANT_PRODUCT] = 29;
    pg[#17,PLANT_AMOUNT] = 5;
    pg[#17,PLANT_SEED] = 49;
    
    //rose
    pg[#18,PLANT_ID] = 90;
    pg[#18,PLANT_GROW] = 4;
    pg[#18,PLANT_GROUND] = 2;
    pg[#18,PLANT_WEATHER] = -2;
    pg[#18,PLANT_PRODUCT] = 30;
    pg[#18,PLANT_AMOUNT] = 1;
    pg[#18,PLANT_SEED] = 50;
    
    //turnip
    pg[#19,PLANT_ID] = 95;
    pg[#19,PLANT_GROW] = 3;
    pg[#19,PLANT_GROUND] = 2;
    pg[#19,PLANT_WEATHER] = 0;
    pg[#19,PLANT_PRODUCT] = 31;
    pg[#19,PLANT_AMOUNT] = 1;
    pg[#19,PLANT_SEED] = 51;
    
db[?DB_PLANT_GROWS]=ds_grid_write(pg); ds_grid_destroy(pg);

//tool damage (affects objects)
var otp = ds_grid_create(db_objects,db_tools);
ds_grid_set_region(otp,0,0,ds_grid_width(otp)-1,ds_grid_height(otp)-1,0);
    //0: pickaxe
    otp[#1,0] = 6;//smelter
    //1: axe
    otp[#5,1] = 2;//monster0: ladybug
    otp[#6,1] = 3;//monster1: spider
    otp[#7,1] = 4;//monster2: grasshopper
    //2: shovel
    otp[#4,2] = 4;//plants
    //3: iron sword
    otp[#5,3] = 4;//monster0: ladybug
    otp[#6,3] = 6;//monster1: spider
    otp[#7,3] = 7;//monster2: grasshopper
db[?DB_TOOL_DMG] = ds_grid_write(otp); ds_grid_destroy(otp);

//tool power (affects blocks)
var btp = ds_grid_create(db_blocks,db_tools); //[blocks, tools]
ds_grid_set_region(btp,0,0,ds_grid_width(btp)-1,ds_grid_height(btp)-1,0);
    //0: pickaxe
    btp[#1,0] = 7;
    btp[#10,0]= 6;
    btp[#22,0]= 6.5;
    //1: axe 
    btp[#2, 1] = 6;
    btp[#3, 1] = 6;
    btp[#5, 1] = 4;
    btp[#7, 1] = 6;
    btp[#8, 1] = 6;
    btp[#9, 1] = 6;
    btp[#18,1] = 6;
    btp[#19,1] = 4;
    btp[#20,1] = 3;
    btp[#21,1] = 5;
    btp[#23,1] = 5;
    //2: shovel
    btp[#0 ,2] = 4; 
    btp[#4 ,2] = 4;
    btp[#12,2] = 6;
    btp[#14,2] = 4;
    btp[#15,2] = 6;
    btp[#16,2] = 4;
    //4: fishing rod
    btp[#6, 4] = 4;
db[?DB_TOOL_POWER] = ds_grid_write(btp); ds_grid_destroy(btp);

//tool upgrade requirements
var tur = ds_list_create();
    tur[|0] = 0;//common pickaxe, stone
    tur[|1] = 1;//common axe, wood log
    tur[|2] = 0;//common shovel, stone
    tur[|3] = 9;//common sword, iron ingot
    tur[|4] = 59;//fishing rod: spider web
db[?DB_TOOL_UPGRADE_REQUIREMENT] = ds_list_write(tur); ds_list_destroy(tur);

//shop stuffs
var shop = ds_list_create(); var shoptype = ds_list_create(); var shopprice = ds_list_create();
//price multiplied by 5
shop[|0] = 3; shoptype[|0] = 0; shopprice[|0] = 20; //NRG Drink (100)
shop[|1] = 6; shoptype[|1] = 0; shopprice[|1] = 2; //Coin (10)
db[?DB_SHOP_ID] = ds_list_write(shop); db[?DB_SHOP_TYPE] = ds_list_write(shoptype); db[?DB_SHOP_PRICE] = ds_list_write(shopprice); ds_list_destroy(shop); ds_list_destroy(shoptype); ds_list_destroy(shopprice);

//gacha table
var gt = ds_list_create(); var i = 0; while(i<=99){gt[|i] = 0; i++;}
gt[|0] = 3;
gt[|1] = 3;
gt[|2] = 4;
gt[|3] = 4;
i = 33; while(i<44){gt[|i]=1;i++;}
i = 44; while(i<55){gt[|i]=2;i++;}
db[?DB_GACHA_TABLE] = func_data(n0,base64_encode(ds_list_write(gt))); ds_list_destroy(gt);

//worker star
var ws = ds_list_create();
ws[|0] = 1;
ws[|1] = 2;
ws[|2] = 2;
ws[|3] = 3;
ws[|4] = 3;
db[?DB_WORKER_STAR] = ds_list_write(ws); ds_list_destroy(ws);

//quest rewards
var qr = ds_map_create();

    // type
    // - 0 : item
    // - 1 : tool
    // - 2 : worker
    // - 3 : rank_xp
    // - 4 : rp
    // - 5 : gp
    // id : of db (rank_xp, rp, gp is no need)
    // amount
    
    //2020-jan
    qr[?"2020_jan_kill_spider" + "_type" ] = 0;
    qr[?"2020_jan_kill_spider" + "_id"   ] = 9;
    qr[?"2020_jan_kill_spider" + "_count"] = 20;
    
    qr[?"2020_jan_kill_grasshopper" + "_type" ] = 4;
    qr[?"2020_jan_kill_grasshopper" + "_count"] = 10000;
    
    qr[?"2020_jan_kill_ladybug" + "_type" ] = 5;
    qr[?"2020_jan_kill_ladybug" + "_count"] = 20;
    
db[?DB_QUEST_REWARD] = func_data(n0, base64_encode(ds_map_write(qr))); ds_map_destroy(qr);

js_debug(func_data(n0,base64_encode(ds_map_write(db)))); ds_map_destroy(db);
