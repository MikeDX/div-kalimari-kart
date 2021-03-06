program kart;


global

kartid=0;

pipegraph[] = 1,700;


playergraph[12*30];

mariograph[]=28,
8, // right
7,6,5,4,3,2,
1 // up
,-2,-3,-4,-5,-6,-7,
-8, // left
-9,-9,-10,-10,-11,-11,
12, // down
11,11,10,10,9,9;

ashgraph[]=8,
-1,  // right
6,
5,// up
4,
1, // left
2,
3,// down
-2;

pikagraph[]=8,
7,8,9,-8,
-7,10,11,-10;

turbograph[]=8,
-12,-13,14,13,
12,15,16,-15;

tetris1[]=4,
17,18,19,20;


tetris2[]=4,
21,22,23,24;

tetris3[]=4,
25,26,27,28;

samus[]=4,
-29,31,29,30;

subzero[]=4,
32,33,-32,34;

scorpion[]=4,
36,37,-36,38;

kirby[]=4,
40,41,-40,42;

megaman[]=8,
-43,-44,45,44,
43,46,47,-46;

masterchief[]=4,
48,49,-48,50;

petey[]=4,
55,53,-55,54;

littlemac[]=8,
-56,-57,58,57,
56,56,59,-56;

honeyqueen[]=4,
60,61,-60,62;

across1[]=8,
63,64,65,-64,
-63,-63,66,63;

across2[]=8,
67,68,69,-68,
-67,-67,70,67;

across3[]=8,
71,72,73,-72,
-71,-71,74,71;

cjgraph[]=4,
75,76,-75,77;

eggman[]=4,
-78,79,78,80;

gngarthur[]=8,
-81,-82,83,82,
81,81,84,-81;

nathendrake[]=8,
88,89,90,-89,
-88,-88,91,88;

babymario[]=8,
92,93,94,-93,
-92,95,96,-95;

babyluigi[]=8,
97,98,99,-98,
-97,100,101,-100;

kamek[]=8,
102,103,104,-103,
-102,105,106,-105;

sonic[]=8,
107,108,109,-108,
-107,110,111,-110;

tails[]=8,
112,113,114,-113,
-112,115,116,-115;

steve[]=8,
117,118,119,-118,
-117,120,121,-120;

bomberman[]=8,
122,123,124,-123,
-122,125,126,-125;

bigdaddy[]=8,
127,128,129,129,
130,130,131,127;

bowserjr[]=8,
132,133,134,-133,
-132,-135,136,135;

srageaxel[]=8,
137,138,139,-138,
-137,137,140,137;

srageskate[]=8,
141,142,143,-142,
-141,-141,144,141;

solidsnake[]=4,
146,145,
-146,147;

ratchetclank[]=8,
148,149,150,-149,
-148,-148,151,148;

traingraph[]=8,
1,12,2,-12,
-1,3,4,5;

tendergraph[]=8,
6,7,8,-7,
6,7,8,-7;

carriage[]=8,
9,10,11,-10,
9,10,11,-10;



//,3,2,1,4,5,6;
//1,2,3,4,5,6;

// 900 = mario circuit 1
// 901 =
// 902 = ghost house level
// 903 = bowsers castle
coursemap = 905;
maphard = 955;

back1=801;
back2=0;
// 863 = bowsers castle
// 852 = mario circuit
// 856 = black *ghost house)
courseback=852;
ps=7;

file1;
file2;
file3;

bstate=0;
bstopped=0;
butt7;
butt3;
bstoppin=0;
ammo=0;
bammo;
btime;
c_coin = 143;
coins=0;
coin_fx=0;

local

speed;



private

a=0;
b=0;
w=640;
h=480;
point = 0;
//mult=1;
p1=0;
music=0;

begin

// Load graphics
file1=load_fpg("kdkart/kart2.FPG");
file2=load_fpg("kdkart/ash.fpg");
file3=load_fpg("kdkart/train.fpg");
music=load_song("kdkart/kd.ogg",1);
coin_fx = load_wav("kdkart/coin.wav",0);

song(music);

fade_on();
set_fps(30,0);


// setup graphics
for(a=0;a<12;a++)
    // 28 frames per player
    playergraph[a*30]=28;

    for(b=1;b<29;b++)

        // if not mirrored
        if(mariograph[b]>0)
            playergraph[(a*30)+b]=mariograph[b]+(a*17);
        else
            playergraph[(a*30)+b]=0-(abs(mariograph[b])+(a*17));
        end

    end

