uses math;
const fi='TWO.inp';
      fo='TWO.out';
      maxn=10001;
type rec=record
     x,y,cs:longint;
     end;
mang=array [1..maxn] of rec;
var n,k1,k2,res:longint;
a,b,c:mang;
procedure rf;
var i:longint;
begin
    readln (n);
    for i:=1 to n do read (a[i].x);
    readln;
    for i:=1 to n do read (a[i].y);
end;

procedure init;
var i:longint;
begin
    k1:=0; k2:=0;
    for i:=1 to n do
     if a[i].x<=a[i].y then
     begin
         inc (k1);
         b[k1]:=a[i];
         b[k1].cs:=i;
     end
     else begin
         inc (k2);
         c[k2]:=a[i];
         c[k2].cs:=i;
     end;
end;

procedure sort;
var i,j:longint; tm:rec;
begin
    for i:=1 to k1-1 do
     for j:=i+1 to k1 do
      if b[j].x<b[i].x then
      begin
          tm:=b[i];
          b[i]:=b[j];
          b[j]:=tm;
      end;
      for i:=1 to k2-1 do
       for j:=i+1 to k2 do
        if c[j].y>c[i].y then
        begin
            tm:=c[i];
            c[i]:=c[j];
            c[j]:=tm;
        end;
end;

procedure pr;
var i,s:longint;
begin
    res:=0; s:=0;
    for i:=1 to k1 do
    begin
        s:=s+b[i].x;
        if s>res then res:=s;
        res:=res+b[i].y;
    end;

    for i:=1 to k2 do
    begin
        s:=s+c[i].x;
        if s>res then res:=s;
        res:=res+c[i].y;
    end;

    writeln (res);
    for i:=1 to k1 do write (b[i].cs,' ');
    for i:=1 to k2 do write (c[i].cs,' ');
end;

begin
    assign (input,fi); reset (input);
    assign (output,fo); rewrite (output);
    rf;
    init;
    sort;
    pr;
    close (input); close (output);
end.
