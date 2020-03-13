uses math;
const fi='MACHINE.inp';
      fo='MACHINE.out';
      maxn=10001;
type rec=record
     x,y,cs,z:longint;
     end;
mang=array [1..maxn] of rec;
var n,k1,k2,res:longint;
a,b,c:mang;
procedure rf;
var i,x:longint;
begin
    readln (n);
    for i:=1 to n do read (a[i].x);
    readln;
    for i:=1 to n do read (a[i].y);
    readln;
    for i:=1 to n do read (a[i].z);
end;

procedure init;
var i:longint;
begin
    k1:=0; k2:=0;
    for i:=1 to n do
     if a[i].x+a[i].y<=a[i].y+a[i].z then
     begin
         inc (k1);
         b[k1].x:=a[i].x+a[i].y;
         b[k1].y:=a[i].y+a[i].z;
         b[k1].cs:=i;
     end
     else begin
         inc (k2);
         c[k2].x:=a[i].x+a[i].y;
         c[k2].y:=a[i].y+a[i].z;
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
var i,s1,s2:longint;
begin
    res:=0; s1:=0; s2:=0;
    for i:=1 to k1 do
    begin
        s1:=s1+a[b[i].cs].x;
        if s1>s2 then s2:=s1;
        s2:=s2+a[b[i].cs].y;
        if s2>res then res:=s2;
        res:=res++a[b[i].cs].z;
    end;

    for i:=1 to k2 do
    begin
        s1:=s1+a[c[i].cs].x;
        if s1>s2 then s2:=s1;
        s2:=s2+a[c[i].cs].y;
        if s2>res then res:=s2;
        res:=res++a[c[i].cs].z;
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
