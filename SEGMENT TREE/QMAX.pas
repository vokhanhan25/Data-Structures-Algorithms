uses math;
const fi='QMAX.inp';
      fo='QMAX.out';
      maxn=50001;
var n,q,p,gt:longint;
tmax,a:array [1..4*maxn] of longint;
procedure swap (var a,b:longint);
var tm:longint;
begin
    tm:=a;
    a:=b;
    b:=tm;
end;

procedure init(k,d,c,i,j:longint);
var m:longint;
begin
    if (j<d) or (c<i) then exit;
    if (i<=d) and (j>=c) then
    begin
        a[k]:=a[k]+gt;
        exit;
    end;
    m:=(d+c) div 2;
    init (k*2,d,m,i,j);
    init (k*2+1,m+1,c,i,j);
    tmax[k]:=max(tmax[k*2]+a[k*2],tmax[k*2+1]+a[k*2+1]);
end;

function findmax(k,d,c,i,j:longint):longint;
var m:longint;
begin
    if (j<d) or (c<i) then exit (0);
    if (i<=d) and (j>=c) then exit (tmax[k]+a[k]);
    m:=(d+c) div 2;
    findmax:=max(findmax(k*2,d,m,i,j),findmax(k*2+1,m+1,c,i,j))+a[k];
end;

procedure rf;
var u,v:longint;
begin
    readln (n,q);
    while q>0 do
    begin
        readln (u,v,gt);
        if u>v then swap (u,v);
        init (1,1,n,u,v);
        dec (q);
    end;

    readln (p);
    while p>0 do
    begin
        readln (u,v);
        if u>v then swap (u,v);
        writeln (findmax(1,1,n,u,v));
        dec (p);
    end;
end;

begin
    assign (input,fi); reset (input);
    assign (output,fo); rewrite (output);
    rf;
    close (input); close (output);
end.


