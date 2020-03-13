uses math;
const fi='BTN.inp';
      fo='BTN.out';
      maxn=102;
var n,k:longint; st:string;
F:array [1..maxn,1..maxn,0..maxn] of int64;
procedure rf;
var i:longint;
begin
    readln (n,k);
    readln (st);
end;

function sl(c1,c2:char):longint;
begin
    if (c1='[') and ((c2=']') or (c2='?')) then exit (1);
    if (c1='(') and ((c2=')') or (c2='?')) then exit (1);
    if (c1='{') and ((c2='}') or (c2='?')) then exit (1);
    if (c1='?') and ((c2='}') or (c2=']') or (c2=')')) then exit (1);
    if (c1='?') and (c2='?') then exit (3);
    exit (0);
end;

function tinh (i,j,k:longint):int64;
var p:longint; dem:int64;
begin
    if k<0 then exit (0);
    if F[i,j,k]>-1 then exit (F[i,j,k]);
    if i>j then exit (1);
    dem:=0;
    if i<j then
     dem:=dem+sl(st[i],st[j])*tinh(i+1,j-1,k-1);
    for p:=i+1 to j-2 do
     dem:=dem+sl(st[i],st[p])*tinh(i+1,p-1,k-1)*tinh(p+1,j,k);
     F[i,j,k]:=dem;
    exit (dem);
end;

procedure pr;
var i,j,t:longint; res,t1,t2:int64;
begin
    for i:=1 to n do
     for j:=1 to n do
      for t:=0 to n do
       F[i,j,t]:=-1;
    t1:=tinh(1,n,k);


    for i:=1 to n do
     for j:=1 to n do
      for t:=0 to n do
       F[i,j,t]:=-1;
    t2:=tinh(1,n,k-1);
    res:=t1-t2;
    write(res);
end;

begin
    assign (input,fi); reset (input);
    assign (output,fo); rewrite (output);
    rf;
    pr;
    close (input); close (output);
end.