end



// set graphics mode
set_mode(w*1000+h);

// setup region player 1
define_region(1,0,0,w,27);
define_region(2,0,0,w,h/2);

start_scroll(0,file1,back1,back2,1,5);
start_mode7(0,file1,coursemap,courseback,2,25);

m7.height=96;
//m7.camera=player(0,912,684,90000);
get_point(file, coursemap, 8, &x , &y);

m7.camera=player(-1,x,y,90000);


m7.distance=60;

//setup region (player 2)
define_region(3,0,h/2,w,27);
define_region(4,0,h/2,w,h/2);

start_scroll(1,file1,3,2,3,5);
start_mode7(1,file1,coursemap,courseback,4,27);

m7[1].height=32;
m7[1].distance=100;
m7.color=1;
m7[1].color=1;


//m7[1].camera=
//while(!key(_space))
frame;
//end

FROM point = 1 to 7;
//point =1 ;
get_point(file, coursemap, point, &x , &y);

player(point, x,y,90000);

end

IF ( FALSE )

y-=20;


//FROM point = 1 to 4;
y+=20;
//debug;
x=926;//
//x-=30;
x-=5;

player(graph,x-15,y,90000);
player(graph+1,x-10,y,90000);
player(graph+2,x-5,y,90000);
player(graph+3,x,y,90000);
player(graph+4,x+5,y,90000);
player(graph+5,x+10,y,90000);
player(graph+6,x+15,y,90000);
player(graph+7,x+20,y,90000);
player(graph+8,x+25,y,90000);
player(graph+9,x+30,y,90000);
player(graph+10,x+35,y,90000);
player(graph+11,x+40,y,90000);
player(graph+12,x+45,y,90000);
player(graph+13,x+50,y,90000);
player(graph+14,x+55,y,90000);



//y+=20;

graph +=15;
IF ( graph > 42 )
graph = 0;
END

/*
player(graph,x-10,y,90000);
player(graph+1,x-5,y,90000);
player(graph+2,x,y,90000);
player(graph+3,x+5,y,90000);
player(graph+4,x+10,y,90000);



graph += 5;
*/
end

FROM point = 10 to 17;// to 255;

get_point(file, coursemap, point, &x, &y);
pipe(x,y);

end

train();


/*
player(14,981,625,90000);
player(15,976,625,90000);
player(16,971,625,90000);
player(17,966,625,90000);


player(2,952,648,90000);
player(18,947,648,90000);
player(19,942,648,90000);
player(20,937,648,90000);


player(3,981,672,90000);
player(21,976,672,90000);
player(22,971,672,90000);
player(23,966,672,90000);

player(4,952,696,90000);
player(24,947,696,90000);
player(25,942,696,90000);
player(26,937,696,90000);

player(5,981,720,90000);
player(27,976,720,90000);
player(28,971,720,90000);
player(29,966,720,90000);


player(6,952,744,90000);
player(30,947,744,90000);
player(31,942,744,90000);
player(32,937,744,90000);

player(33,952,603,90000);
player(7,947,603,90000);
player(34,942,603,90000);
player(35,937,603,90000);

player(8,976,768,90000);
player(9,971,768,90000);
player(10,966,768,90000);
player(36,966,768,90000);

*/


m7[1].camera=map();

// main loop

p1=m7.camera;
loop
//if(p1!=0)
//map_xput(file1,coursemap,505,(p1.x%10240)/10,(p1.y%10240)/10,p1.angle-90000,200,4);

//if(m7.camera!=0)

//stop_mode7(0);
//stop_mode7(1);

//start_mode7(0,file1,coursemap,courseback,2,27);
//start_mode7(1,file1,coursemap,courseback,4,27);
//m7.height=48;
//m7.camera=player(0,912,684,90000);
//m7.camera=p1;
//layer(-1,981,768,90000);
//m7.distance=36;
//end

//p1=m7.camera;

//    frame;
//end

if(key(_f1))
x=rand(0,100);
for( point = 0 ;point<x;point++)

m7.camera=get_id(type player);
//frame;
end

end


frame;

end

end

PROCESS pipe(x,y);

begin

ctype = c_m7;
x=x*10;
y=y*10;
resolution=10;

