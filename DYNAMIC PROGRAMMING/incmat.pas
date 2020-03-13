uses math;
const fi='INCMAT.inp';
      fo='INCMAT.out';
      maxn=trunc(1e6+2);
type rec=record
     u,v,x,y,gt:longint;
     end;
var n,q,m,res:longint;
c,d,s,ul,br:array of array of longint;
b,lmax,rmax,a:array [0..maxn] of longint;
f:array [1..maxn] of rec;

procedure rf;
var i,u,v:longint;
begin
    readln (m,n);
end;

procedure pr;
var i,t1,t2:longint;
begin
    for i:=1 to n do read (a[i]);
    readln;
    readln (q);
    for i:=1 to q do
    begin
        readln (t1,f[i].u,t2,f[i].v,f[i].gt);
        inc(b[f[i].u],f[i].gt);
        dec(b[f[i].v+1],f[i].gt);
    end;

    for i:=1 to n do
     b[i]:=b[i-1]+b[i];
    for i:=1 to n do
     a[i]:=a[i]+b[i];
    for i:=1 to n do
     lmax[i]:=max(lmax[i-1],a[i]);
    for i:=n downto 1 do
     rmax[i]:=max(rmax[i+1],a[i]);

    res:=maxlongint;
    for i:=1 to q do
    begin
        res:=min(res,max((lmax[n]-f[i].gt),max(lmax[f[i].u-1],rmax[f[i].v+1])));
        write;
    end;
    write (res);
end;

procedure pr2;
var i,j,t1,t2,t3,t4,t5,x,y,u,v,tm:longint;
begin
    setlength(c,m+3,n+3);
    setlength(d,m+3,n+3);
    setlength(ul,m+3,n+3);
    setlength(br,m+3,n+3);
    setlength(s,m+3,n+3);

    for i:=1 to m do
    begin
        for j:=1 to n do read (c[i,j]);
        readln;
    end;
    readln (q);
    res:=maxlongint;
    for i:=1 to q do
    begin
        readln (f[i].x,f[i].y,f[i].u,f[i].v,f[i].gt);
        inc (d[f[i].x,f[i].y],f[i].gt);
        dec (d[f[i].x,f[i].v+1],f[i].gt);
        dec (d[f[i].u+1,f[i].y],f[i].gt);
        inc (d[f[i].u+1,f[i].v+1],f[i].gt);
    end;

    for i:=1 to m do
     for j:=1 to n do
      s[i,j]:=s[i-1,j]+s[i,j-1]-s[i-1,j-1]+d[i,j];

    for i:=1 to m do
     for j:=1 to n do
      c[i,j]:=c[i,j]+s[i,j];

    for i:=1 to m do
     for j:=1 to n do
      ul[i,j]:=max(c[i,j],max(ul[i-1,j],ul[i,j-1]));

    for i:=m downto 1 do
     for j:=n downto 1 do
      br[i,j]:=max(c[i,j],max(br[i+1,j],br[i,j+1]));

    res:=maxlongint;
    for i:=1 to q do
    begin
        x:=f[i].x; y:=f[i].y; u:=f[i].u; v:=f[i].v;
        t1:=ul[m,y-1];
        t2:=ul[x-1,n];
        t3:=br[1,v+1];
        t4:=br[u+1,1];
        t5:=ul[m,n]-f[i].gt;
        tm:=max(t1,max(t2,max(t3,max(t4,t5))));
        res:=min(res,tm);
    end;
    write (res);
end;

begin
    assign (input,fi); reset (input);
    assign (output,fo); rewrite (output);
    rf;
    if m=1 then pr else pr2;
    close (input); close (output);
end.
