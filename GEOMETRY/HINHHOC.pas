uses math;
const fi='HINHHOC.inp';
      fo='HINHHOC.out';
      maxn=100;
var xa,ya,xb,yb,xm,ym:longint;
a:array [1..maxn] of longint;

procedure rf;
var i:longint;
begin
    readln (xa,ya);
    readln (xb,yb);
    readln (xm,ym);
end;

function MeAB(x,y:longint):boolean;
begin
    if (ya-yb)*x+(xb-xa)*y+(xa*yb-xb*ya)=0 then         {duong thang}
    // if (min(xa,xb)<=x) and (x<=max(xa,xb)) and (min(ya,yb)<=y) and (y<=max(ya,yb)) then  {mo ra khi la doan thang}
    // if ((x-xa)*(xb-xa)>=0) and ((y-ya)*(yb-ya)>=0) then {mo ra khi la tia}
      exit (true);
    exit (false);
end;

procedure giao(a1,b1,c1,a2,b2,c2:longint);
var d,dx,dy:longint; x,y:real;
begin
    {ax+by+c=0}
    D:=a1*b2-a2*b1;
    Dx:=c2*b1-c1*b2;
    Dy:=a2*c1-a1*c2;
    if (D=Dx) and (Dx=Dy) and (D=0) then {trung nhau};
    if (D=0) and ((Dx=0) or (Dy=0)) then {song song};
    if Dx<>0 then {Cat nhau tai...}
    begin
        x:=Dx/d;
        y:=dy/d;
    end;
end;

procedure pr;
begin

end;

begin
    assign (input,fi); reset(input);
    assign (output,fo); rewrite (output);
    rf;
    close (input); close (output);
end.