xgraph = offset pipegraph;
cnumber = c_0;
mapchar();

loop

frame;
end

end


process player(mid,x,y,angle)


private
    accel=0;
    playernum=0;//false;
p1;
cpu = false;
pixel = 0;
point = 0;
px=0;
py=0;
fangle;
cangle;
dangle;
kid=0;
c_dist;
colour_check;
c_qblock=140;

can_pickup_bonus=1;
track=900;


begin
    kartid++;
    kid=kartid;

   cnumber=c_0;
  //  x=x-24;
  //  y=y-16;

    x=x*10;
    y=y*10;

  //  if(mid&1)
  if(mid==-1)
    playernum=1;
    mid=rand(0,42);

    //file = file2;
    //xgraph=offset playergraph[mid*30];//mariograph;

    if(mid!=0)
        ps=0;
    end

  else
    cpu = 1;
    point = 100;
    get_point(file1, coursemap, point, &px, &py );

    px=px+rand(-10,10);
    py=py+rand(-10,10);

    px=px*10;
    py=py*10;
  end
  //  file = file2;
    if(mid<8)
        xgraph=offset playergraph[mid*30];//mariograph;
    else
        file = file2;

        switch(mid)

            case 8:
                xgraph = offset ashgraph;
            end

            case 9:
                xgraph = offset pikagraph;
            end

            case 10:
                xgraph = offset turbograph;
            end

            case 11:
                xgraph = offset tetris1;
            end

            case 12:
                xgraph = offset tetris2;
            end

            case 13:
                xgraph = offset tetris3;
            end

            case 14:
                xgraph = offset samus;
            end

            case 15:
                xgraph = offset subzero;
            end

            case 16:
                xgraph = offset scorpion;
            end

            case 17:
                xgraph = offset kirby;
            end

            case 18:
                xgraph = offset megaman;
            end

            case 19:
                xgraph = offset masterchief;
            end

            case 20:
                xgraph = offset petey;
            end

            case 21:
                xgraph = offset littlemac;
            end

            case 22:
                xgraph = offset honeyqueen;
            end

            case 23:
                xgraph = offset across1;
            end

            case 24:
                xgraph = offset across2;
            end

            case 25:
                xgraph = offset across3;
            end

            case 26:
                xgraph = offset cjgraph;
            end

            case 27:
                xgraph = offset eggman;
            end

            case 28:
                xgraph = offset gngarthur;
            end

            case 29:
                xgraph = offset nathendrake;
            end

            case 30:
                xgraph = offset babymario;
            end

            case 31:
                xgraph = offset babyluigi;
            end

            case 32:
                xgraph = offset kamek;
            end

            case 33:
                xgraph = offset sonic;
            end

            case 34:
                xgraph = offset tails;
            end

            case 35:
                xgraph = offset steve;
            end

            case 36:
                xgraph = offset bomberman;
            end

            case 37:
                xgraph = offset bigdaddy;
            end

            case 38:
                xgraph = offset bowserjr;
            end

            case 39:
                xgraph = offset srageaxel;
            end

            case 40:
                xgraph = offset srageskate;
            end

            case 41:
                xgraph = offset solidsnake;
            end

            case 42:
                xgraph = offset ratchetclank;
            end



        end



  //  xgraph=offset playergraph[mid*30];//
  end

 /* write_int(0,0,mid*10,0,&angle);
  write_int(0,60,mid*10,0,&fangle);
  write_int(0,120,mid*10,0,&cangle);
   */
  //  else
 //       xgraph=offset peachgraph;
 //   end

    resolution=10;
    ctype=c_m7;
    size=100;

    if(mid==1)
        flags=0;
    end

    mapchar();

p1=m7.camera;
loop

if(x>10240) x-=10240; end
if(y>10240) y-=10240; end
if(x<0) x+=10240; end
if(y<0) y+=10240; end



//frame;
if ( cpu == false )
if(key(_w) && playernum==1)
height+=2;
m7.height+=2;
end

if(key(_s) && playernum==1 && height>0)
height--;
m7.height--;
end



if( (key(_left) && playernum==1) || (key(_tab) && playernum==2))
    angle+=3000;
    scroll[playernum-1].x0-=(3600/256);
    scroll[playernum-1].x1-=(3600/512);
end

