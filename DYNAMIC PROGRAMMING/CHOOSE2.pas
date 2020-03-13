uses math;
const fi='CHOOSE2.inp';
      fo='CHOOSE2.out';
      maxn=500;
      maxc=trunc(2e9);
var n,m:longint;
a,sc,sd:array [0..maxn,0..maxn] of longint;
b:array [1..maxn] of longint;
procedure rf;
var i,j:longint;
begin
    readln (m,n);
    for i:=1 to m do
    begin
        for j:=1 to n do read (a[i,j]);
        readln;
    end;

    for i:=1 to m do
     for j:=1 to n do
     begin
         sc[i,j]:=sc[i-1,j]+a[i,j];
         sd[i,j]:=sd[i,j-1]+a[i,j];
     end;
end;

procedure pr;
var minc,i,res,c1,c2,m1,m2,tm,sum:longint;
begin
   res:=0; sum:=0; res:=-maxc;
    for c1:=1 to n-1 do
     for c2:=c1+1 to n do
     begin
         if (c1=1) and (c2=3) then
         begin
             write;
         end;
         minc:=maxc;
         for i:=1 to m do
         begin
             tm:=sc[i,c1]-sc[0,c1]+sc[i,c2]-sc[0,c2]+sd[i,c2-1]-sd[i,c1];
             if tm-minc>res then res:=tm-minc;
             minc:=min(minc,sc[i-1,c1]-sc[0,c1]+sc[i-1,c2]-sc[0,c2]-(sd[i,c2-1]-sd[i,c1]));
         end;
     end;
     write (res);
end;

begin
    assign (input,fi); reset (input);
    assign (output,fo); rewrite (output);
    rf;
    pr;
    close (input); close (output);
end.
