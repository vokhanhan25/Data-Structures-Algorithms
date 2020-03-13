uses math;
const fi='BALL.inp';
      fo='BALL.out';
      maxc=2500;
      maxn=100;
var n,a,b,c,w:longint;
f1,f2,f3,f:array [0..maxc,0..maxc] of int64;
f4:array [0..maxn,0..maxn,0..maxn] of int64;

procedure rf;
var i,j,k:longint;
begin
    readln (n,a,b,c,w);
    for i:=1 to n do
     for j:=1 to n do read (f1[i,j]);
    readln;
    for i:=1 to n do
     for j:=1 to n do read (f2[i,j]);
    readln;
    for i:=1 to n do
     for j:=1 to n do read (f3[i,j]);
    for i:=1 to n do
     for j:=1 to n do
      for k:=1 to n do read (f4[i,j,k]);
end;

function tinh (i,t2,t3:longint):int64;
var j,k:longint; tm,best:int64;
begin
    if F[t2,t3]>-1 then exit (F[t2,t3]);
    if i=0 then exit (0);
    best:=-trunc(1e18);
    for j:=0 to n-1 do
     if (t2 and (1 shl j))>0 then
      for k:=0 to n-1 do
       if (t3 and (1 shl k))>0 then
       begin
           tm:=tinh(i-1,t2-(1 shl j),t3-(1 shl k))+w*f4[i,j+1,k+1]+a*f1[i,j+1]+b*f2[i,k+1]+c*f3[j+1,k+1];
           if tm>best then best:=tm;
       end;
      F[t2,t3]:=best;
     exit (best);
end;

procedure pr;
var i,j:longint; tm:int64;
begin
    for i:=0 to 2500 do
     for j:=0 to 2500 do
      F[i,j]:=-1;
     tm:=0;
    for i:=0 to n-1 do
     tm:=tm+1 shl i;
    write (tinh(n,tm,tm));
end;


begin
    assign (input,fi); reset (input);
    assign (output,fo); rewrite (output);
    rf;
    pr;
    close (input); close (output);
end.