if( (key(_right) && playernum==1) || (key(_backspace) && playernum==2))
    angle-=3000;
    scroll[playernum-1].x0+=(3600/256);
    scroll[playernum-1].x1+=(3600/512);
end


if(( (key(_alt) || key(_up)) && playernum==1) || (key(_space) && playernum==2))
    if(accel<40 + 40 * (key(_space)));
    accel+=2;
    end;
    //advance(50);
else

if(accel>0 && height==0)
    accel--;
end





end

if(height>0)
height--;
m7.height--;
end

speed = accel;



//bonus catcher//////////////////////////////
from point=70 to 83;
 get_point(0,coursemap,point,&px,&py); px*=10;py*=10;

 c_dist=fget_dist(x,y,px,py);
 colour_check=map_get_pixel(0,coursemap,(px/10-1),py/10-3);
 if(colour_check==c_qblock and c_dist<90 and can_pickup_bonus)
  can_pickup_bonus=false;bonus_spinner();
  if(track==900)map_put(0,coursemap,890,px/10+1,py/10+1);else
  if(track==901)map_xput(0,coursemap,890,px/10-1,py/10-1,0,100,3);else
  if(track==902)map_xput(0,coursemap,890,px/10-1,py/10-1,0,100,3);else
  if(track==903)map_put(0,coursemap,891,px/10,py/10+1);else
  if(track==904)map_put(0,coursemap,891,px/10,py/10+1);else
  end end end end end
 end
end//////////////////////////////////////




//coin collector//////////////////////////////
from point=20 to 69;
 get_point(0,coursemap,point,&px,&py);px*=10;py*=10;
 c_dist=fget_dist(x,y,px,py);

 colour_check=map_get_pixel(0,coursemap,px/10,py/10);
 if (c_dist < 60)
 if(colour_check==c_coin)
   coins++;//20to54coins //60to71bonus's
  coin_flip(x,y);
  if(track==900)map_put(0,coursemap,854,px/10,py/10);else
  if(track==901)map_put(0,coursemap,855,px/10,py/10);else
  if(track==902)
   if((point>28 and point<32)or(point>38))map_put(0,coursemap,862,px/10+1,py/10+1);else
   map_put(0,coursemap,861,px/10+1,py/10+1);end
  else
  if(track==903)map_put(0,coursemap,854,px/10,py/10);else
  if(track==904)map_put(0,coursemap,854,px/10,py/10);else
  end end end end end
 end
 end

end//////////////////////////////////////
ELSE  // CPU CONTROLS

//px=px*10;
//py=py*10;

//debug;

if (fget_dist(x,y,px,py) < accel*10)
    //debug;
    point = point +1;

    if (point > 110 )
        point = 100;
    end

        get_point(file1, coursemap, point, &px, &py );

    px=px+rand(-accel/10,accel/10);
    py=py+rand(-accel/10,accel/10);
    px=px*10;
    py=py*10;



end


IF ( accel < 40 +kid/4 )
    accel++;
END

fangle = fget_angle(x,y,px,py);

angle = near_angle( angle, fangle ,3000 +accel*10);

/*IF ( (fangle - angle + 360000) % 360000 < 180000)

        angle +=3000;

    END


    IF ( (fangle - angle + 360000) % 360000 > 180000)

        angle -=3000;

    END

*/
//cangle = fangle - angle;
//cangle = ( ( cangle + 180000) % 360000 ) - 180000;

/*
if ( angle != fangle )


if ( cangle > 0 )
angle +=3000;
END

if (cangle < 0 )
// > fget_angle(x,y,px,py)+720000)
angle -=3000;
END

end

if ( angle > 360000)
    angle -=360000;
end

if ( angle < 0 )
    angle +=360000;
end



*/

END


advance(accel);

pixel = map_get_pixel(file1,maphard,x/80,y/80);

if ( pixel==232)
    advance (-accel);
end

if ( pixel == 108 )
    IF ( accel>=10)
        accel-=4;
    END
END


frame;

end

end

process map()

private
mult=1;

begin

write_int(0,0,0,0,&m7[1].focus);
write_int(0,0,20,0,&m7[1].distance);

x=512;
y=512;
angle=-270000;
height=-512;
m7[1].height=768*3;
m7[1].focus=300;//1408;
m7[1].distance=1408;//393;//1408;
m7[1].horizon=-145;

