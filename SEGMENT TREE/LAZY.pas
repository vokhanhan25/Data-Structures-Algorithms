uses math;
const fi='GAMES.inp';
      fo='GAMES.out';
      maxn=100000;
var n,q,gt:longint;
a:array [1..maxn] of longint;
l,r,la,Tmax,t:array [1..4*maxn] of longint;

procedure build (k,d,c:longint);
var m:longint;
begin
    l[k]:=d; r[k]:=c;
    if d=c then
    begin
        la[d]:=k;
        Tmax[k]:=a[d];
    end
    else begin
        m:=(d+c) shr 1;
        build (k*2,d,m);
        build (k*2+1,m+1,c);
        Tmax[k]:=max(Tmax[k*2],Tmax[k*2+1]);
    end;
end;

procedure down(k:longint);
begin
    if t[k]=0 then exit;
    t[k*2]:=t[k];
    t[k*2+1]:=t[k];
    tmax[k*2]:=t[k];
    tmax[k*2+1]:=t[k];
    t[k]:=0;
end;

function timmax(k,i,j:longint):longint;
begin
    if (i>r[k]) or (j<l[k]) then exit (0);
    if (l[k]>=i) and (r[k]<=j) then
    begin
      // tmax[k]:=a[k];
      exit (tmax[k]);
    end;
    down(k);
    exit (max(timmax(k*2,i,j),timmax(k*2+1,i,j)));
end;


procedure update (k,i,j:longint);
var m:longint;
begin
    if (i>r[k]) or (j<l[k]) then exit;
    if (l[k]=r[k]) then
    begin
        tmax[k]:=gt;
        exit;
    end;
    if (l[k]>=i) and (r[k]<=j) then
    begin
       tmax[k]:=gt;
       t[k]:=gt;
       exit;
    end;
    down(k);
    update (k*2,i,j);
    update (k*2+1,i,j);
    tmax[k]:=max(tmax[k*2],tmax[k*2+1]);
end;

procedure swap (var a,b:longint);
var tm:longint;
begin
    tm:=a;
    a:=b;
    b:=tm;
end;

procedure rf;
var i,u,v,res,tm:longint;
begin
    readln (n,q);
    for i:=1 to n do read (a[i]);
    build (1,1,n);
    readln;
    while q>0 do
    begin
        readln (u,v);
        v:=u+v-1;
        res:=timmax(1,u,v)+1;
        writeln (res);
        gt:=res;
        update (1,u,v);
        dec (q);
    end;
end;

begin
    assign (input,fi); reset (input);
    assign (output,fo); rewrite (output);
    rf;
    close (input); close (output);
end.