//m7[1].focus=512;

loop

if(shift_status>0)
mult=10;
else
mult=1;
end

if(key(_i))
m7[1].focus+=mult;
end

if(key(_k))
m7[1].focus-=mult;
end

if(key(_u))
m7[1].height+=mult;
end

if(key(_j))
m7[1].height-=mult;
end

if(key(_y))
x+=mult;
end
if(key(_h))
x-=mult;
end
if(key(_t))
y+=mult;
end
if(key(_g))
y-=mult;
end
if(key(_r))
m7[1].distance+=mult;
end
if(key(_f))
m7[1].distance-=mult;
end
if(key(_e))
m7[1].horizon+=mult;
end
if(key(_d))
m7[1].horizon-=mult;
end

//m7[1].height=mouse.x*32;
//m7[1].distance=mouse.y*16;
//m7[1].horizon=mouse.y;
//m7[1].focus=mouse.x*2;
//m7[1].distance=mouse.y*16;
frame;//(1000);

end

end


process mapchar()

begin
cnumber=c_1;

ctype=c_m7;
resolution=father.resolution;
size=1000;

xgraph=father.xgraph;
flags=father.flags;

if ( xgraph == offset eggman )
  size=500;
end

if ( xgraph == offset traingraph
|| xgraph == offset tendergraph
|| xgraph == offset carriage )

    size = 250;

end



loop
x=father.x;
y=father.y;
z=father.z;
file = father.file;
angle=father.angle;
height=father.height;

frame;

end

end



process bonus_spinner();
private bspin=32;

begin x=320;y=100;z=-200;graph=580;size=200;region=3;
      bstate=rand(0,13);bstopped=0;

region=1;

z=-2048;

loop
 if(bstate>13)bstate=1;end y+=bspin;
 if(y>150)y=0;bstate+=1;end

 switch(bstate)
  case 1: graph=580;size=200;end
  case 2: graph=581;size=200;end
  case 3: graph=582;size=200;end
  case 4: graph=583;size=200;end
  case 5: graph=589;size=225;end
  case 6: graph=593;size=200;end
  case 7: graph=586;size=200;end
  case 8: graph=587;size=200;end
  case 9: graph=580;size=200;end
  case 10: graph=589;size=225;end
  case 11: graph=590;size=125;end
  case 12: graph=591;size=170;end
  case 13: graph=592;size=100;end
 end

 IF(key(_b))bstate+=1;frame(1000);end


 if(butt7 or butt3)bstoppin=true;end
 if(bstoppin)bspin--;end

 if(bspin<0)y=52;
  if(ammo==0)bstopped=true; /*pcar.canfire=true;*/end
  if(bstate==8)bammo=10;btime=300;end
 end

frame;end end
///////////////////////////////


process coin_flip(x,y);
private coin_move;
begin ctype=c_m7;graph=500;resolution=10;size=50;
      coin_move=rand(-10,10);

sound(coin_fx,256,256);


repeat //X=FATHER.X; Y=FATHER.Y;
 height+=5+father.speed/10;flags=rand(0,3);//size+=3;
 x+=coin_move;y+=coin_move;
frame;until(height>80);end
/////////////////////////////////////



PROCESS train()


private

point = 120;
px=0;
py=0;

accel = 30;
fangle = 0;
count = 0;

BEGIN

file=file3;
size=350;

get_point(0,905,point,&x, &y);
resolution = 10;
ctype = c_m7;

x=x*10;
y=y*10;
px=x;
py=y;


angle = 90000;

xgraph = & traingraph;

clone

    y=y+1000;
    xgraph = offset tendergraph;

    from count = 1 to 3;

    //y = y + 650;

    CLONE

        y = y + 720;

        if(xgraph == offset tendergraph)

            xgraph = offset carriage;

        end

    end

    end


end


mapchar();
//point++;

LOOP
fangle = fget_angle(x,y,px,py);

angle = near_angle( angle, fangle ,3000);


if (fget_dist(x,y,px,py) < 200)
    //debug;
    point = point +1;

    if (point > 171 )
        point = 120;
    end

    get_point(file1, coursemap, point, &px, &py );

   // px=px+rand(-accel/10,accel/10);
   // py=py+rand(-accel/10,accel/10);
    px=px*10;
    py=py*10;

end

advance(accel);

FRAME;
END




END

